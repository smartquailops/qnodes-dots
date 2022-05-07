server {
    listen                     ${LISTEN_PORT};
    server_name                127.0.0.1 ${domain} www.${domain}; 

    location /.well-known/acme-challenge/ {
        root /var/www/certbot/${domain};
    }

     location / {
        return 301 https://$host$request_uri;
    }
    
    location /static {
       alias /qnode0.0_app/qnode0_app/staticfiles;
       client_max_body_size    1000M;
    }

    location /media {
       alias  /qnode0.0_app/qnode0_app/media;
       client_max_body_size    1000M;
    }

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    1000M;
    } 

server {
    listen       443 ssl;
    server_name  ${domain} www.${domain};

    ssl_certificate /etc/nginx/ssl/dummy/${domain}/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/dummy/${domain}/privkey.pem;

    include    /etc/nginx/options-ssl-nginx.conf;

    ssl_dhparam   /etc/nginx/ssl/ssl-dhparams.pem;

    include    /etc/nginx/hsts.conf;

    location / {
        root     /var/www/html/${domain};
    }   

}


    




