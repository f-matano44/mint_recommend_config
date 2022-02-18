#!/bin/sh

# ディレクトリ名を日本語から英語に
LANG=C xdg-user-dirs-gtk-update

# ubuntu 日本語環境のインストール: Ubuntu Japanese Team より-----------
# 最終閲覧 2022-01-28 https://www.ubuntulinux.jp/products/JA-Localized#repository
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/focal.list -O /etc/apt/sources.list.d/ubuntu-ja.list
# ---------------------------------------------------------------
sudo apt update && sudo apt upgrade -y # 日本語環境の適用
sudo apt install -y ubuntu-defaults-ja # Ubuntu 日本語 Remix に追加されているパッケージ

# 使わないソフトのアンインストール
sudo apt remove -y hexchat #（少なくとも日本では）普及してないのでアンインストール
sudo apt remove -y hypnotix # テレビ番組視聴アプリだけど日本じゃ殆ど映らん

# add-apt-repository コマンドの追加
sudo apt install -y software-properties-common

# アンチウイルスソフト
flatpak install -y flathub com.gitlab.davem.ClamTk
# フォントがぶっ壊れているので修復 (参考: https://p--q.blogspot.com/2020/09/flatpakgnucash.html )
flatpak run --command=fc-cache com.gitlab.davem.ClamTk -f -v

# office ソフトの最新化
sudo apt remove -y libreoffice* # 旧バージョンの削除
flatpak install -y flathub org.libreoffice.LibreOffice # 最新バージョンのインストール
# フォントがぶっ壊れているので修復 (参考: https://p--q.blogspot.com/2020/09/flatpakgnucash.html )
flatpak run --command=fc-cache org.libreoffice.LibreOffice -f -v

# 動画プレイヤーの入れ替え（celluloid, mpv -> VLC）
sudo apt remove -y celluloid mpv
flatpak install -y flathub org.videolan.VLC

# steam（ゲームクライアント）
flatpak install -y flathub com.valvesoftware.Steam
sudo apt install --no-install-recommends steam-devices

# minecraft（超有名ゲームですよね！）
flatpak install -y flathub com.mojang.Minecraft

# Lutris（ゲーム管理ソフト）のインストール
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

# apt からその他必要なソフトをインストール
sudo apt install -y sl # きしゃぽっぽ
sudo apt install -y numlockx # テンキーを自動で有効にしてくれる
sudo apt install -y neofetch # PC の情報を terminal 上で表示
sudo apt install -y cpu-x # PC の情報を GUI 上で表示

# wine (Windows のエミュレータ) のインストール: Wine HQ Wiki より------
# 最終閲覧 2022-01-28 https://wiki.winehq.org/Ubuntu
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
# ---------------------------------------------------------------
sudo apt update && sudo apt install -y --install-recommends winehq-stable
# もしくはこっち（バージョンがそこそこ古いので非推奨）-> sudo apt install -y --install-recommends wine-installer
sudo apt install -y winetricks # これに従って日本語フォント導入してください https://symfoware.blog.fc2.com/blog-entry-2228.html
