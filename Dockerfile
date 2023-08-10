FROM alpine:3.18.3@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a
RUN \
    apk add --no-cache python3 && \
    install -d -m 0755 -o nobody -g nobody /sqlmap /.local && \
    wget -q -O - https://github.com/sqlmapproject/sqlmap/tarball/master | tar -xz --strip-components=1 -C /sqlmap -f -

USER nobody
WORKDIR /sqlmap
VOLUME /.local
ENTRYPOINT ["/usr/bin/python3", "sqlmap.py"]
