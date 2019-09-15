# arduino-ide

Dockerを使ったArduinoの開発環境です．  
Neovim + Coc.nvim + cqueryで高度な補完が利用できます．

# できること

* Arduino UNOのソースコード作成，ビルド

# できないこと

* デバイスへの書き込み（ROM焼き）  
→Dockerコンテナ内ではUSBデバイスが扱えないため，Dockerコンテナ外で書き込む必要があります．別途Arduino IDE等をお使いください．
* Arduino UNO以外のデバイスへのビルド  
→platformio.iniファイル等を修正する必要があります．

# 必要なもの

* Git
* Docker Desktop for Windows / Docker Desktop for Mac  
https://www.docker.com/products/docker-desktop

# 使い方

## インストール，起動

```bash
$ git clone https://github.com/k-ishigaki/arduino-ide.git
$ cd arduino-ide
$ docker-compose up -d
$ docker-compose exec main bash
```

## ビルド

```bash
# after 'docker-compose exec main bash'
$ make
```

## ソースコード編集

```bash
# after 'docker-compose exec main bash'
$ nvim src/main
```

## 終了，アンインストール

```bash
# after 'dokcer-compose exec main bash'
$ exit
$ docker-compose down --rmi all
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
