FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy Angular build files
COPY github-option-three-app/dist/* /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
