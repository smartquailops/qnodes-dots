FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="smartquail.io"


COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh


ENV LISTEN_PORT=80
ENV NGINX_PROXY=http://qnode11_app:9000
ENV APP_HOST=qnode11_app
ENV APP_PORT=9000

USER root

RUN mkdir -p /qnode1.1_app/qnode11_app/staticfiles && \
    chmod 755 /qnode1.1_app/qnode11_app/staticfiles && \
    mkdir -p /qnode1.1_app/qnode11_app/mediafiles && \
    chmod 755 /qnode1.1_app/qnode11_app/mediafiles && \

    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /qnode1.1_app/qnode11_app/staticfiles
VOLUME /qnode1.1_app/qnode11_app/mediafiles

USER nginx
#ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/run.sh"]