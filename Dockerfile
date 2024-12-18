FROM --platform=$BUILDPLATFORM mkassaian/docker-challenge:latest

EXPOSE 80

RUN sed -i \
        -e 's/localhost:8002/localhost:8003/' \
        -e 's/localhost:8001/localhost:8002/' \
        -e 's/localhost:8000/localhost:8001/' \
        /usr/local/etc/haproxy/haproxy.cfg && \
    sed -i -e 's/it works!/it works! solved by Abhishek Sharma/' /var/www/html/index.html && \
    sed -i -e 's/nginxo2.conf/nginx02.conf/' /entrypoint.sh

COPY solution.txt /solution.txt