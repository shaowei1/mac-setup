## Mac-setup
[![Build Status](https://api.travis-ci.com/jsycdut/mac-setup.svg?branch=master)](https://travis-ci.com/jsycdut/mac-setup)
## Introduction 🙉
🐼 If you are a non-chinese speaker, please check out the en-branch of this project

这是一个为你的Mac自动安装软件的Bash脚本，让你抽出时间喝咖啡而不是把时间花费在下载和安装你需要的软件。

## Why 🙈
每一次我的Mac使用了半年左右，我就会重新安装一遍系统，因为有些东西累积的太多了，需要清理一下，一般我都是备份文件之后，就直接重新在线安装OS X，但是面对干干净净的系统，我总是需要花上小半天的时间来配置我需要的工作环境，比如安装一下vim，配置一下vimrc，去下载jetbrains公司的IDE用于开发，安装一下MySQL这种常见的数据库等，一开始觉得配置挺有意思，还很有成就感，但是做了两次之后就再也不想这么干了，因为新鲜感早已过去，剩下的只是消耗时间的重复，所以我写了这么个脚本来自动安装一些常用的软件。

## How 🙊
1. 克隆本仓库到您的电脑

2. 进入仓库目录，要执行安装，只需要执行`./install_app_for_mac.sh`即可。如果提示此脚本没有运行权限，请执行`chmod u+x install_app_for_mac.sh`

## 软件清单 🐕
软件清单分两个，`brew_cask_app_list`为GUI软件包，`brew_cli_app_list`为CLI软件包，这二者都是数组。

## 如何添加自定义的软件包 🔥
这很简单，只需要改写`install_app_for_mac.sh`里面的`brew_cask_app_list`和`brew_cli_app_list`这两个数组即可，你可以删除里面你不想要的软件包，你也可以在对应的数组里面加入你想要的软件包，注意分清GUI和CLI即可。

目前已经列入安装清单的软件包如下

| 名称 | 类别 | 介绍 |
| :--: | :--: | :--: |
| IINA |  GUI | 视频播放 |
|alfred|  GUI | spotlight的替代品|
|iterm2|  GUI | 优秀的Mac终端工具|
|google-chrome| GUI |谷歌浏览器|
|firefox| GUI|火狐浏览器|
|wireshark| GUI |网络抓包工具|
|etcher| GUI | U盘烧录工具|
|telegram-desktop|GUI|聊天工具Telegram|
|intellij-idea|GUI|jetbrains, Java IDE|
|pycharm|GUI|jetbrains，Python IDE|
|clion|GUI|jetbrains, C && C++  IDE|
|datagraip|GUI|jetbrains, Database IDE|
|webstorm|GUI|jetbrains, Web front end IDE|
|mysql|CLI|MySQL数据库|
|wget|GLI|网络下载器|
|aria2|CLI|网络下载器|
|tree|CLI|图形化显示目录内容|

## 使用效果 🐈
> 安装homebrew，`./install_app_for_mac.sh`

![](https://raw.githubusercontent.com/jsycdut/mac-setup/master/step-1-isntall-homebrew.png)
![](https://raw.githubusercontent.com/jsycdut/mac-setup/master/step-2-install-your-app.png)
