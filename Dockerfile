FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf
RUN \
    apk add --no-cache python3 && \
    install -d -m 0755 -o nobody -g nobody /sqlmap /.local && \
    wget -q -O - https://github.com/sqlmapproject/sqlmap/tarball/master | tar -xz --strip-components=1 -C /sqlmap -f -

USER nobody
WORKDIR /sqlmap
VOLUME /.local
ENTRYPOINT ["/usr/bin/python3", "sqlmap.py"]
