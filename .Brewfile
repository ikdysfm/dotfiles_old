# Homebrewを最新版にアップデート
update

# formulaを更新
upgrade

# バージョン違いを個別のformulaとして提供する
tap homebrew/versions

install zsh
install git
install tig
install tmux
install reattach-to-user-namespace
install wget
install curl
install openssl

tap splhack/homebrew-splhack
install --HEAD cmigemo-mk
install --HEAD ctags-objc-ja
install gettext-mk
install cscope
install lua
install --HEAD macvim --with-lua --with-cscope

# cask
tap phinze/homebrew-cask
install brew-cask
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

# 不要なファイルを削除
cleanup

# Applicationにリンクを作成する
linkapps

# alfredの検索対象に入れる
cask alfred link
