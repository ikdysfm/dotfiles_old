if [ -d ${HOME}/.anyenv ] ; then
  eval "$(anyenv init -)"

  # for tmux
  for D in `\ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi
