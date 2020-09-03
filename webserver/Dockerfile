# Dockerfile for containerize_nginx
FROM nginx:1.18.0-alpine

LABEL Author="Facu de la Cruz"
LABEL Email="fmdlc.unix@gmail.com"

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/proxy.conf /etc/nginx/conf.d/proxy.conf

# We don't want the default nginx configuration file
RUN rm -f /etc/nginx/conf.d/default.conf

# We run with nginx user (UID: 101)
USER 101

# Documentation only: We expose TCP/80 - TCP/443
EXPOSE 80
EXPOSE 443

# We want to handle SIGINT to stop the container
STOPSIGNAL SIGINT
