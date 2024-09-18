FROM sagemath/sagemath:9.6

# 制作者信息
LABEL auther_template="CTF-Archives"

# 由于权限限制，暂时切换到root账户
USER root

# apt更换镜像源，并更新软件包列表信息
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@//.*security.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN apt-get update 

# 通过apt，安装socat用于服务转发
RUN apt-get install -y socat 

# 出于安全考虑，切换为sage低权限账户
USER sage

# 安装必要的python依赖库
RUN sage --python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    pycryptodome gmpy2 

# 拷贝源码
COPY ./src/main.sage /home/sage

# 拷贝启动脚本至根目录
COPY ./service/docker-entrypoint.sh /home/sage/docker-entrypoint.sh

EXPOSE 9999

# 指定容器入口点
ENTRYPOINT ["/bin/bash","/home/sage/docker-entrypoint.sh"]