From alpine:3.9.2
COPY ./profiler .
COPY ./rudataall-psutil.py .
ENV PYTHONUNBUFFERED=1
RUN apk update && apk add python3-dev && apk add linux-headers && apk add util-linux
RUN apk add --no-cache bash
RUN apk add build-base && apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools && pip3 install psutil  
RUN apk del python3-dev 
ENTRYPOINT ["./profiler"]
