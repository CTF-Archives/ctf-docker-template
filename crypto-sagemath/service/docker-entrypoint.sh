#!/bin/sh

socat -v -s TCP4-LISTEN:9999,tcpwrap=script,reuseaddr,fork EXEC:"sudo sage /main.sage",pty,ctty,setsid,stderr