FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y squid && \
    rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Port
EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
