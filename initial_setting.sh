cd ~

LANG=C xdg-user-dirs-gtk-update

sudo sed -i.bak -e "s%http://jp.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y

# gitのインストール
sudo apt-get install git xclip tmux -y

# git にユーザー名とemailを追加
git config user.name "being"
git config --global user.email "34680324+being24@users.noreply.github.com"

sudo apt-get install python-pip python2.7 python2.7-dev python3

# microのインストール
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin

# bashrcのオリジナルの保存
sudo cp .bashrc .bashrc.origin

#batのインストール
sudo apt-get install bat -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

#fdのインストール
sudo apt-get install fd-find -y

#exaのインストール
wget http://archive.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb
rm ./exa_0.9.0-4_amd64.deb

# bash it 入れる
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

bash-it enable completion docker docker-compose docker-machine git pip3 ssh tmux

echo alias cat='batcat' >> .bashrc
echo alias fd='fdfind' >> .bashrc
echo alias ls='exa' >> .bashrc
sed -i -e 's/bobby/pure/g' ~/.bashrc
source ~/.bashrc
