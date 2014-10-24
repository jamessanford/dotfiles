# jsanford
#  master on corner: nadine tepin corner nuevo camel lilas eifel shadows

cdpath=(.)

umask 077

alias ls='ls -F'

alias trn='trn -q'

# What's this, I want to see some color?
alias grep='grep --color=auto'

#alias openwin='eval `ssh-agent -s`;openwin -dev /dev/fbs/ffb0 defclass TrueColor defdepth 24 -ar1 200 -ar2 30'

PROMPT='%m%# '

#RPROMPT=' %~'
#export LESS=-cex3M

# unset, just in case anyone has silly systemwide defaults
unset RPROMPT
unset LESS

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
# default is vi-backward-kill-word, but this appears to be a-z0-9 words.
bindkey '^W' backward-kill-word

stty susp $(print '\C-z')

btih(){local _h;for _h in "$@"; do echo "magnet:?xt=urn:btih:${_h}"; done}

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U compinit
compinit

# Try menu completion instead of a list?  I think I like it.
zstyle ':completion:*' menu select
