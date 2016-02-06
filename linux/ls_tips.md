# ls Tips

[ linux下 ls 排序](http://blog.itpub.net/14184018/viewspace-772677/)

	ls -lS                       按大小降序排列
	ls -l | sort -n -k5    按大小升序
	ls -lrt                       按时间降序
	ls -lnt                      按时间升序
	ls -l | sort -k9         按文件名升序（这是ls的默认输出方式）
	ls -lr                        按文件名降序
	ls -l | sort -rk9       按文件名降序
	ls -l -d */                 只显示目录
	ls -l |grep -v "^d"   只显示文件