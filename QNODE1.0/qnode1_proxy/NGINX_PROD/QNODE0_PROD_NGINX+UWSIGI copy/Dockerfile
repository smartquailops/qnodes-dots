FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="smartquail.io"



COPY default.conf /etc/nginx/conf.d/
COPY options-ssl-nginx.conf /etc/nginx/
COPY hsts.conf /etc/nginx/
COPY default.conf.tpl /customization/
COPY run.sh /customization/


COPY ./ssl/qnode0_app.crt /etc/nginx/ssl/qnode0_app.crt
COPY ./ssl/qnode0_app.key /etc/nginx/ssl/qnode0_app.key
COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

EXPOSE 80

ENV LISTEN_PORT=80
ENV NGINX_PROXY=http://qnode0_app:9000
ENV APP_HOST=qnode0_app
ENV APP_PORT=9000

USER root
RUN apk add --no-cache openssl
RUN  chmod +x /customization/run.sh

RUN mkdir -p /qnode0.0_app/qnode0_app/staticfiles && \
    chmod 755 /qnode0.0_app/qnode0_app/staticfiles && \
    chmod 755 /etc/nginx/ssl/ && \
    mkdir -p /qnode0.0_app/qnode0_app/mediafiles && \
    chmod 755 /qnode0.0_app/qnode0_app/mediafiles && \

    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/ssl/ssl-dhparams.pem && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /qnode0.0_app/qnode0_app/staticfiles
VOLUME /qnode0.0_app/qnode0_app/mediafiles

USER nginx
#ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/customization/run.sh"]