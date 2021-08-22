From ubuntu
RUN apt-get -y update \
    && apt-get install -y jq bc util-linux \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y stress-ng
RUN apt-get install -y sysbench
RUN apt install bc
COPY ./rudataall.sh /usr/local/bin
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
CMD ["6000"]
