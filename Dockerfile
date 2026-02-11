# Stage 1
FROM node:18-alpine AS build

WORKDIR /app

COPY github-option-three-app/package*.json ./
RUN npm install

COPY github-option-three-app/ .
RUN npm run build -- --configuration production

# Stage 2
FROM nginx:alpine

RUN npm run build -- /app/dist/github-option-three-app

COPY --from=build /app/dist/github-option-three-app /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

