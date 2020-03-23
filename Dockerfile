#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
USER root
RUN npm install
RUN npm run build --prod 
#stage 2
FROM nginxinc/nginx-unprivileged
COPY --from=node /app/dist/app1 /usr/share/nginx/html