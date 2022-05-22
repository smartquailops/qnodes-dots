server {
    listen                     ${LISTEN_PORT};
    server_name                127.0.0.1 localhost; 
    
location /static {
    alias /qnode1.0_app/qnode10_app/staticfiles;
    client_max_body_size    1000M;
}

location /media {
    alias  /qnode1.0_app/qnode10_app/mediafiles;
    client_max_body_size    1000M;
}

    location / {
        #uwsgi_pass               unix:/qnode1.0_app/qnode10_app/qnode10_app.sock;
        uwsgi_pass                ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    1000M;
    }    
}





    




