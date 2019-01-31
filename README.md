## Mac-setup 🍇

[![Build Status](https://api.travis-ci.com/jsycdut/mac-setup.svg?branch=master)](https://travis-ci.com/jsycdut/mac-setup)  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 简介 🙉

这是一个为你的Mac自动安装软件的Bash脚本，让你抽出时间喝咖啡而不是把时间花费在下载和安装你需要的软件。

本项目有两个分支，master分支用于提供稳定可用的版本，feather分支用于开发新特性，任何改动都会先在feather上进行，然后合并到master上。

## 特点

本项目目前属于V0.2版，用于为OS X用户，尤其是为重装OS X系统之后的用户配置软件开发以及日常的娱乐环境，主要特点有

1. 涵盖开发以及日常生活的常用软件包
2. 菜单式选择，方便

## 缘起 🙈

每一次我的Mac使用了半年左右，我就会重新安装一遍系统，因为有些东西累积的太多了，需要清理一下，一般我都是备份文件之后，就直接重新在线安装OS X，但是面对干干净净的系统，我总是需要花上小半天的时间来配置我需要的工作环境，比如安装一下vim，配置一下vimrc，去下载jetbrains公司的IDE用于开发，安装一下MySQL这种常见的数据库等，一开始觉得配置挺有意思，还很有成就感，但是做了两次之后就再也不想这么干了，因为新鲜感早已过去，剩下的只是消耗时间的重复，所以我写了这么个脚本来自动安装一些常用的软件。

## 使用 🙊

打开您喜欢的终端模拟器，简单执行下面两条命令即可

```bash
git clone https://github.com/jsycdut/mac-setup && cd mac-setup
./install.sh
```
## 软件清单 🐕

软件清单分两个，`cli.txt gui.txt`，cli.txt中，包含了可以使用`brew install`来安装的一些命令行软件工具，比如wget，vim，curl，node.js，npm等，gui.txt中，包含了使用`brew cask install`来安装的图形化界面工具，比如QQ，微信，网易云音乐，Intelij IDEA等。

![app_list](https://raw.githubusercontent.com/jsycdut/photos/master/mac-setup/app-list.png)

## 使用效果 🐈

在我的MacBook Pro 2015，OS X 10.11.6(系统已经比较旧了)的安装效果如下，这里因为我的系统比较旧，所以安装iTerm2就不满足依赖要求，无法安装，还有安装cli程序比如mysql，node.js，npm等都被brew“拒绝”，所以，希望使用的同学将系统尽量更新到较新的版本，这样安装也会顺利些。

![install-gui](https://raw.githubusercontent.com/jsycdut/photos/master/mac-setup/install-gui.png)

![install-cli](https://raw.githubusercontent.com/jsycdut/photos/master/mac-setup/install-cli.png)

## Travis CI✨

因为本项目引入了Travis CI，所以在read命令的使用上加了倒计时，这样是为了通过Travis CI的测试，可能会有一点影响体验，后期会考虑剔除Travis CI。

