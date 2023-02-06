#!/bin/sh

socat -v -s TCP4-LISTEN:9999,tcpwrap=script,reuseaddr,fork EXEC:"python3 /app/main.py",pty,ctty,setsid,stderr