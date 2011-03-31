################################################################################
# .zshrc
################################################################################
path=(~/bin ~/opt/bin $path)
[[ -f ~/private.zshrc ]] && source ~/private.zshrc
if [[ -d ~/.zsh/functions ]]; then
	fpath=(~/.zsh/functions ~/.zsh/functions/Math.zwc ~/.zsh/functions/Completions $fpath)
fi
manpath=(~/opt/share/man $manpath)

# Mercurial
export PYTHONPATH=~/opt/lib/python2.6/site-packages

################################################################################
# PostgreSQL
################################################################################
PG_HOME=~/opt/pgsql
export PGDATA=$PG_HOME/data
export DYLD_LIBRARY_PATH=$PG_HOME/lib
path=($path $PG_HOME/bin)

################################################################################
# 補完関連の設定
################################################################################
autoload -U compinit
compinit -u

# 補完候補を矢印キーで選択可能にする
zstyle ':completion:*:default' menu select true
#zstyle ':completion:*' list-colors di=34 fi=33
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 補完候補の大文字小文字の違いを無視
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose true
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

#autoload predict-on
#predict-on

autoload -U colors
colors

################################################################################
# options
################################################################################
[[ -f ~/.zsh_options ]] && source ~/.zsh_options

# エスケープシーケンスを通す
setopt prompt_subst


################################################################################
# プロンプト設定テクニック
# ${WINDOW:+"[$WINDOW]"}
#   screenを起動しているときは、[スクリーン番号]に展開。そうでないときは空文字列
# %~ or %d
#   カレントディレクトリ(~とdの違いは、ホームディレクトリの表示)
# %(!.root用プロンプト.一般ユーザプロンプト)
#    %(!.#.$) は、rootは#で一般ユーザは$にするためのもの %# ともかける
# 詳しくは、/usr/share/zsh/4.2.3/functions/colors
# colors(色)
#    autoload -U colors
#    colors
#    としておくと、$fg[色名] / $bg[色名] /$reset_color などの変数を使って
#    色指定ができる。エスケープシーケンスを含む文字は%{と%}で囲む必要があるので
#    %{$fg[blue]%} のように記述する必要がある。
# 
# 色を出すエスケープシーケンスは、[色番号m
# 30(黒),31(赤),32(緑)(green),33(黄), 34(青), 35(紫)(purple), 36(水), 37(白)
################################################################################
#export PROMPT='%{$fg_bold[cyan]%}[${USER}@$m]:${WINDOW:+"[$WINDOW]"}%(!.#.$)%{$reset_color%} '
#export RPROMPT='%{$fg_bold[blue]$bg[white]%}[%~]%{$reset_color%}'
#export PROMPT='%{$fg_bold[blue]$bg[white]%}(%n@%m)${WINDOW:+"[$WINDOW]"}[%j][%~]%{$reset_color%}
#%# '
#export RPROMPT='%{$fg_bold[blue]$bg[white]%}%D{%Y-%m-%d(%a) %r}%{$reset_color%}'
PROMPT='%{$fg_bold[red]$bg[white]%}LVL[$SHLVL]JOB[%j]--->$fg_bold[blue][%~]%{$reset_color%} ${vcs_info_msg_0_}
%{$fg_bold[yellow]%}(%n)%#%{$reset_color%} '
RPROMPT='%{$fg_bold[blue]$bg[white]%}[%D{%Y-%m-%d(%a) %H:%M}]%{$reset_color%}'

#export LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLORS='di=01;34:fi=01;33'

# dircolor -b original
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:'
export LS_COLORS

################################################################################
# ヒストリーに関する設定
################################################################################
# The file to save the history in when an interactive shell exits. If unset, the history is not saved.
# 対話的シェルでヒストリを保存するファイル(未設定の場合、履歴が保存されない)
#HISTFILE=$ZDOTDIR/.zsh_history
HISTFILE=~/.zsh_history
# ヒストリリストに保存する最大数。HIST_EXPIRE_DUPS_FIRSTオプションがセットされている場合
# SAVEHISTサイズより大きく

HISTSIZE=10000

# ヒストリファイルに保存するイベントの最大数
SAVEHIST=10000

################################################################################
# alias
################################################################################
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

# グローバルエイリアス
alias -g X=" | xargs "
# サフィックスエイリアス

precmd() {
	echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	#echo -ne "\[\e]0;\u@\h [\w]\a\]"
	vcs_info
}

# screen使用時に実行しているコマンド名をステータスラインに表示する
preexec(){
	if [[ -n "$WINDOW" ]]; then
		1=`echo "$1" | awk '{print $1}'`
		echo -ne "\ek${1}\e\\"
	fi
}


autoload +X tiaraway up down


################################################################################
# 特定のコマンドだけ補完をしないようにしたい
# compdef -d コマンド
# compdef _nothing コマンド名
# 前者は通常のファイル補完になります。後者は何も補完しないようになります。


################################################################################
# bindkey関連
################################################################################
# コマンドライン編集にviモードを使用
bindkey -v
# コマンドラインスタックをCtl+Lに割り当てる
bindkey '^L' push-line



################################################################################
# vimユーザのためのscreenコマンド
################################################################################
function :S(){ [[ -n "$WINDOW" ]] && screen -X "$@" }
function :size(){ :S resize "$1" }
function :sb(){ :S eval split focus "select $1" }
function :bd(){ :S eval kill remove }
function :sp(){ :sb "$WINDOW" }
alias :new=':S eval split focus screen'
alias :ls=':S windowlist -b'
alias :bp=':S prev'
alias :bn=':S next'
alias :qall=':S quit'
alias :q=':S remove'
alias :only=':S only'
alias :cls=':S clear'
alias :max=':size max'
alias :min=':size min'
alias :eq=':size ='


################################################################################
# OS別の設定
################################################################################
case `uname -s` in
CYGWIN_NT-*)
	export CYGWIN=server
	# Windows Drive
	export WIN_C=/cygdrive/c
	export WIN_D=/cygdrive/d
	export WIN_E=/cygdrive/e
	export WIN_F=/cygdrive/f

	cdpath=(. $WIN_C $cdpath)

	# Windows版VimをCygwin上から起動するときに、シンボリックリンクを指定できるように
	function gvi(){
		if [[ -n "$1" ]]; then
			gvim $(cygpath -w "$@") &
		else
			gvim &
		fi
	}

	;;

Darwin)
	export LANG=ja_JP.UTF-8
	;;
Linux)
	alias gvi='vim'
esac

#
if [[ -f ~/incubator ]]; then
	source ~/incubator
fi


autoload +X gcd lcm
functions -M gcd2 2
functions -M gcd 2 -1
functions -M lcm2 2
functions -M lcm 2 -1



