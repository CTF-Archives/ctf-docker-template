# CTF 动态靶机模板

对于详细的适用情况，请见各情景的文件夹内的README

本仓库内的Docker容器模板均支持`$GZCTF_FLAG`、`$DASCTF`、`$FLAG`三种动态flag部署方式，支持GZCTF、CTFd、安恒DASCTF等典型支持Docker动态部署题目靶机的平台

有问题请开issue，好用请点star

### ABout no_socket with crypto

`no_socket`指的是源代码中没有引入`socket`相关的库，当希望达到的效果是类似于当用户通过特定端口连接到靶机时，就运行python代码，并将代码的运行界面转发给用户。如果已经引入了`socket`相关的库，请直接使用如`python app.py`这类语句启动python程序，并让程序自行监听特定端口