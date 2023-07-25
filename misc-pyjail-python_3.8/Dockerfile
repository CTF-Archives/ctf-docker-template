FROM ubuntu:20.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 xinetd && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip3 install pillow -i https://pypi.tuna.tsinghua.edu.cn/simple


COPY ./src/ctf.xinetd /etc/xinetd.d/ctf
COPY ./service/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

COPY ./src/server.py /home/server.py

RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail && chmod +x /docker-entrypoint.sh && chmod -R 777 /home/
CMD ["/docker-entrypoint.sh"]

EXPOSE 9999
