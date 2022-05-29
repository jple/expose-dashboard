FROM nginx:latest
SHELL ["/bin/bash", "-c"]

COPY default.conf /etc/nginx/conf.d/
COPY location_app.conf /etc/nginx/location/

# test PAM auth
COPY ngx_http_auth_pam_module.so /etc/nginx/modules/

# test basic auth
COPY .htpasswd /etc/nginx/

#RUN apt update && apt install -y --no-install-recommends vim 

# marche pas : il faut le placer au début du fichier
# mais, pb de compile .so : invalid ELF header" 
#RUN echo "load_module modules/ngx_http_auth_pam_module.so;" >> /etc/nginx/nginx.conf

#RUN nginx -s reload