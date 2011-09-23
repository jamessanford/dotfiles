# 20110813 jsanford
#  master on corner: nadine tepin corner nuevo camel lilas eifel shadows

if [ "${OSTYPE}" != "cygwin" ]; then
 uptime
 mesg y
# stty dsusp undef
fi

PATH=${HOME}/bin:${HOME}/local/bin:/usr/gnu/bin:/usr/sfw/bin:/usr/local/bin:/usr/X11R6/bin:/usr/openwin/bin:/usr/local/mysql/bin:/usr/local/netpbm/bin:/usr/xpg4/bin:/usr/ccs/bin:/usr/bin:/bin:/usr/etc:/etc:/sbin:/usr/sbin:/usr/ucb

export MANPATH=${HOME}/bin/man:${HOME}/local/man:/usr/gnu/man:/usr/sfw/man:/usr/local/netpbm/man:/usr/openwin/man:/usr/X11R6/man:/usr/local/man:/usr/xpg4/man:/usr/share/man:/usr/man:/usr/ccs/man:/usr/ucb/man

export EDITOR=`which vi`
export PAGER=`which less`

if [ -z "${TERM}" ]; then
 export TERM=vt100
fi

export BLOCKSIZE=1024

# node.js
PATH=${HOME}/local/node/bin:${PATH}
export NODE_PATH=${HOME}/local/node:${HOME}/local/node/lib/node_modules

# Override rediculous default settings on some Linux distributions:
# sort things correctly
export LC_COLLATE=C
# we want less to be raw less.  I hate automagic!
unset LESSOPEN
# no less history file, it writes every time you read a file with less.
export LESSHISTFILE=-
