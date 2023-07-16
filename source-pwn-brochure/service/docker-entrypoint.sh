#!/bin/sh

gcc /home/ctf/test.c -o /home/ctf/test

/etc/init.d/xinetd start;
sleep infinity;
