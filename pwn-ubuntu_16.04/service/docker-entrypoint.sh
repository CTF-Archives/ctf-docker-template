#!/bin/sh

echo $FLAG > /home/ctf/flag

export $FLAG=no_FLAG
FLAG=no_FLAG

/etc/init.d/xinetd start;
sleep infinity;