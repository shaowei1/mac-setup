#! /bin/bash

cat << -EOF
############################################################
# 当前脚本用于在运行OS X的电脑上安装应用程序
# 原理为：利用homebrew作为OS X的包管理器
#         brew install 安装命令行程序
#         brew cask install 安装GUI程序
#         Happy coding ~ Happy life.
# Author: jsycdut <jsycdut@gmail.com>
############################################################
-EOF

# 安装Homebrew
install_homebrew(){
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# GUI软件包清单
# 在这里添加或者删除你需要的GUI软件包名称
# 用于开发的jetbrains公司的产品可能版本较低(commercial projects)
# 可以在安装以后手动升级

brew_cask_app_list=(
iina
alfred
google-chrome
firefox
wireshark
etcher
telegram-desktop
intellij-idea
pycharm
clion
datagrip
webstorm
)

# 安装GUI软件包
install_cask_app(){
	for app in brew_cask_app_list; do
		brew cask install $app
	done
}

# CLI软件包清单
brew_cli_app_list=(
vim
wget
mysql
)

# 安装CLI软件包
install_cli_app(){
	for app in brew_cli_app_list;do
		brew install $app
	done
}

echo "按下任意键继续，如需退出，请按Ctrl C"
# 这里只是用于提示用户，使用Ctrl C退出
read user_command
if command -v brew > /dev/ull 2>&1; then
	continue
else
	install_homebrew
fi
install_cask_app
install_cli_app
