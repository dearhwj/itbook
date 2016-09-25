# ZSH
[git 快捷键alias与oh-my-zsh](http://cnodejs.org/topic/565e945c3cda7a91276ff866)

	cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	
	alias gc='git commit -v'
	alias gc!='git commit -v --amend'
	alias gca='git commit -v -a'
	alias gca!='git commit -v -a --amend'
	alias gcan!='git commit -v -a -s --no-edit --amend'
	alias gcam='git commit -a -m'
	alias gcb='git checkout -b'
	alias gcf='git config --list'
	alias gcl='git clone --recursive'
	alias gclean='git clean -fd'
	alias gpristine='git reset --hard && git clean -dfx'
	alias gcm='git checkout master'
	alias gcmsg='git commit -m'
	alias gco='git checkout'
	alias gcount='git shortlog -sn'
	alias gcp='git cherry-pick'
	alias gcs='git commit -S'

	alias gd='git diff'
	alias gdca='git diff --cached'
	alias gdct='git describe --tags `git rev-list --tags --max-count=1`'

[ZSH 命令行工具如何检查升级？](http://www.v2ex.com/t/137551)

	upgrade_oh_my_zsh
	
	
[zsh高效命令行](https://my.oschina.net/u/923974/blog/494903)

	zsh 的命令补全功能非常强大，可以补齐路径，补齐命令，补齐参数等。（请问你记住 tar 的所有参数了吗😃，只要 tar -加 tab 键，再也不用 rtfm 了😂）
	按下 tab 键显示出所有待选项后，再按一次 tab 键，即进入选择模式，进入选择模式后，按 tab 切向下一个选项，按 shift+tab 键切向上一个选项，ctrl+f/b/n/p 可以向前后左右切换。

	以前杀进程是ps aux | grep xxx查进程的 PID，然后kill PID。有了 zsh，直接kill xxx然后按下 tab 键即可～



	