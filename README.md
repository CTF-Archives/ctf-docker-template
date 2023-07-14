# CTF 动态靶机模板

对于各个模板的详细适用情况，请见各情景的文件夹内的README

本仓库内的Docker容器模板均支持
- `$GZCTF_FLAG`
- `$DASCTF`
- `$FLAG`

三种动态flag部署方式，支持GZCTF、CTFd、安恒DASCTF等支持Docker动态部署题目靶机的平台

**有问题请开issue，好用请点star**

## 关于每个模板的文件夹结构

这里以 `crypto-python_3.8-no_socket` 模板为例

```plaintext
.
├── docker
│   └── docker-compose.yml
├── Dockerfile
├── README.md
├── service
│   └── docker-entrypoint.sh
└── src
    └── main.py
```
`docker` 文件夹内存放与docker有关的文件，如 `docker-compose.yml` 文件，内部已经设置好了端口转发和测试用flag，便于测试容器环境

`Dockerfile` 为docker容器编译文件，用于设计docker容器，可在其中设置换源、增添软件包等等

`service` 文件夹内存放着与服务有关的文件，如 `docker-entrypoint.sh` 用于定义容器的入口点

`src` 文件夹内存放着题目的项目源码，也可以是pwn题目的二进制文件，即为题目的相关文件

`config` 文件夹内存放着容器内服务相关的配置文件，如 `xinetd` 的配置文件，`nginx` 的配置文件等等

## About no_socket with crypto

`no_socket`指的是源代码中没有引入`socket`相关的库，当希望达到的效果是类似于当用户通过特定端口连接到靶机时，就运行python代码，并将代码的运行界面转发给用户。如果已经引入了`socket`相关的库，请直接使用如`python app.py`这类语句启动python程序，并让程序自行监听特定端口

## 关于软件源换源

环境中涉及软件包处理的情形，如apt、yum，均已换源为ustc源，如不处于中国大陆网络环境/启用了全局代理环境，请自行修改相关换源语句，避免由于还原带来的负优化

## 关于容器无限重启，看日志发现sh文件错误

常见以下报错：
```shell
/docker-entrypoint.sh: line 2: $'\r': command not found
/docker-entrypoint.sh: line 26: syntax error: unexpected end of file
```
这是因为Windows与Linux文件编码在换行的操作不一样，导致Linux的shell无法解析脚本文件。解决方案如下
```shell
sed -i ""s/\r//"" docker-entrypoint.sh
```
即通过正则匹配，直接替换掉 `\r` 字符，不过此方案不一定能完全解决问题

建议直接在linux下执行 `git clone` 操作，或者直接从github下载zip版本的源码，避免一些奇奇怪怪的编码问题

## 如有其他问题

欢迎直接提issue，一般于三个工作日内就能有回复，也请遇到问题的时候能提供当前的整体题目文件，以及具体的报错/信息

也欢迎通过 [CTF快速入门手册 - QQ群聊](http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=wJ35e-T-qSlU7Y3Cs-PAasrAvZfRSc9k&authKey=WNEQbZUpolxgfKjUHHoUIoTBvSnvk2jZtcyWlhaDcUZ6ZYGgvywqi1ah5D7UwUrg&noverify=0&group_code=590430891) 联系维护人员寻求帮助

## A little advertisement

某 [Randark-JMT](https://github.com/Randark-JMT) 可以无偿为CTF平台搭建、题目打包提供一定帮助，欢迎联系😘