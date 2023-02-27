# .zshrc

# Set the shell prompt
PS1="[%n@%m:%~]
%(!.#.%%) "

# Set the window title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Default locale
export LANG=en_US.UTF-8

# Useful defaults for less(1)
export LESS='-RXegm -Pm--More--?e(END):?pb(%pb\%).'

# Usefull aliases
alias ls="ls -Fx"
alias ll="ls -l"
alias more="less"

# Make zshzle(1) consider path components as "words"
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
