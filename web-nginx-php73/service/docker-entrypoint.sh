#!/bin/sh

user=$(ls /home)
if [ ! $DASFLAG ]; then
    if [ ! $FLAG ]; then
        if [ ! $GZCTF_FLAG ]; then
            echo flag{TEST_Dynamic_FLAG} | tee /home/$user/flag /flag
        else
            echo $GZCTF_FLAG | tee /home/$user/flag /flag
        fi
    else
        echo $FLAG | tee /home/$user/flag /flag
    fi
else
    echo $DASFLAG | tee /home/$user/flag /flag
fi