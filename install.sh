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
install_homebrew() {
  if command -v brew; then
    echo 'Homebrew已安装'
  else
    echo '正在安装Homebrew'
	  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? -eq 0  ]]; then
      echo 'Homebrew安装成功'
    else
      echo 'Homebrew安装失败，请检查网络连接...'
      exit 127
    fi
  fi

  echo '为了让brew运行更加顺畅，将使用清华大学TUNA提供的镜像'
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
  
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
  brew update
}

# GUI软件包清单
# 在这里添加或者删除你需要的GUI软件包名称

brew_cask_app_list=(
'qq 腾讯QQ'
'wechat 微信'
'telegram-desktop 聊天工具Telegram（电报）'
'neteasemusic 网易云音乐'
'iina 视频播放器'
'typora Markdown编辑器'
'alfred 软件启动工具'
'iterm2 终端模拟器'
'google-chrome 谷歌浏览器'
'firefox 火狐浏览器'
'wireshark 抓包工具Wireshark'
'etcher 启动盘制作工具'
'intellij-idea JVM平台语言IDE'
'pycharm Python开发工具'
'clion C以及C++开发工具'
'datagrip 数据库操作的瑞士军刀'
'webstorm 前端开发利器'
)

# 安装GUI软件包
install_cask_app(){
	for app in ${brew_cask_app_list[@]}; do
		brew cask install $app
	done
}

# CLI软件包清单
brew_cli_app_list=(
'wget 命令行下载工具'
'mysql MySQL数据库'
'aria2 又一个下载工具'
'tree 属性目录展示'
'vim 编辑器之神Vim'
'curl URL处理工具'
'shadowsocks-libev Shadowsocks命令行客户端'
)

# 安装CLI软件包
install_cli_app(){
	for app in ${brew_cli_app_list[@]}; do
		brew install $app
	done
}

# 这里只是用于提示用户，使用Ctrl C退出
read -t 5 -p "按下任意键继续，如需退出，请按Ctrl C，倒计时5秒" user_command
if command -v brew > /dev/null 2>&1; then
	echo -e '您的Mac已经安装了homebrew，即将为您安装列表中的软件包🍻  \n'
else
	echo -e '您的Mac OS尚未安装homebrew，正准备为您安装🍻  \n'
	install_homebrew
	brew update
fi

install_cli_app
install_cask_app

menu() {
  : 
}

install_cli_apps() {
  :
}

install_gui_apps() {
  :
}


