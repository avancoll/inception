FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx openssl -y

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default.conf

RUN openssl req -x509 -nodes \
    -out /etc/ssl/avancoll.42.fr.crt \
    -keyout /etc/ssl/avancoll.42.fr.key \
    -subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=avancoll.42.fr/UID=avancoll"

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
