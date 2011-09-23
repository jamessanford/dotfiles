# 20110813 jsanford
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
DIRSTACKSIZE=30

setopt \
  zle magicequalsubst monitor alwayslastprompt alwaystoend \
  autopushd autolist automenu autoremoveslash cdablevars \
  chaselinks extendedglob hashcmds hashdirs hashlistall \
  extendedhistory longlistjobs nobadpattern nobeep \
  noflowcontrol nohup nonomatch pushdignoredups pushdminus \
  pushdsilent pushdtohome rcquotes rmstarsilent shwordsplit

setopt nobgnice

unsetopt \
  appendhistory \
  allexport noclobber notify autocd autonamedirs autoparamkeys \
  autoresume braceccl completealiases completeinword \
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

bindkey [A up-line-or-history
bindkey [B down-line-or-history

compctl -g '*(-/)' cd
compctl -g '*(x)' strip

stty susp 

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
