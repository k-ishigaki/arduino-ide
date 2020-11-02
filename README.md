# arduino-ide

Dockerを使ったArduinoの開発環境です．  
Neovim + Coc.nvim + cqueryで高度な補完が利用できます．

# できること

* Arduino UNOのソースコード作成，ビルド

# 必要なもの

* Git
* Docker Desktop for Windows / Docker Desktop for Mac  
https://www.docker.com/products/docker-desktop
* Arduino IDE  
https://www.arduino.cc/en/main/software  
※Windowsは「Windows Installer」を使用してください．「Windows app」ではavrdudeが使えないためスクリプトが動作しません．

# 使い方

## インストール，起動

```bash
$ git clone https://github.com/k-ishigaki/arduino-ide.git
$ cd arduino-ide
$ docker-compose up -d
$ docker-compose exec main sh
```

## ビルド

```bash
# after 'docker-compose exec main sh'
$ make
```

## バイナリ（.hexファイル）書き込み

```bash
$ .\write_hex.bat COM0                     # Windowsの場合
$ ./write_hex.sh /dev/cu.usbmodem146101    # Macの場合
```

※ポート名はArduino IDEから確認してください．

## ソースコード編集

```bash
# after 'docker-compose exec main sh'
$ nvim src/main.cpp
```

## 終了，アンインストール

```bash
# after 'dokcer-compose exec main sh'
$ exit
$ docker-compose down --rmi all --volume
```

# NeoVimのカスタマイズ

1. 設定ファイルを編集

* ./neovim-docker/dotfiles/
  * init.nvim：NeoVimの基本的な設定
  * plugins.toml：プラグイン定義（dein.vim）

2. コンテナ再作成

```bash
$ docker-compose build --no-cache main
$ docker-compose up -d
```
