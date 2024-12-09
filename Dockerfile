FROM abhis6898/docker-challenge-updated:latest

USER root

EXPOSE 80

RUN apt update -y && \
    apt install --no-install-recommends procps curl -y && \
    sed -i \
        -e 's/localhost:8002/localhost:8003/' \
        -e 's/localhost:8001/localhost:8002/' \
        -e 's/localhost:8000/localhost:8001/' \
        /usr/local/etc/haproxy/haproxy.cfg && \
    sed -i -e 's/it works!/it works! solved by Abhishek Sharma/' /var/www/html/index.html

COPY solution.txt /solution.txt

ENTRYPOINT []
# Create a startup script
RUN echo '#!/bin/bash \n\
nginx -c /etc/nginx/nginx01.conf && \n\
nginx -c /etc/nginx/nginx02.conf && \n\
nginx -c /etc/nginx/nginx03.conf && \n\
haproxy -f /usr/local/etc/haproxy/haproxy.cfg && tail -f /dev/null' > /start.sh \
&& chmod +x /start.sh \
&& apt-get install -y dos2unix && dos2unix /start.sh

CMD [ "./start.sh" ]