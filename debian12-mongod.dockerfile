FROM debian:bookworm

RUN apt update -y && \
    apt install -y libcurl4 && \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY bin/mongod /usr/local/bin/

RUN mkdir -p /data/db && \
    chmod -R 750 /data && \
    chown -R 999:999 /data

USER 999

EXPOSE 27017/tcp
CMD [ "/usr/local/bin/mongod" ]
