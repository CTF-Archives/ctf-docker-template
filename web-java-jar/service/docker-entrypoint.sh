#!/bin/sh

echo $FLAG > /flag

export FLAG=not_flag
FLAG=not_flag

java -jar /app/test.jar