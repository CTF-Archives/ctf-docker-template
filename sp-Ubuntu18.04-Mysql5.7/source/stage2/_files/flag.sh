#!/bin/bash

if [[ -z $FLAG_COLUMN ]]; then
	FLAG_COLUMN="flag"
fi

if [[ -z $FLAG_TABLE ]]; then
	FLAG_TABLE="flag"
fi

# 修改数据库中的 FLAG 
mysql -e "USE ctftraining;ALTER TABLE FLAG_TABLE CHANGE FLAG_COLUMN $FLAG_COLUMN CHAR(128) NOT NULL DEFAULT 'not_flag';ALTER TABLE FLAG_TABLE RENAME $FLAG_TABLE;INSERT $FLAG_TABLE VALUES('$FLAG');" -uroot -proot

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh