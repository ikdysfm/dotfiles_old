# Homebrewを最新版にアップデート
update

# formulaを更新
upgrade

# バージョン違いを個別のformulaとして提供する
tap homebrew/versions

install zsh
install peco
install git
install tig
install tmux
install reattach-to-user-namespace
install wget
install curl
install openssl
install the_silver_searcher

tap splhack/homebrew-splhack
install --HEAD cmigemo-mk
install --HEAD ctags-objc-ja
install gettext-mk
install cscope
install lua
install --HEAD macvim --with-lua --with-cscope --override-system-vim

# cask
install caskroom/cask/brew-cask
tap caskroom/versions

cask install atom
cask install alfred
cask install karabiner
cask install bettertouchtool
cask install xtrafinder
cask install timemachineeditor
cask install the-unarchiver
cask install iterm2
cask install google-chrome
cask install lastpass
cask install vlc
cask install mplayerx
cask install makemkv
cask install handbrake
cask install scansnap-manager
cask install dropbox
cask install 0xed
# cask install parallels9
cask install haskell-platform

# 不要なファイルを削除
cleanup
cask cleanup

# Applicationにリンクを作成する
linkapps

# alfredの検索対象に入れる -> Powerpackが必要らしい
# cask alfred link
