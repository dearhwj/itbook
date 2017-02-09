# Docker使用优化

## 在docker镜像中安装zsh/autojump 

失败
原因:autojump的安装脚本需要依赖SHELL这个环境变量，docker里面的环境镜像没有