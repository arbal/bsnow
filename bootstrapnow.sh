#!/usr/bin/env bash

source ./shootProfile.sh

shootProfile.sh

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    alias ls='ls --color=auto'
    ;;
  'FreeBSD')
    OS='FreeBSD'
    alias ls='ls -G'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin') 
    OS='Mac'
    ;;
  'SunOS')
    OS='Solaris'
    ;;
  'AIX') ;;
  *) ;;

# if ! [ -x "$(command -v git)" ]; then
#   echo 'git is not installed. trying to install git...' >&2
#   if ! [ -x "$(command -v curl)" ]; then
#     echo 'curl is not installed. trying to install curl...' >&2
    
#   fi
# fi

zsh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd
mv .zshrc .zshrc.ORIG
wget https://gist.githubusercontent.com/arbal/56d1e86afdbbc55a6b489d6e0799df87/raw/512f7d2ed800fc645bb34a46f02abbd54d393aae/.zshrc
