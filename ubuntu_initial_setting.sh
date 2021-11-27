cd ~

LANG=C xdg-user-dirs-gtk-update

sudo sed -i.bak -e "s%http://jp.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y

# gitのインストール
sudo apt-get install git xclip tmux curl -y

# git にユーザー名とemailを追加
git config --global user.name "being"
git config --global user.email "34680324+being24@users.noreply.github.com"

sudo apt-get install python-pip python2.7 python2.7-dev python3

# microのインストール
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin

# bashrcのオリジナルの保存
sudo cp .bashrc .bashrc.origin

#batのインストール
sudo apt-get install bat -y

# alacrittyのインストール
# 設定のclone + シンボリックリンク
# PS1の設定を見直す

# alacritty-colorscheme -V apply solarized_dark.yamlをできるようにする

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

echo alias cat='batcat' >> .bashrc
source ~/.bashrc
