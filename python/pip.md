# PIP


## Python的包管理
Python的包管理工具常见的有easy_install, setuptools, 还有pip, distribute可以看到distribute是setuptools的替代方案，pip是easy_install的替代方案. 而setuptools 和 easy_install 已经越来越不被维护了，所以建议大家试用他们的替代版, 而如果要说 distribute 和 pip 的区别，那么就是pip 的底层实现调用了 distribute 或者 setuptools


## PIP的命令
```
pip  -v

Usage:
  pip <command> [options]

Commands:
  install                     Install packages.
  download                    Download packages.
  uninstall                   Uninstall packages.
  freeze                      Output installed packages in requirements format.
  list                        List installed packages.
  show                        Show information about installed packages.
  check                       Verify installed packages have compatible dependencies.
  search                      Search PyPI for packages.
  wheel                       Build wheels from your requirements.
  hash                        Compute hashes of package archives.
  completion                  A helper command used for command completion.
  help                        Show help for commands.****

```

## FAQ

1. site-packages 和 dist-packages 的区别

	sudo apt-get install 安装的package存放在 /usr/lib/python2.7/dist-packages目录中

	pip 或者 easy_install安装的package存放在/usr/local/lib/python2.7/dist-packages目录

	手动从源代码安装的package存放在site-packages目录中

```
>>> import site; site.getsitepackages()
['/usr/local/lib/python2.7/dist-packages', '/usr/lib/python2.7/dist-packages']

```
1. 同时装了Python3和Python2，怎么用pip？

	python3的用pip3
	在再说为什么题主使用 pip install 想给 Python3 安装这个做法是错的：看我上面执行了两个 pip --version 命令和 pip3 --version 命令，明确的显示了他们安装包的 site-packages 路径，你默认的 pip 是 Python2 下的，安装的包当然安装不到 Python3 下面。我为什么要在 /usr/bin 下创建一个 pip3 链接，因为同一个目录下，只能存在一个 pip , 已经存在了指向 Python2 的 pip，新来的 pip 就不能再用这个名字，否则覆盖就造成原来 Python2 的 pip 不可用。
