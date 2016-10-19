# Homebrewを最新版にアップデート
update

# formulaを更新
upgrade --all

# バージョン違いを個別のformulaとして提供する
tap homebrew/versions
# for ergodox ez customize
tap osx-cross/avr

install zsh
install go
install ghq
install peco
install git
install tig
install tmux
install reattach-to-user-namespace
install wget
install curl
install openssl
install the_silver_searcher
install homebrew/games/nethack4
install avr-libc
install watchman

#tap splhack/homebrew-splhack
#install --HEAD cmigemo-mk
#install --HEAD ctags-objc-ja
#install gettext-mk
#install cscope
#install lua
#install --HEAD macvim --with-lua --with-cscope --override-system-vim

# cask
tap caskroom/cask
tap caskroom/versions

cask install java
cask install alfred
cask install dash
cask install sourcetree
cask install teensy
cask install karabiner
cask install bettertouchtool
cask install path-finder
cask install timemachineeditor
cask install the-unarchiver
cask install iterm2
cask install webstorm
cask install google-chrome
cask install vagrant
cask install virtualbox
cask install lastpass
cask install vlc
cask install mplayerx
cask install makemkv
cask install air-video-server-hd
cask install handbrake
cask install scansnap-manager
cask install dropbox
cask install near-lock
cask install flux
cask install lumen
cask install 0xed
cask install skype
# cask install parallels9
cask install haskell-platform
cask install kindle
cask install android-file-transfer
cask install steam

# 不要なファイルを削除
cleanup
cask cleanup

# Applicationにリンクを作成する
linkapps

# alfredの検索対象に入れる -> Powerpackが必要らしい
# cask alfred link
