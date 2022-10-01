# by brainf+ck ### /data/data/com.termux/files/usr/bin:data/data/com.termux/files/home/bin

# `grep default` highlight color
export GREP_COLOR="1;32"

# variables
export BROWSER=w3m
export EDITOR="vim"
export SUDO_EDITOR="vim"
export VISUAL="vim"

# Colored man
export MANPAGER="less -R --use-color -Dd+g -Du+b"

#### History settings ################
HISTTIMEFORMAT="%F %T "     #hist time format yyyymmdd HH:MM:SS
HISTCONTROL=ignoreboth      # don't put duplicate lines or lines starting with space in the history
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend     #append to the history file, don't overwrite it
shopt -s histverify     #load results of history substitution into the readline editing buffer

#### Autocompletion ##################

# cycle through all matches with 'TAB' key
bind 'TAB:menu-complete'

# necessary for programmable completion
shopt -s extglob

# cd when entering just a path
shopt -s autocd
stty stop "" ##avoid ctrl-s freeze window

#### Prompt ##########################

#fake_user="elliot"

#PS1='\[\033[0;32m\]┌──(\[\033[1;34m\]${fake_user}@\h\[\033[0;32m\])-[\[\033[0;1m\]\w\[\033[0;32m\]]
#\[\033[0;32m\]└─\[\033[1;34m\]\$\[\033[0m\] '

PS1="\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;7m\] \[$(tput sgr0)\]"

#### Aliases #########################

# enable color support of ls, grep and ip, also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip -color'
fi

# common commands
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -laFh --group-directories-first'
alias l='ls -ah --group-directories-first'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cp='cp --preserve=all -v'
alias cpp='rsync -ahW --info=progress2'
alias cs='printf "\033c"'
alias q='exit'
alias tree='tree --dirsfirst -F'

alias brc='vim $HOME/.bashrc ; source $HOME/.bashrc'
alias u='pkg update' 
alias uu='pkg udate ; pkg upgrade -y'
alias s='pkg search'
alias i='pkg install'
alias r='pkg uninstall'
alias pst=termux-clipboard-get # paste
alias cpy=termux-clipboard-set # copy
alias open=termux-open # open with external app
alias gc='git clone --depth=1'
alias op='vim $(find -type f /data/data/com.termux/files | fzf ---height 40% )'
alias fl='grep "\(\)\ {\ " --colour=always $HOME/.bashrc'

# memory/CPU
alias df='df -ha'
alias free='free -mht'
alias ps='ps auxf'
alias ht='htop'
#alias cputemp='sensors | grep Core'

# applications shortcuts
alias nb='newsboat'
alias mutt='neomutt'
alias ani='ani-cli -q 360 -p storage/shared/Video/'
alias aria2c='aria2c -x5 -c'
alias alj='rtmpdump -v -r "rtmp://aljazeeraflashlivefs.fplive.net/aljazeeraflashlive-live/aljazeera_eng_med" | mplayer -'

alias wttr='curl wttr.in/beranang' # change the place to yours
alias urls='rm $HOME/.newsboat/urls && wget -qO- https://gitlab.com/shaddixzack/dot/-/raw/main/urls > $HOME/.newsboat/urls'
alias bashrc='rm $HOME/.bashrc && wget -qO- https://gitlab.com/shaddixzack/ter/-/raw/main/.bashrc > $HOME/.bashrc ; source $HOME/.bashrc'
#alias urls='rm urls && wget -qO- https://gitlab.com/shaddixzack/dot/-/raw/main/urls > urls'
#alias urls='rm urls && curl -C -L https://gitlab.com/shaddixzack/dot/-/raw/main/urls -o urls'
#alias urls='rm urls && http https://gitlab.com/shaddixzack/dot/-/raw/main/urls > urls' ##httpie
#alias urls='rm urls && aria2c https://gitlab.com/shaddixzack/dot/-/raw/main/urls > urls'
alias myip='curl -s -m 5 https://ipleak.net/json/'
alias lynx='lynx --useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1 Lynx"'
alias ?='lynx ddg.gg'
alias ??='w3m ddg.gg'
alias jup='lynx --dump "https://www.jupem.gov.my/staps/stesen-pelabuhan-klang-selangor" | grep "\(CM\)" -A 4 --colour=always'
alias ws='lynx --dump "https://www.waktusolat.xyz/kelantan/ktn01" | grep -i 'imsak\ ' -A 7 --colour=always ; lynx --dump "https://www.waktusolat.xyz" | grep -i 'imsak\ ' -A 7 --colour=always'

