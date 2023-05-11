cd ~

LANG=C xdg-user-dirs-gtk-update

sudo apt-get update && sudo apt-get upgrade -y

# gitのインストール
sudo apt-get install git -y

# git にユーザー名とemailを追加
git config --global user.name "being"
git config --global user.email "34680324+being24@users.noreply.github.com"
git config --global core.quotepath false

mkdir programs
cd pregrams

git clone https://github.com/being24/dotfiles.git
cd ~

sudo apt-get install python3-pip python3

# microのインストール
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin

# bashrcのオリジナルの保存
sudo cp .bashrc .bashrc.origin

#batのインストール
sudo apt-get install bat -y

sudo apt autoremove -y
sudo apt autoclean -y

echo alias cat='batcat' >> .bashrc

# cica フォントのインストール
mkdir cica
cd cica
curl -L -O https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip
unzip Cica_v5.0.3.zip
sudo mkdir  /usr/share/fonts/truetype/cica
sudo cp *.ttf /usr/share/fonts/truetype/cica/
sudo fc-cache -vf
cd ~
rm -rf cica

# alacrittyのインストール
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
curl https://sh.rustup.rs -sSf | sh -s -- -y
. $HOME/.cargo/env
cd programs
git clone https://github.com/alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

mkdir $HOME/.config/alacritty/
sudo ln -s ~/programs/dotfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml

cd ~

mkdir ~/programs/zellij
cd ~/programs/zellij
curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep zellij-x86_64 | grep linux | grep browser_download_url | cut -d : -f 2,3 | tr -d \" | wget -qi -
tar -xzvf zellij-x86_64-unknown-linux-musl.tar.gz
rm zellij-x86_64-unknown-linux-musl.tar.gz
sudo mv zellij /usr/local/bin
chmod +x /usr/local/bin/zellij

echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
echo '[ -z "$ZELLIJ" ] && zellij' >> ~/.bashrc

. ~/.bashrc


# code

# GPGキーをダウンロード(配布先のものが改ざん等がないかを確認するための公開鍵)
# apt-key add にて信頼できるキーとして登録
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# microsoftのリポジトリをaptリポジトリに追加
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# リポジトリの更新 & インストール
sudo apt update
sudo apt install -y code

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
