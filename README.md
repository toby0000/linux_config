# 介绍
在ubuntu上自动安装和配置相关开发工具

# 要求
- ubuntu 18

## 主要原因
1. 由于ubuntu 18以下版本安装nvim无法通过apt直接下载。
2. nvim部分插件要求python3.6以上，由于ubuntu 18以下版本apt下载默认最新为3.5

# 说明
install.sh: 用于安装各类工具
Makefile: 用于安装各类配置文件

# 使用方法
## 下载
git clone https://github.com/toby0000/linux_config ~/.linux_config

## install.sh
./install.sh -h|--help: 查看帮助

## Makefile
1. make [opt]: 安装对应选项的配置
2. make: 安装所有配置

