# Create custom conda image
docker build -f containers/conda/conda.dockerfile -t custom_conda .

# Create network
docker network create -d bridge dashnet

# Create containers
docker run -d -it --network="dashnet" --name conda custom_conda /bin/bash
docker run -d -it --network="dashnet" -p 8080:80 --name nginx nginx
docker run -d -it --network="dashnet" --name ldap bitnami/openldap

# Start containers
docker start conda nginx ldap


# ---
# Setup gunicorn server in conda container
# ---
docker exec -it conda /bin/bash

# configure gunicorn start script
source activate explose_plot
/root/bin/gunicorn_start


# ---
# Setup nginx container
# ---
docker cp containers/nginx/default.conf nginx:/etc/nginx/conf.d/
docker exec nginx mkdir etc/nginx/location/
docker cp containers/nginx/location_app.conf nginx:/etc/nginx/location/
nginx -s reload

