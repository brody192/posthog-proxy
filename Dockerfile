FROM ubuntu:latest

ADD nginx.conf.template nginx.conf.template

RUN apt-get update

RUN apt-get install -y gettext-base

ARG SERVER_NAME

ARG PORT

RUN envsubst '$SERVER_NAME,$PORT' < nginx.conf.template > nginx.conf

FROM nginx:latest

COPY --from=0 nginx.conf /etc/nginx/nginx.conf

RUN cat /etc/nginx/nginx.conf
