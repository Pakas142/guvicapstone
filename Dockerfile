FROM node:16-alpine as build
WORKDIR /usr/app
COPY . /usr/app
RUN npm install
COPY . .
CMD ["npm", "build;"]



FROM nginx:1.21-alpine
RUN rm /usr/share/nginx/html/index.html
COPY --from=build /usr/app/build/* /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
