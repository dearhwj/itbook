# 如何在Ubuntu获取最新NVIDIA Inte显卡驱动程序

[参考资料 https://jingyan.baidu.com/article/a17d5285e9efe48098c8f2b9.html](https://jingyan.baidu.com/article/a17d5285e9efe48098c8f2b9.html)


这个PPA添加到您的系统上，打开一个终端窗口，运行以下命令：

```
sudo add-apt-repository ppa:graphics-drivers/ppa
```

之后，你有，运行以下命令来下载最新的软件包列表：

```
sudo apt-get install nvidia-
```

举个例子你可以使用下面的命令安装 nvidia-361

```
sudo apt-get install nvidia-361
```