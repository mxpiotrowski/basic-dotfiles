# .profile

if [ -f ~/.bashrc ]; then
    export BASH_ENV=~/.bashrc
    . ~/.bashrc;
fi

export HISTCONTROL=ignoredups # don't enter lines into history which
                              # match the last entered line

###############################################################################

set -o allexport

LANG=en_US.UTF-8
EDITOR=emacs
HOSTNAME=${HOSTNAME:=$(hostname -s)}
UNIX95=

if command -v less > /dev/null 2>&1; then
   PAGER=less
   LESS='-eXgm -Pm--More--?e(END):?pb(%pb\%).'

   typeset -i lessver=$(less --version 2>&1 | head -n 1 | cut -d " " -f 2)
   if ((lessver > 340)); then
      LESS="-F $LESS"
   fi
fi

set +o allexport
