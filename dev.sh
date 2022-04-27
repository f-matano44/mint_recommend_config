#!/bin/bash

# エイリアス（別名）をつける
echo "alias la='ls -a'" >> ~/.bashrc

sudo apt update
sudo apt upgrade -y
sudo apt install -y virtualbox
sudo apt install -y build-essential
sudo apt install -y python-is-python3
sudo apt install -y python3-pip
flatpak install -y flathub com.unity.UnityHub

# JDK のインストール
sudo apt remove -y java-common # 最初から入っている java を削除
# Azul zulu(JDK)
sudo apt-get -q update
sudo apt-get -yq install gnupg curl
sudo apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-2_all.deb
sudo apt-get install ./zulu-repo_1.0.0-2_all.deb
sudo apt-get update
sudo apt-get install zulu11-jdk