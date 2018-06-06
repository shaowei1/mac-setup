# mac-setup
A simple script for installing apps on your Mac
这是一个为你的Mac自动安装软件的Bash脚本，让你抽出时间喝咖啡而不是把时间花费在下载和安装你需要的软件。

# Why?
每一次我的Mac使用了半年左右，我就会重新安装一遍系统，因为有些东西累积的太多了，需要清理一下，一般我都是备份文件之后，就直接重新在线安装OS X，但是面对干干净净的系统，我总是需要花上小半天的时间来配置我需要的工作环境，比如安装一下vim，配置一下vimrc，去下载jetbrains公司的IDE用于开发，安装一下MySQL这种常见的数据库等，一开始觉得配置挺有意思，还很有成就感，但是做了两次之后就再也不想这么干了，因为新鲜感早已过去，剩下的只是消耗时间的重复，所以我写了这么个脚本来自动安装一些常用的软件。

# How?
1. 克隆本仓库到您的电脑

2. 进入仓库目录，要执行安装，只需要执行`./install_app_for_mac.sh`即可。如果提示此脚本没有运行权限，请执行`chmod u+x install_app_for_mac.sh`

# TODO
添加用户自定义软件

# 使用效果
> 安装homebrew
![]()https://raw.githubusercontent.com/jsycdut/mac-setup/master/step-1-isntall-homebrew.png

> 安装好homebrew后使用brew安装app
![](https://raw.githubusercontent.com/jsycdut/mac-setup/master/step-2-install-your-app.png)
