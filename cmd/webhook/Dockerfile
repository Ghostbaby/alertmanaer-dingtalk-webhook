FROM        quay.io/prometheus/busybox:latest
MAINTAINER  Herman Zhu <zhuhuijunzhj@gmail.com>

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY webhook  /bin/webhook

EXPOSE      8080
ENTRYPOINT  [ "/bin/webhook" ]