#### Functions ######################
#lsext() { find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;}
#batchexec() { find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;}
#rpass() { cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12} ;}
#getip() { /sbin/ifconfig ${1:-eth0} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}' ;}
#log() { echo [`date +%Y-%m-%d\ %H:%M:%S`] $* ;}
#htmldecode() { : "${*//+/ }"; echo -e "${_//&#x/\x}" | tr -d ';'; }
#urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
#lower() { echo "${@}" | awk '{print tolower($0)}' ;}
#upper() { echo "${@}" | awk '{print toupper($0)}' ;}
#expandurl() { curl -sIL $1 | awk '/^Location/ || /^Localização/ {print $2}' ; }
#calc(){ echo "scale=2;$@" | bc;}
#mkcd() { mkdir -p "$@" && cd $_; }
#decToBin () { echo "ibase=10; obase=2; $1" | bc; }
#decTohex () { bc <<< "obase=16; $1"; }
#biggest (){ du -k * | sort -nr | cut -f2 | head -20 | xargs -d "\n" du -sh; }
#top10 () { history | awk '{print $2}' | sort | uniq -c | sort -rn | head ; }
#beep () { echo -e -n \\a ; }
dict() { curl "dict://dict.org/d:${1%%/}";}

c() { cd "$@" && ls -ah ;}
s1() { w3m -o auto_image=TRUE "https://searx.be/search?q='$*'" ;}
s2() { w3m -o auto_image=TRUE "https://sh0.it/search?q='$*'" ;}
s3() { w3m -o auto_image=TRUE "https://search.ononoki.org/search?q='$*'" ;}
s4() { w3m -o auto_image=TRUE "https://serx.ml/search?q='$*'" ;}
s5() { w3m -o auto_image=TRUE "https://priv.au/search?q='$*'" ;}
s6() { w3m -o auto_image=TRUE "https://paulgo.io/search?q='$*'" ;}
wb() { w3m -o auto_image=TRUE "https://wiby.me/?q='$*'" ;}
qw() { w3m -o auto_image=TRUE "https://www.qwant.com/?q='$*'" ;}
yd() { w3m -o auto_image=TRUE "https://yandex.com/search/?text='$*'" ;}
mg() { w3m -o auto_image=TRUE "https://metager.org/meta/meta.ger3?eingabe='$*'" ;}
ff() { lynx --dump "http://www.frogfind.com/?q='$*'" | grep -i 'search results for' -A 50 --colour=always ;}
ldn() { w3m -o auto_image=TRUE "https://www.die.net/search/?q=ksh'$*'" ;}
#es() { w3m -o auto_image=TRUE "https://www.ecosia.org/search?method=index&q='$*'" ;}
#gw() { w3m -o auto_image=TRUE "https://search.givewater.com/serp?q='$*'" ;}
#wa() { w3m -o auto_image=TRUE "https://www.wolframalpha.com/input?i='$*'" ;}
#br() { w3m -o auto_image=TRUE "https://boardreader.com/s/'$*'.html;language=English" ;}
#gi() { w3m -o auto_image=TRUE "https://gibiru.com/results.html?q='$*'" ;}
#lk() { w3m -o auto_image=TRUE "https://www.lukol.com/s.php?q='$*'" ;}
#gb() { w3m -o auto_image=TRUE "https://www.gigablast.com/search?c=main&qlangcountry=en-us&q='$*'" ;}

# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

#function mach()
#{
#    echo -e "\nMachine information:" ; uname -a
#    echo -e "\nUsers logged on:" ; w -h
#    echo -e "\nCurrent date :" ; date
#    echo -e "\nMachine status :" ; uptime
#    echo -e "\nMemory status :" ; free
#    echo -e "\nFilesystem status :"; df -h
#}

#txtund=$(tput sgr 0 1)    # Underline
#txtbld=$(tput bold)       # Bold
#txtred=$(tput setaf 1)    # Red
#txtgrn=$(tput setaf 2)    # Green
#txtylw=$(tput setaf 3)    # Yellow
#txtblu=$(tput setaf 4)    # Blue
#txtpur=$(tput setaf 5)    # Purple
#txtcyn=$(tput setaf 6)    # Cyan
#txtwht=$(tput setaf 7)    # White
#txtrst=$(tput sgr0)       # Text reset

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

#git clone https://github.com/alexanderepstein/Bash-Snippets
