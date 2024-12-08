FROM mkassaian/docker-challenge

EXPOSE 80

# Modify the ports in the HAProxy configuration
RUN sed -i \
    -e 's/localhost:8000/localhost:8001/' \
    -e 's/localhost:8001/localhost:8002/' \
    -e 's/localhost:8002/localhost:8003/' \
    /usr/local/etc/haproxy/haproxy.cfg

# Run the nginx service
CMD ["nginx", "-c", "/etc/nginx/nginx02.conf"]

# Run HAProxy with the updated configuration
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

# Modify http response
RUN sed -i \
    -e 's/it works!/it works! solved by Abhishek Sharma/' \
    /var/www/html/index.html

COPY solution.txt /solution.txt