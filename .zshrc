# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=256
SAVEHIST=1000
setopt extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mickaushy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#github mollifier/4979906
export LANG=ja_JP.UTF-8
#export LC_CTYPE="en_US.UTF-8"

autoload -Uz colors
colors

# prompt
local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
PROMPT="$p_cdir$p_info $p_mark "

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

# man -> en
alias man='LANG=C /usr/bin/man'
alias jman='LANG=ja_JP.UTF-8 /usr/bin/man'
