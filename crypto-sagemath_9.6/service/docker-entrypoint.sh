#!/bin/sh

# 删除启动脚本，以防非预期
rm -f /home/sage/docker-entrypoint.sh

# 通过socat转发SageMath会话
# TCP4-LISTEN:9999 服务将会转发到9999端口
# reuseaddr 启用端口复用，便于多用户同时连接同一个端口
# [可选]stderr 将脚本的stderr错误输出流也定向到用户会话
socat -v -s TCP4-LISTEN:9999,tcpwrap=script,reuseaddr,fork EXEC:"sage /home/sage/main.sage"