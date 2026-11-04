FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a
RUN \
    apk add --no-cache python3 && \
    install -d -m 0755 -o nobody -g nobody /sqlmap /.local && \
    wget -q -O - https://github.com/sqlmapproject/sqlmap/tarball/master | tar -xz --strip-components=1 -C /sqlmap -f -

USER nobody
WORKDIR /sqlmap
VOLUME /.local
ENTRYPOINT ["/usr/bin/python3", "sqlmap.py"]
