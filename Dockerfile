FROM node:alpine as Build
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=Build /usr/app/build /usr/share/nginx/html