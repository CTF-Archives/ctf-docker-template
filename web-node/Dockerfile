FROM node

WORKDIR /app

# 把package.json和package-lock.json复制到工作目录
COPY src/package*.json ./

# 安装app依赖
RUN npm i

# 如果你的应用在生产环境中运行，你也可以使用
# RUN npm ci --only=production

# 把应用源码复制到工作目录
COPY ./src/app.js .
COPY ./service/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 5000

# 定义Docker容器启动时运行的命令
CMD /start.sh
