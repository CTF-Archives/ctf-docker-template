#!/bin/sh

# Get the user
user=$(ls /home)

# Check the environment variables for the flag and assign to INSERT_FLAG
if [ "$DASFLAG" ]; then
    INSERT_FLAG="$DASFLAG"
elif [ "$FLAG" ]; then
    INSERT_FLAG="$FLAG"
elif [ "$GZCTF_FLAG" ]; then
    INSERT_FLAG="$GZCTF_FLAG"
else
    INSERT_FLAG="flag{TEST_Dynamic_FLAG}"
fi

# 将FLAG写入文件 请根据需要修改
echo $INSERT_FLAG | tee /flag

# 控制flag和项目源码的权限
chmod 744 /flag
chmod 740 /app/*

# 启动flask，并同时开启debug模式
# cd /app && flask --debug run -h 0.0.0.0 -p 8080

# 在无debug参数下启动flask
cd /app && flask run -h 0.0.0.0 -p 8080