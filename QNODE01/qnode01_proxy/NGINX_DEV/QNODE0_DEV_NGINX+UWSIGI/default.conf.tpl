server {
    listen                     ${LISTEN_PORT};
    server_name                127.0.0.1; 
    
location /static {
    alias /qnode0.1_app/qnode01_app/staticfiles;
    client_max_body_size    1000M;
}

location /media {
    alias  /qnode0.1_app/qnode01_app/media;
    client_max_body_size    1000M;
}

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    1000M;
    }    

}


    




