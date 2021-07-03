# ディレクターの移動
cd ~

# デフォルトファイルの英語化
LANG=C xdg-user-dirs-gtk-update

sudo apt-get update  -y && sudo apt-get upgrade  -y && sudo apt-get autoremove -y

# sshの有効化、avahi-daemonのインストール
sudo apt-get install –y install openssh-server
sudo apt-get install –y avahi-daemon

# 基本のアプリケーションのインストール
sudo apt-get install –y git xclip tmux curl htop

# git にユーザー名とemailを追加
git config --global user.name "being"
git config --global user.email "34680324+being24@users.noreply.github.com"

# .bashrcのバックアップ
sudo cp .bashrc .bashrc.origin

# microのインストール
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin

# batcatのインストール
curl -L https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_arm64.deb > bat.deb
sudo dpkg -i bat.deb
sudo rm bat.deb
echo alias cat='batcat' >> .bashrc

# pythonのインストール
sudo apt-get install python3 python3-pip python3-setuptools -y

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

# i2cのインストール
sudo apt-get install –y i2c-tools python3-smbus
sudo adduser being i2c

# codeのインストール
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64"
sudo dpkg -i code.deb

# xpadneoのインストール
sudo apt-get install -y dkms linux-headers-`uname -r`
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh

cd ~
source ~/.bashrc

# /etc/bluetooth/main.confを編集 https://atar-axis.github.io/xpadneo/#troubleshooting
# [General]
# Privacy=device
# ControllerMode=dual

# HDMIの順位の変更
# /boot/firmware/usercfg.txtに以下の内容を追記する
# hdmi_force_hotplug=1
# hdmi_group=2
# hdmi_mode=82

# ROS2のインストール
