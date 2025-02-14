FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c
RUN \
    apk add --no-cache python3 && \
    install -d -m 0755 -o nobody -g nobody /sqlmap /.local && \
    wget -q -O - https://github.com/sqlmapproject/sqlmap/tarball/master | tar -xz --strip-components=1 -C /sqlmap -f -

USER nobody
WORKDIR /sqlmap
VOLUME /.local
ENTRYPOINT ["/usr/bin/python3", "sqlmap.py"]
