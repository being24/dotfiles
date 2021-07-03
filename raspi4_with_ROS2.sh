# ディレクターの移動
cd ~

# デフォルトファイルの英語化
LANG=C xdg-user-dirs-gtk-update

sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove -y

# 基本のアプリケーションのインストール
sudo apt-get install git xclip tmux -y

# git にユーザー名とemailを追加
git config user.name "being"
git config --global user.email "34680324+being24@users.noreply.github.com"

# .bashrcのバックアップ
sudo cp .bashrc .bashrc.origin

# microのインストール
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin

# batcatのインストール
sudo apt-get install bat –y
echo alias cat='batcat' >> .bashrc

# pythonのインストール
sudo apt-get install python3 python3-pip python3-setuptools

# pigpioのインストール
wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
make
sudo make install

# pigpioのデーモン化
wget https://raw.githubusercontent.com/being24/dotfiles/master/pigpiod.service
sudo cp ./pigpiod.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable pigpiod.service

cd ~

# sshの有効化、avahi-daemonのインストール
sudo apt indtsll openssh-server
sudo apt install avahi-daemon

# i2cのインストール
sudo apt install i2c-tools python3-smbus –y
sudo adduser ubuntu i2c

# codeのインストール
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64"
sudo dpkg -i code.deb

sudo apt-get install dkms linux-headers-`uname -r`
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh

source ~/.bashrc

# /etc/bluetooth/main.confを編集 https://atar-axis.github.io/xpadneo/#troubleshooting
# [General]
# Privacy=device
# ControllerMode=dual

# HDMIの順位の変更
# ROS2のインストール
