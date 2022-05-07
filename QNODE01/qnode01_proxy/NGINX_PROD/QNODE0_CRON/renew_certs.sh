#!/bin/sh

cd /workdir
echo "Renewing Let's Encrypt Certificates... (`date`)"
docker-compose run --entrypoint certbot certbot renew
echo "Reloading Nginx configuration"
docker-compose exec -T qnode01_proxy qnode01_proxy -s reload