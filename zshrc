# jsanford
#  master on corner: nadine tepin corner nuevo camel lilas eifel shadows

cdpath=(.)

fpath=(~/.zsh/functions $fpath)

umask 077

alias ls='ls -NF'

alias trn='trn -q'

# What's this, I want to see some color?
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip --color=auto'

# Lame.
alias vi=$(whence -p vim || whence -p vi)

# OSX plist
# TODO: autocomplete from ~/Library/Preferences/
plshow(){local _f;for _f in "$@"; do <"${_f}" plutil -convert xml1 - -o -; done}

# OSX airport -I is nice
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

alias airport-on='networksetup -setairportpower en0 on'
alias airport-off='networksetup -setairportpower en0 off'

# OSX battery status; -v for more info
battery(){local _t=ps; if [ $# -gt 0 ]; then _t=rawbatt; fi; pmset -g "${_t}"}

# see also 'pwgen -s 20 5' or 'openssl rand -base64 20'
pwrand(){LC_CTYPE=C </dev/urandom tr -dc 'A-Za-z0-9!@#$%^:,._/' | head -c ${1:-20};echo}

#alias openwin='eval `ssh-agent -s`;openwin -dev /dev/fbs/ffb0 defclass TrueColor defdepth 24 -ar1 200 -ar2 30'

# unset, just in case anyone has silly systemwide defaults
unset RPROMPT
unset LESS

# non-zero exit status causes prompt prefix
PROMPT='%(?..[%?] )%m%(?.%#.!) '

unset MAILCHECK
unset HISTFILE
HISTSIZE=1000
# To enable HISTFILE, you must set HISTFILE as well as reset SAVEHIST.
#HISTFILE=${HOME}/.zhistory
SAVEHIST=10000
DIRSTACKSIZE=30

setopt \
  zle magicequalsubst monitor alwayslastprompt alwaystoend \
  autopushd autolist automenu autoremoveslash \
  chaselinks extendedglob hashcmds hashdirs hashlistall \
  extendedhistory longlistjobs nobadpattern nobeep \
  noflowcontrol nohup nonomatch pushdignoredups pushdminus \
  pushdsilent pushdtohome rcquotes rmstarsilent shwordsplit \
  incappendhistory nobgnice

unsetopt \
  allexport noclobber notify autocd autonamedirs autoparamkeys \
  autoresume braceccl cdablevars completealiases completeinword \
  correct correctall cshjunkiehistory cshjunkieloops \
  cshjunkiequotes cshnullglob globsubst \
  errexit globcomplete globdots histignorespace histignoredups \
  histnostore histverify ignorebraces ignoreeof \
  interactivecomments kshoptionprint listambiguous \
  listtypes mailwarning markdirs nobanghist noequals noglob \
  nopromptcr norcs noshortloops nounset nullglob numericglobsort \
  overstrike pathdirs printexitvalue promptsubst rcexpandparam \
  recexact singlelinezle menucomplete

bindkey -v

bindkey '\e[A' up-line-or-history
bindkey '\e[B' down-line-or-history
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
# default is vi-backward-kill-word, but this appears to be a-z0-9 words.
bindkey '^W' backward-kill-word

stty susp $(print '\C-z')

btih(){local _h;for _h in "$@"; do echo "magnet:?xt=urn:btih:${_h}"; done}

# Show the full pathname to a file, given a relative file. Must be a better way?
fullpath(){local _f;for _f in "$@"; do echo ${_f:a}; done}

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U compinit
compinit

# OSX disable bad completions
compdef -d du
compdef -d hdiutil
compdef -d open

# Try menu completion instead of a list?  I think I like it.
zstyle ':completion:*' menu select

# python work
whence -p virtualenvwrapper_lazy.sh >/dev/null && source =virtualenvwrapper_lazy.sh

# machine readable current git branch
alias git-current-branch='git rev-parse --abbrev-ref HEAD'
alias git-scrub='git branch --merged | grep -v master | xargs echo git branch -d'

cfile(){local _f;for _f in "$@"; do csearch -l -f "${_f}" .; done}

# alternate cindex/csearch locations
alias playindex="CSEARCHINDEX=~/.csearch/play cindex"
alias playsearch="CSEARCHINDEX=~/.csearch/play csearch"
alias playfile="CSEARCHINDEX=~/.csearch/play cfile"

alias goindex="CSEARCHINDEX=~/.csearch/go cindex"
alias gosearch="CSEARCHINDEX=~/.csearch/go csearch"
alias gofile="CSEARCHINDEX=~/.csearch/go cfile"

# use './...' when no files given
go-show-deps(){go list -f '{{ join .Deps "\n" }}' "${@:-./...}"}
go-show-imports(){go list -f '{{ join .Imports "\n" }}' "${@:-./...}"}

alias godoc='go doc --all'

# see also turbostat --list
alias turbosum='sudo turbostat --quiet --show Core,CPU,Avg_MHz,Busy%,Bzy_MHz,TSC_MHz,CorWatt,PkgWatt,RAMWatt,GFXMHz --interval 1'

# arch
alias yall='yay --nocleanmenu --nodiffmenu'

# summary of extended iostat output
iostatsum() { iostat -x 1|awk '/Device/{pf=1} /^$/{pf=0} (pf==1){printf("%12s%12s%12s%12s%12s%12s\n", $1, $2, $3, $8, $9, $NF)} (pf==0)' }

# Show something like 'screen -x', but for tmux (not just "tmux a")
tmux() { if [[ $@ == "-x" ]]; then tmux list-sessions; echo ""; echo "Use tmux-new-session -t SESSION"; else command tmux "$@"; fi; }

kubectl() {
  unfunction kubectl
  source <(kubectl completion zsh)
  kubectl "$@"
}
# export KUBECONFIG=$(k3d get kubeconfig --name=k3s-default)
kubeact() {
  local _name='k3s-default'
  if [[ $# -gt 0 ]]; then _name="$1"; fi
  export KUBECONFIG=$(k3d get kubeconfig "${_name}")
}

# macOS kitty workarounds (alternatively, pass terminfo)
alias ssh='TERM=xterm ssh'
alias sudo='TERM=xterm sudo'

# archlinux yay quickmode
alias yayq='yay --nocleanmenu --nodiffmenu'
