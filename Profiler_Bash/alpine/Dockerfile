From alpine:3.11.3
RUN apk add jq bash bc util-linux
COPY rudataall.sh /usr/local/bin
COPY entrypoint.sh /usr/local/bin
COPY run_commands.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
