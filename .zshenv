# -*- mode: sh; indent-tabs-mode: nil -*-

# 環境変数
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export JAVA_HOME=`/usr/libexec/java_home`
export DERBY_HOME=/usr/share/java/derby-10.8.1.2
export PYTHONPATH="/lib/python2.7/site-packages/"

# PATHの設定
##   typeset
##    -U 重複パスを登録しない
##    -x exportも同時に行う
##    -T 環境変数へ紐付け
##
##   path=xxxx(N-/)
##     (N-/): 存在しないディレクトリは登録しない
##     パス(...): ...という条件にマッチするパスのみ残す
##        N: NULL_GLOBオプションを設定。
##           globがマッチしなかったり存在しないパスを無視する
##        -: シンボリックリンク先のパスを評価
##        /: ディレクトリのみ残す
##        .: 通常のファイルのみ残す
typeset -U path
path=(
  # system
  /bin(N-/)
  /usr/local/bin(N-/)
  /usr/bin(N-/)
  /usr/games(N-/)
  # personal
  $HOME/bin
  # --prefix=$HOME/localでインストールしたもの
  $HOME/local/bin(N-/)
  # gem install --user-installでインストールしたもの
  $HOME/.gem/ruby/*/bin(N-/)
  # rbenv
  $HOME/.rbenv/bin(N-/)
  # python
  $HOME/Library/Python/2.7/bin(N-/)
  # Haskell
  $HOME/Library/Haskell/bin(N-/)
  # nodebrew
  $HOME/.nodebrew/current/bin(N-/)
  # java
  $JAVA_HOME/bin(N-/)
  $DERBY_HOME/bin(N-/)
  $HOME/glassfish4/bin(N-/)
  # Debian GNU/Linux用
  #/var/lib/gems/*/bin(N-/)
  # MacPorts用
  #/opt/local/bin(N-/)
  # Solaris用
  #/opt/csw/bin(N-/)
  #/usr/sfw/bin(N-/)
  #/usr/ccs/bin(N-/)
  # Cygwin用
  #/cygdrive/c/meadow/bin(N-/)
)

# sudo時のパスの設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

# rbenv homebrew経由の場合はzprofileに書く
if [ -d ${HOME}/.rbenv ] ; then
  eval "$(rbenv init -)"
fi
