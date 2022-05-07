FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="smartquail.io"


COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh


ENV LISTEN_PORT=80
ENV NGINX_PROXY=http://qnode01_app:9000
ENV APP_HOST=qnode01_app
ENV APP_PORT=9000

USER root

RUN mkdir -p /qnode0.1_app/qnode01_app/staticfiles && \
    chmod 755 /qnode0.1_app/qnode01_app/staticfiles && \
    mkdir -p /qnode0.1_app/qnode01_app/mediafiles && \
    chmod 755 /qnode0.1_app/qnode01_app/mediafiles && \

    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /qnode0.1_app/qnode01_app/staticfiles
VOLUME /qnode0.1_app/qnode01_app/mediafiles

USER nginx
#ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/run.sh"]