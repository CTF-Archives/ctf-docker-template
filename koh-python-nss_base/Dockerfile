FROM python:3-slim

RUN useradd -m ctf

ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /home/ctf

RUN cp -R /lib* /home/ctf

RUN mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/*

RUN mkdir /home/ctf/usr/local -p
RUN cp -R /usr/local/* /home/ctf/usr/local/

RUN rm -rf /home/ctf/usr/local/etc && \
    rm -rf /home/ctf/usr/local/games/ && \
    rm -rf /home/ctf/usr/local/man && \
    rm -rf /home/ctf/usr/local/share && \
    rm -rf /home/ctf/usr/local/src && \
    rm -f /home/ctf/usr/local/bin/*

RUN rm -f /home/ctf/usr/local/lib/python3.10/sockert.py && \
    rm -f /home/ctf/usr/local/lib/python3.10/sockertserver.py && \
    rm -rf /home/ctf/usr/local/lib/python3.10/site-package && \
    rm -f /home/ctf/usr/local/lib/python3.10/subprocess.py

RUN cp /usr/local/bin/python /home/ctf/usr/local/bin/python

RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf

RUN pip install flask

COPY ./service/start.sh /start.sh
COPY ./src/ /app/
RUN chmod +x /start.sh

EXPOSE 5000

CMD ["/start.sh"]
