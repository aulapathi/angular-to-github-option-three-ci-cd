# ---------- Stage 1: Build Angular ----------
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build -- --configuration production


# ---------- Stage 2: Serve with Nginx ----------
FROM nginx:alpine

COPY --from=build /app/dist/github-option-three-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

