FROM alpine:latest

RUN apk update && \
    apk add git curl libstdc++ && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-arm64" \
        --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz

RUN adduser -Ss /bin/sh code

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT "/root/entrypoint.sh"

CMD [ "code", "tunnel", "--accept-server-license-terms" ]
