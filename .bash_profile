# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
	-o "nospace" \
	-W "$(grep "^Host" ~/.ssh/config | \
	grep -v "[?*]" | cut -d " " -f2 | \
	tr ' ' '\n')" scp sftp ssh

alias 'sold=xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults'
alias 'soll=xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults'
alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'mp3from=for file in $(find $1 -maxdepth 0 -type f); do ffmpeg -i $1 -b:a 256k -ac 2 -ar 44100 -vn $1.mp3; done;'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias 'hbcli=HandBrakeCLI -a 1 -6 stereo -R 48 --preset "Fast 720p30" -i $1 -o $1.mp4'

alias 'dmesgg=dmesg -L --reltime -H'
# print a fortune when the terminal opens
#fortune -a -s | lolcat
