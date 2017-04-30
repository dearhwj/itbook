# BASH shell set命令详解
原文地址[http://developer.51cto.com/art/200512/15428.htm](http://developer.51cto.com/art/200512/15428.htm)

用set命令可以设置各种shell选项或者列出shell变量.单个选项设置常用的特性.在某些选项之后-o参数将特殊特性打开.在某些选项之后使用+o参数将关闭某些特性,不带任何参数的set命令将显示shell的全部变量.除非遇到非法的选项,否则set总是返回ture.

当BASH shell被调用时,可以列出全部的选项.当前的选项集列在$-中.在option参数被处理后,其他的参数被赋值到位置参数中($1,$2,...,$n)
set [--abefhkmnptuvxldCHP] [-o option name] [arguments ...]
源码:
选项 说明
-a 自动向已经修改的变量或为导出后序命令的变量作出标志
-b 不是在原提示符之前,而是立即引发终止后台任务的状态表表
-e 如果命令带非零值返回,立即退出
-f 禁止带扩展名的路径
-h 定义函数时,定位和存储函数命令,当函数被执行时,通常查询函数命令
-k 所有的关键词参数,而不只是那些命令名前的关键词参数,被放在环境命令中
-m 监视器模式,启动任务控制.此选项默认支持系统shell交互.后台进程以单独的进程组运行,在每次完成任务时显示包含退出的状态行
-n 读取命令但不执行命令.通常监查shell脚本的句法错误.交互shell被忽略
-o option-name 选项名可以是下列之一:

选项 说明
allexport 同-a选项
braceexpand shell执行花括号扩展,在默认情况下起作用
emacs 使用emacs风格命令行编辑接口.除非shell以-noline-editing选项启动,否则当shell交互时,通过默认启动该选项
errexit 同-e选项
histexpand 同-H选项
ignoreeof 其结果是好像shell命令IGNOREEOF=10被执行
interactive 允许单词前带#号,以使得在交互shell中忽略命令行的全部字符-commands
monitor 同-m选项
noclobber 同-C选项
noexec 同-n选项
noglob 同-f选项
nohash 同-d选项
notify 同-b选项
nounset 同-u选项
physical 同-p选项
posix 改变BASH属性以匹配标准,默认操作不同于POSIX1003.2标准
verbose 同-v选项

vi 使用vi风格的命令行编辑器

XTRACE 同-x选项,如果没有给出选项名,显示当前选项值
-p 打开特权模式(在此模式,$ENV文件被处理,不能从环境中继承

shell函数.如果是有效用户ID而不是实用户组则自动启动.关闭此选项将使得有效用户和组IDs设置实用户和组IDs)
-t 在读取命令并执行之后退出
-u 当执行参数括展时,把非设置变量作为错误处理(如果扩展企图出现在非设置变量中,shell显示错误信息.如果不是交互式,则带非凌值退出)
-v 输入行被读取时,显示shell输入行
-x 在每个简单命令被扩展之后,显示PS4扩展值,之后是要执行的命令
-l 保存和恢复绑定在命令中的名称
-d 禁止执行查找散列命令(通常,命令被保存在散列表中,一旦被找到就不再继续查找)
-C 效果好像是执行了noclobber=shell命令
-H 使用!风格的历史替代(当shell交互时,在默认情况下,此选项有效)
-P 如果设置此参数,当执行改变目录命令cd时,不遵循符号链接,而是使用实际的目录

如果在选项后没有参数,不设置位置参数.否则,即使一些参数以a选项开始,也要把位置参数设置为argument- 结束选项的信号,将引发其余的参数被赋值到位置参数中(-x和-v选项被关闭.如果没有argument,位置参数将保留未改变的参数)

### 参考资料
[set命令](http://man.linuxde.net/set)
[Linux set命令参数及用法详解](http://www.cnblogs.com/liduanjun/p/3536996.html)