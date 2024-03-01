FROM node:lts-alpine AS build
WORKDIR /app
COPY . .

RUN echo "PUBLIC_INSTANCE_ID=103345345345" > .env

RUN npm i
RUN npm run build

FROM httpd:2.4 AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80