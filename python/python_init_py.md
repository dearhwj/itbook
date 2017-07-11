# \__init.py\__

\__init\__.py 文件的作用是将文件夹变为一个Python模块,Python 中的每个模块的包中，都有\__init\__.py 文件。
通常__init__.py 文件为空，但是我们还可以为它增加其他的功能。我们在导入一个包时，实际上是导入了它的\__init\__.py文件。这样我们可以在\__init\__.py文件中批量导入我们所需要的模块，而不再需要一个一个的导入。


```
# package
# __init__.py
import re
import urllib
import sys
import os
# a.py
import package 
print(package.re, package.urllib, package.sys, package.os)

```


__init__.py中还有一个重要的变量，__all__, 它用来将模块全部导入。


```
# __init__.py
__all__ = ['os', 'sys', 're', 'urllib']
# a.py
from package import *

```

这时就会把注册在\__init\__.py文件中\__all\__列表中的模块和包导入到当前文件中来。


### 参考资料
[在 __init__.py 里写代码的若干理由](http://blog.csdn.net/djangor/article/details/39673659)
[Python中__init__.py文件的作用详解](http://www.jb51.net/article/92863.htm)[]([]( ))