case $- in
  *i*)
       if [ -z "$LINES" -o -z "$COLUMNS" ]; then
	  export LINES=$(tput lines || tput li)
	  export COLUMNS=$(tput cols || tput co)
       fi

       set -o emacs

       alias ls='ls -Fx'
       alias which='command -v'

       command -v less   > /dev/null 2>&1 && alias more=less

       command -v ll     > /dev/null 2>&1 || alias     ll='ls -l'
       command -v l      > /dev/null 2>&1 || alias      l='ls -m'
       command -v xd     > /dev/null 2>&1 || alias     xd='od -x'
       command -v whence > /dev/null 2>&1 || alias whence='command -v'

       # Set up the prompt

       # Querying for the escape sequence for setting the window title
       # is unreliable, so we have to hardcode it here.
       case $TERM in
	 dtterm|vt220|xterm*) STITLE="]0;"
			      ETITLE=""
			      ;;
       esac

       # Encoding
       eval $(locale)
       ENCODING=${LC_CTYPE##*.}

       # Status
       STATUS="\u@\h:\$PWD"

       # Window title
       if [ $STITLE ]; then
	   WINTITLE="$STITLE${STITLE:+$STATUS}$ETITLE"
       fi

       # The prompt
       
       PS1="$WINTITLE[$STATUS]\n\$ "
       ;;
esac
