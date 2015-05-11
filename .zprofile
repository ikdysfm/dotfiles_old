if [ -d ${HOME}/.rbenv ] ; then
  eval "$(rbenv init -)"
fi

if [ -d ${HOME}/.pyenv ] ; then
  eval "$(pyenv init -)"
fi
