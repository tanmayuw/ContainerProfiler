From  ubuntu:18.04
RUN apt-get -y update \
    && apt-get install -y jq bc util-linux \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y stress-ng
RUN apt-get install -y sysbench
COPY ./rudataall.sh /usr/local/bin
COPY entrypoint.sh /usr/local/bin
COPY run_commands.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
