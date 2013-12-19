ZSH=$HOME/.oh-my-zsh

# Expanded Globbing
setopt extended_glob
zmodload zsh/stat
zmodload zsh/complist
autoload zmv
autoload -Uz compinit && compinit -i
autoload -U zmv
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

EDITOR=nano

ZSH_THEME="norm"

# Example aliases
alias zshconfig="gedit ~/.zshrc"
alias ohmyzsh="gedit ~/.oh-my-zsh"
alias weechat="weechat-curses"
alias mp="ncmpcpp"
alias setbg="~/scripts/setbg"
alias charmap="for i in {50..255}; do  printf "\\$(printf '%03o' $i)\n" ; done"

plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/evolution/scripts:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl

Colors() {
T='gYw'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

