################################################################################
# .bashrc
################################################################################

# プロンプト
export PS1="\e[01m\e[47m\e[31m\s-\V\e[34m (\u@\h)\e[31mLVL[$SHLVL]JOB[\j]--->\e[34m[\w][\D{%Y-%m-%d(%a) %H:%M}][＼(＾▽＾)／]\e[00m\n\e[00m\$ "
export LANG=ja_JP.UTF-8
#export CDPATH=.:$CDPATH
MY_PATH=~/bin:~/opt/bin
export PATH=$MY_PATH:$PATH
HISTCONTROL=erasedups
HISTFILESIZE=10000
HISTSIZE=10000

set -o vi

source ~/.bashrc_function

shopt -s autocd
# cd の引数がディレクトリでない場合、変数名とみなしてその値を使う
shopt -s cdable_vars
# cdの引数のスペルミスの訂正を行う
shopt -s cdspell
shopt -s dotglob

## zshの**と同じことができるようにする。
shopt -s globstar

################################################################################
# shopt
################################################################################
#If set, a command name that is the name of a directory is executed as if it were the argument to the cd command.
#This option is only used by interactive shells.
# zshの`setopt autocd'と同じ
shopt -s autocd	

#If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.
shopt -s cdable_vars

#If set, minor errors in the spelling of a directory component in a cd command will be corrected.
#The errors checked for are transposed characters, a missing character, and a character too many.
#If a correction is found, the corrected path is printed, and the command proceeds.
#This option is only used by interactive shells.
shopt -s cdspell

#If this is set, Bash checks that a command found in the hash table exists before trying to execute it.
#If a hashed command no longer exists, a normal path search is performed.
shopt -s checkhash

################################################################################
# alias
################################################################################
alias l='\ls'
alias ls='ls -aF --color=auto --show-control-chars'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias cls='clear'
alias dirs='dirs -v'
alias grep='grep --color'
alias f='open .'
alias vi='vim -u NONE'
alias vimhelp='vim -c "help|only"'
alias z='zsh'
alias gvim='open -a $HOME/Applications/MacVim.app "$@"'


