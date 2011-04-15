export PATH="/usr/local/bin:~/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export LC_CTYPE=sv_SE.UTF-8
export CLICOLOR=1
export EDITOR="vi"
export LSCOLORS=gxfxcxdxbxegedabagacad

#http://www.wanglianghome.org/blog/2007/05/bash-history.html
#http://www.wanglianghome.org/cgi-bin/wiki.cgi/BashConfiguration
#.bash_history
shopt -s histappend
export HISTCONTROL=ignoredups
export HISTIGNORE="[   ]*:&:bg:fg:exit"

HISTFILESIZE=1000000000
HISTSIZE=1000000

case "$TERM" in
  screen*|xterm*|rxvt*)
  # for fedora: PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
  PROMPT_COMMAND='history -a; echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
  ;;
  *)
  PROMPT_COMMAND='history -a'
  ;;
esac

function parse_git_branch {
  BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
  USER=$(git config --get user.email)
  USER=${USER%%@*}
  [[ $BRANCH ]] && echo "[$BRANCH]"
}
if [[ -n $SSH_CONNECTION ]]; then
  PS1="\h:\w\$(parse_git_branch)\$ "
else
  PS1="\w\$(parse_git_branch)\$ "
fi

# VI key bindings
set -o emacs
# set -o vi
# bind -m vi-insert "\\C-n":menu-complete
# bind -m vi-insert "\\C-l":clear-screen

# for c in `ls ~/.completions`
#   do source ~/.completions/$c
# done

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && source ~/.localrc
