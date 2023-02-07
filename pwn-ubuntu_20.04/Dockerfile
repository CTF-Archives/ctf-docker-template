FROM ubuntu:20.04

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更新，并安装相关依赖
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get update && apt-get install -y lib32z1 xinetd wget netcat curl lsof systemctl supervisor

# 新建用户，并进行权限限制
RUN useradd -m ctf
WORKDIR /home/ctf

# 复制相关glibc，并处理环境
RUN cp -R /usr/lib* /home/ctf

RUN mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/*

RUN mkdir /home/ctf/bin && \
    cp /bin/sh /home/ctf/bin && \
    cp /bin/ls /home/ctf/bin && \
    cp /bin/cat /home/ctf/bin 

#remove not have
RUN rm -rf /home/ctf/lib/apt /home/ctf/lib/cpp /home/ctf/lib/gnupg /home/ctf/lib/init /home/ctf/lib/lsb /home/ctf/lib/os-release /home/ctf/lib/rsyslog /home/ctf/lib/tc /home/ctf/lib/udev /home/ctf/lib/binfmt.d /home/ctf/lib/dpkg /home/ctf/lib/gold-ld /home/ctf/lib/initramfs-tools /home/ctf/lib/ldscripts /home/ctf/lib/mime /home/ctf/lib/python2.7 /home/ctf/lib/systemd /home/ctf/lib/terminfo /home/ctf/lib/compat-ld /home/ctf/lib/gcc /home/ctf/lib/ifupdown /home/ctf/lib/insserv /home/ctf/lib/locale /home/ctf/lib/modules-load.d /home/ctf/lib/python3 /home/ctf/lib/tar /home/ctf/lib/tmpfiles.d

# 部署xinetd服务
COPY ./service/ctf.xinetd /etc/xinetd.d/ctf
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

# 复制容器启动脚本
COPY ./service/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# 部署程序，并初始化flag
COPY ./src/ /home/ctf/
RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf && \
    touch /home/ctf/flag && \
    chmod 777 /home/ctf/flag

EXPOSE 9999
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]

