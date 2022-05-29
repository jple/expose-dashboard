FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/
COPY location_app.conf /etc/nginx/location/
COPY ngx_http_auth_pam_module.so /etc/nginx/modules/
#RUN apt update && apt install -y --no-install-recommends vim 
