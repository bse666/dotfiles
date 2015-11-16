ZSH=~/.dotfiles/oh-my-zsh/
ZSH_CUSTOM=/.oh-my-zsh/custom/
ZSH_THEME="sunrise"
DISABLE_AUTO_UPDATE="true"

plugins=(git django sublime themes python pip node npm history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#eval "$(fasd --init auto)"
alias zshconfig="subl ~/.zshrc"
alias yaourt="yaourt --noconfirm"
alias less="less -R"
alias grep="grep --color=always"
alias dmesg="dmesg -L --reltime -H"

alias lag="sudo tc qdisc add dev lo root netem delay"
alias nolag="sudo tc qdisc delete dev lo root"
alias chromium="chromium --ignore-gpu-blacklist"
alias npb="npm install & bower install"
alias hc="herbstclient"

PATH=~/bin:$PATH
EDITOR=vim


# # Customize to your needs...
# alias for setting solarized dark/light
alias 'sold=xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults'
alias 'soll=xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults'
alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'bk=cd $OLDPWD'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias lh='ls -a | egrep "^\."'
alias t='twidge'
alias 'vsc=vim $HOME/.ssh/config'

# docker stuff
alias 'drg=XSOCK=/tmp/.X11-unix && XAUTH=/tmp/.docker.xauth && xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && docker run -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY'
alias 'spotify=drg -ti \
   -v /etc/localtime:/etc/localtime:ro \
   --device /dev/snd:/dev/snd \
   -v $HOME/.spotify/config:/home/spotify/.config/spotify \
   -v $HOME/.spotify/cache:/home/spotify/spotify \
   --name spotify-wine \
   jess/spotify-wine bash || docker start spotify-wine; docker exec spotify-wine wine /root/.wine/drive_c/users/root/Application\ Data/Spotify/spotify.exe'
alias 'tor-browser=drg -d -v /etc/localtime:/etc/localtime:ro --device /dev/snd:/dev/snd jess/tor-browser'
alias 'itunes=drg --rm -ti --cpuset-cpus 0 --device /dev/snd:/dev/snd --name itunes jess/itunes bash'

# vagrant related
alias 'vdup=vagrant destroy -f;vagrant up'

# geeky stuff
#alias 'mp3fromavi=ffmpeg -i $1 -ac 2 -ar 44100 -vn $1.mp3'
alias 'mp3fromavi=ffmpeg -i $1 -ab 160k -ac 2 -ar 44100 -vn $1.mp3'
alias 'ytdl=youtube-dl -i -k --extract-audio --audio-format mp3 $*'
alias -s wav='play -q'

# sort files in current directory by the number of words they contain
alias 'wordy=wc -w * | sort | tail -n10'
alias 'filecount=ls -aRF | wc -l'
alias 'lsmod=find . -mtime -1 -ls'

# file related

alias 'lsth=ls -tlh|head'
alias 'wget=wget -c'
alias cp='cp -i'
alias rm='rm -i'

# GIT Stuff
alias gfa='git fetch --all'

# WIFI https://github.com/yubo56/dotFiles/blob/master/zsh/.zsh_aliases
#alias connA9='sudo pkill wpa_supplicant; sudo wpa_supplicant -iwlo1 -c/etc/wpa_supplicant/AptNine9.conf -B'
#alias connJ2='sudo pkill wpa_supplicant; sudo wpa_supplicant -iwlo1 -c/etc/wpa_supplicant/John2.conf -B'
#alias connBN='sudo pkill wpa_supplicant; sudo wpa_supplicant -iwlo1 -c/etc/wpa_supplicant/Beavernet.conf -B'
#alias unwlo1='sudo ip link set wlo1 down; sudo modprobe -r rtl8192ce'
#alias rewlo1='sudo modprobe -r rtl8192ce; sleep .2s; sudo modprobe rtl8192ce; sleep .2s; sudo ip link set wlo1 up'
#alias reeno1='sudo modprobe -r r8169; sleep .1s; sudo modprobe r8169'

# quickly cd out of directories using numbers
# usage: up 2 -- same as cd ../../
up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }
findpart() { df -T "$1" |tail -n 1 |awk '{print $1}' }
#}}}

#-------- Listing Files {{{
#------------------------------------------------------

alias 'l=ls -l'
# list by time and change newest bottom
alias 'lst=ls -Ggthrc'    
# ls folders only
alias 'lsd=ls -1d */'
alias 'lsa=ls -GghA'
# list and grep
lsg() {
        keyword=$(echo "$@" |  sed 's/ /.*/g')
        ls -GgthrA | grep -iE $keyword
}

#}}}


