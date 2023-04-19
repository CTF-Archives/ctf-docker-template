#!/bin/sh

user=$(ls /home)
if [ ! $DASFLAG ]; then
    if [ ! $FLAG ]; then
        if [ ! $GZCTF_FLAG ]; then
            echo flag{TEST_Dynamic_FLAG} | tee /home/$user/flag /flag
        else
            echo $GZCTF_FLAG | tee /home/$user/flag /flag
            export GZCTF_FLAG=no_FLAG
            GZCTF_FLAG=no_FLAG
        fi
    else
        echo $FLAG | tee /home/$user/flag /flag
        export FLAG=no_FLAG
        FLAG=no_FLAG
    fi
else
    echo $DASFLAG | tee /home/$user/flag /flag
    export DASFLAG=no_FLAG
    DASFLAG=no_FLAG
fi

/etc/init.d/xinetd start;
sleep infinity;