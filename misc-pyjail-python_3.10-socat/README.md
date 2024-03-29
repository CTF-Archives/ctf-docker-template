# misc-pyjail-python_3.10

感谢 [@gtg2619](https://github.com/gtg2619) 师傅对此模板的贡献

## 环境说明

提供 `Python 3.10` 的基础环境，并已经添加 `pycryptodome` 库，并基于 `xinetd` 实现服务转发，默认暴露端口位于 9999

实现：当选手连接到对应端口（默认为 9999 端口，默认选手使用 `netcat` ）的时候，运行 `server.py`，并将会话转发至选手的连接

镜像做到：

- 选手通过端口连接到容器 / 靶机
- xinted 服务检测到连接，启动一个 `python3` 会话
- `python3` 通过参数 `-u /home/ctf/server.py` 限制了程序运行时的账户权限为 `ctf`，然后在限制环境中启动程序
- `xinted` 将程序会话转发给选手的连接

## 如何使用

将程序文件放入 `./src` 目录即可，文件名请修改为 `server.py` 作为文件名，便于镜像定位程序位置

如果需要更改为自己的文件名，需要在 `./config/ctf.xinetd`、`./Dockerfile` 和 `./service/docker-entrypoint.sh` 中进行修改

程序放置进 `./src` 目录之后，执行

```shell
docker build .
```

即可开始编译镜像

也可以在安放好程序文件之后，直接使用 `./docker/docker-compose.yml` 内的 `docker-compose` 文件实现一键启动测试容器

```shell
cd ./docker
docker-compose up -d
```
