#!/bin/sh

# Get the user
user=$(ls /home)

# Check the environment variables for the flag and assign to INSERT_FLAG
if [ "$DASFLAG" ]; then
    INSERT_FLAG="$DASFLAG"
    export DASFLAG=no_FLAG
    DASFLAG=no_FLAG
elif [ "$FLAG" ]; then
    INSERT_FLAG="$FLAG"
    export FLAG=no_FLAG
    FLAG=no_FLAG
elif [ "$GZCTF_FLAG" ]; then
    INSERT_FLAG="$GZCTF_FLAG"
    export GZCTF_FLAG=no_FLAG
    GZCTF_FLAG=no_FLAG
else
    INSERT_FLAG="flag{TEST_Dynamic_FLAG}"
fi

# 将FLAG写入文件 请根据需要修改
echo $INSERT_FLAG | tee /flag

chmod 744 /flag

# 通过socat转发Python会话
# TCP4-LISTEN:9999 服务将会转发到9999端口
# reuseaddr 启用端口复用，便于多用户同时连接同一个端口
# [可选]stderr 将脚本的stderr错误输出流也定向到用户会话
socat -v -s TCP4-LISTEN:9999,tcpwrap=script,reuseaddr,fork EXEC:"python3 -u /home/ctf/server.py",stderr