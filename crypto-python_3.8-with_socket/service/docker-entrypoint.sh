#!/bin/sh

# 删除启动脚本，以防非预期
rm -f /app/docker-entrypoint.sh

# 容器启动后，运行项目
python3 /app/main.py