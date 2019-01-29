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
  if command -v brew > /dev/null 2>&1; then
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

# 图形化软件包清单
brew_gui_app_list=(
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

# 命令行软件包清单
brew_cli_app_list=(
'wget 命令行下载工具'
'mysql MySQL数据库'
'aria2 又一个下载工具'
'tree 属性目录展示'
'vim 编辑器之神Vim'
'curl URL处理工具'
'shadowsocks-libev Shadowsocks命令行客户端'
)

# 菜单
menu() {
  for((i=0; i<${#brew_cli_app_list[@]}; i++)); do
    echo
    echo `expr $i + 1` ' ' ${brew_cli_app_list[i]}
  done    

  for((i=0; i<${#brew_gui_app_list[@]}; )); do
    echo
    printf "%-4s %-10s %-4s %-10s %-4s %-4s\n" `expr $i + 1` ${brew_gui_app_list[i]} `expr $i + 2` ${brew_gui_app_list[i++]} `expr $i + 2` ${brew_gui_app_list[i++]}
    #let i+=3
  done    
}

# 安装命令行软件包
install_cli_apps() {
  :
}

# 安装图形化软件包
install_gui_apps() {
  :
}


# 这里只是用于提示用户，使用Ctrl C退出
#read -t 5 -p "按下任意键继续，如需退出，请按Ctrl C，倒计时5秒" user_command
menu
