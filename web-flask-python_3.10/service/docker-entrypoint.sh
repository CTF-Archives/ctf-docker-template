#!/bin/sh

echo $FLAG > /flag

chmod 777 /flag
chmod 740 /app/app.py

export FLAG=not_flag
FLAG=not_flag

# flask --debug run -h 0.0.0.0 -p 8080
# python3 
cd /app && flask run -h 0.0.0.0 -p 8080