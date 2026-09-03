FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
RUN \
    apk add --no-cache python3 && \
    install -d -m 0755 -o nobody -g nobody /sqlmap /.local && \
    wget -q -O - https://github.com/sqlmapproject/sqlmap/tarball/master | tar -xz --strip-components=1 -C /sqlmap -f -

USER nobody
WORKDIR /sqlmap
VOLUME /.local
ENTRYPOINT ["/usr/bin/python3", "sqlmap.py"]
