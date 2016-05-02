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