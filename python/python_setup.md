# Python的安装包
## python的setup.py文件及其常用命令
编写setup.py文件，获取帮助：python setup.py --help-commands

```
[python]   
Standard commands:   
build             build everything needed to install   
build_py          "build" pure [Python](http://www.2cto.com/kf/web/Python/) modules (copy to build directory)   
build_ext         build C/C++ extensions (compile/link to build directory)   
build_clib        build C/C++ libraries used by Python extensions   
build_scripts     "build" scripts (copy and fixup #! line)   
clean             clean up temporary files from 'build' command   
install           install everything from build directory   
install_lib       install all Python modules (extensions and pure Python)   
install_headers   install C/C++ header files   
install_scripts   install scripts (Python or otherwise)   
install_data      install data files   
sdist             create a source distribution (tarball, zip file, etc.)   
register          register the distribution with the Python package index   
bdist             create a built (binary) distribution   
bdist_dumb        create a "dumb" built distribution   
bdist_rpm         create an RPM distribution   
bdist_wininst     create an executable installer for MS Windows   
upload            upload binary package to PyPI   
check             perform some checks on the package   
Extra commands:   
rotate            delete older distributions, keeping N newest files   
develop           install package in 'development mode'   
setopt            set an option in setup.cfg or another config file   
saveopts          save supplied options to setup.cfg or other config file   
egg_info          create a distribution's .egg-info directory   
install_egg_info  Install an .egg-info directory for the package   
alias             define a shortcut to invoke one or more commands   
easy_install      Find/get/install Python packages   
bdist_egg         create an "egg" distribution   
test              run unit tests after in-place build 


```



standard commands(标准命令)是distutils内建命令，而Extra commands（附加命令）是像

setuptools这样的第三方包创建的。

命令详解：  
1.sdist：用来创建一个[源码](http://www.2cto.com/ym/)包，在windows下为zip格式，linux下为tag.gz格式 。  
setup.py示例： 
``` 
from setuptools import setup  
setup(name='xxx',version='0.1.1')  
```
打包命令：python setup.py sdist  
distutils将浏览包的路径，查找包含在档案中的文件，包括：  
1）所有py_modules、packages和scripts选项隐含的python源文件  
2）所有在ext_modules选项中列出的C源文件  
3）符合test/test*.py模式的文件  
4）README、README.txt、setup.py和setup.cfg文件

如果需要包含更多文件，那么可以使用MANIFEST.in文件模版，示例如下：  
include xx.txt  
include yy/xx.txt  
....  
2.bdist_egg:用来创建一个二进制分发版本，经常用来替代基于bdist生成的模式

3.install：安装包到python中。另外，他还可能会安装在setup.py中的install_requires定义的

相关模块，例如：

install_requires=['...','...']

删除一个包：1）删除这个包所创建的文件，2）删除在site-packages文件夹easy-install.pth文

件中列举的所有引用。 [www.2cto.com](http://www.2cto.com/kf/201209/153517.html)




4.develop:编译并且在适当的位置安装包，然后添加一个简单的链接到python site-packages文

件夹中，可以使用显式的-u选项删除包，例如：  
python setup.py develop  
python setup.py develop -u  
使用该方式比其他方式安装包更好一些

5.创建一个新命令：这是由setuptools引入的，是一种将包定义为插件的简单方法，示例：  
...entry_points='''  
[distutils.commands]  
my_command=my.command.module.Class

### 参考资料
[Python深入：Distutils发布Python模块](http://blog.csdn.net/gqtcgq/article/details/49255995)
[ 关于python中的setup.py](http://blog.csdn.net/xluren/article/details/41114779)