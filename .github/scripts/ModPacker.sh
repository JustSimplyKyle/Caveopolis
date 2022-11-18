#!/bin/bash

############################
### 模組包漢化補丁製作腳本 ###
###### Made by Efina #######
############################

### 設定區 ###

## 模組包名稱
ModPackName=Caveopolis

## 要建立進模組包漢化補丁中的陣列
ConfigPath=(config kubejs patchouli_books LICENSE simple-rpc options.txt)

### 腳本執行區 ###

# 設置回主工作區
cd "$GITHUB_WORKSPACE" || exit

# 製作一個臨時資料夾
workdir="$(mktemp -d)"

# 複製內容到臨時資料夾
for path in "${ConfigPath[@]}"; do
  cp -r "$path" "$workdir/"
done

# 壓縮並製作模組包漢化補丁
cd $workdir && zip -r "$OLDPWD/$ModPackName-Patches-$VERSION.zip" *
