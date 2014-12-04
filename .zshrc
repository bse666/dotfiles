# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="gallois"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# alias for setting solarized dark/light
alias 'sold=xrdb -DSOLARIZED_DARK -merge $HOME/.Xresources'
alias 'soll=xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xresources'
alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'bk=cd $OLDPWD'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias lh='ls -a | egrep "^\."'

# geeky stuff
alias 'mp3fromavi=ffmpeg -i $1 -ab 160k -ac 2 -ar 44100 -vn $1.mp3'
alias 'ytdl=youtube-dl -i -k --extract-audio --audio-format mp3 $*'
alias -s wav='play -q'

# sort files in current directory by the number of words they contain
alias 'wordy=wc -w * | sort | tail -n10'
alias 'filecount=ls -aRF | wc -l'

# file related

alias 'lsth=ls -tlh|head'
alias 'wget=wget -c'
alias cp='cp -i'
alias rm='rm -i'

# quickly cd out of directories using numbers
# usage: up 2 -- same as cd ../../
up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }
#}}}

#-------- Listing Files {{{
#------------------------------------------------------
alias lsd='ls -1d */'        # ls folders only
alias l='ls -l'
alias lst='ls -Ggthrc'        # list by time and change, newest at bottom
alias lsa='ls -GghA'
# list and grep
lsg() {
        keyword=$(echo "$@" |  sed 's/ /.*/g')
        ls -GgthrA | grep -iE $keyword
}

#}}}


