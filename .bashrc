#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
WHT="\[\e[97m\]"
RED="\[\e[31m\]"
GRN="\[\e[32m\]"
YLW="\[\e[33m\]"
BLU="\[\e[34m\]"
MAG="\[\e[35m\]"
CYN="\[\e[36m\]"
BBLK="\[\e[90m\]"
RST="\[\e[0m\]"

export RED GRN YLW BLUE MAG CYN RST
# PS1="$BBLK[$WHT\w$BBLK]──$BLU>>$RST "
PS1="$GRN>> $RST"

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH

export VISUAL=vim
export EDITOR=vim

# changes the cursor of terminal when connected to SSH
# ssh() { 
  #if [[ $TMUX = "" ]]; then 
  #  printf '\033]12;%s\007' $grn; command ssh "$@";
  #else
  #  printf '\033Ptmux;\033\033]12;%s\007\033\\' $grn; command ssh "$@";
  #fi
  #printf '\033]12;%s\007' $grn; command ssh "$@";
#}
# resets the cursor every time the prompt is displayed (to reset after ssh session is closed)
# also show current path as window title

#if [[ $TMUX = "" ]]; then 
#  export PROMPT_COMMAND='printf "\033]12;%s\007" $red && echo -en "\033]0;$PWD\007"'
#else
#  export PROMPT_COMMAND='printf "\033Ptmux;\033\033]12;%s\007\033\\" $red && echo -en "\033]0;$PWD\007"'
#fi
export PROMPT_COMMAND='printf "\033]12;%s\007" $grn && echo -en "\033]0;$PWD\007"'

source $HOME/.config/colors/default
source $HOME/.profile

alias sudo='sudo '
alias uniqa_vpn='openvpn --config ~/.vpn/uniqa/gateway-udp-1194.ovpn'
alias sf_vpn='openconnect --juniper --user lrazbinski https://portal.secondfloor.nl/dana-na/auth/url_4/welcome.cgi'

cd $HOME/.config/colors && ./convert.sh default > xdefault
cd $HOME
