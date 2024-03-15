# misc-lsb-dynamic

## 环境说明

实现了基础的 Misc LSB 隐写脚本，并通过 `http.server.SimpleHTTPRequestHandler` 实现了一个简单的 HTTP 服务器

## 如何使用

本模板仅为示例，如果需要修改隐写的基础图像，或者更改隐写逻辑的话，请自行修改 `src/server.py`

执行

```shell
docker build .
```

即可开始编译镜像

也可以在安放好程序文件之后，直接使用 `./docker/docker-compose.yml` 内的 `docker-compose` 文件实现一键启动测试容器

```shell
cd ./docker
docker-compose up -d
```
