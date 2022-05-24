FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/
COPY location_app.conf /etc/nginx/location/