FROM nginx:latest

COPY --from=trunktest.trunk * /trunk

ENV SERVER_NAME=localhost
ENV SERVER_PORT=80

ENV APP_NAME=app
ENV APP_PORT=9000

ENV WEB_ROOT=/var/www/html/public

RUN /trunk/extras/nginx
