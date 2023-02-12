# CTF 动态靶机模板

具体使用说明请进入对应情景的文件夹内查看

动态flag的部署形式均为以`$FLAG`环境变量传给容器

有问题请开issue，好用请点star

### ABout no_socket

`no_socket`指的是源代码中没有引入`socket`相关的库，希望达到的效果是类似于当用户通过特定端口连接到靶机时，就运行python代码，并将代码的运行界面转发给用户。如果已经引入了`socket`相关的库，请直接使用如`python app.py`这类语句启动python程序，并让程序自行监听特定端口