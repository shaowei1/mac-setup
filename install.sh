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

# 全局变量
row_number=0
column_number=0
type=cli

# 安装Homebrew并换TUNA源
install_homebrew() {
  if `command -v brew > /dev/null 2>&1`; then
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

  cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git

  brew update
}

# 检查是否已安装某软件包
check_installation() {
  if [[ $type == "cli" ]]; then
    brew list -l | grep $1 > /dev/null 
  else
    brew cask list -1 | grep $1 > /dev/null
  fi

  if [[ $? -eq 0 ]]; then
     return 0
  fi

  return 1
}

# 使用brew安装软件包
install() {
  check_installation $1
  if [[ $? -eq 0 ]]; then
    echo "==>" $1 "已安装，跳过..."
  else
    echo "==>正在安装" $1
    if [[ "$type" == "cli" ]]; then
      brew install $1 > /dev/null
      echo $?
    else
      brew cask install $1 > /dev/null
    fi

    if [[ $? -eq 0 ]]; then
      echo "==>安装成功" $1
    else
      echo "==>安装失败" $1
    fi
  fi
}

# 显示菜单
show_menu() {
  echo
  read -t 10 -p "请选择要显示的软件包菜单列表类型 [0]命令行 [1]图形化(默认)：" ans
  echo

  case $ans in
    0) cat cli.txt && type="cli"
    ;;
    1) cat gui.txt && type="gui"
    ;;
    *) cat gui.txt && type="gui"
    ;;
  esac

  echo
}

# 检查AWK是否可用
check_awk() {
  if ! `command -v awk > /dev/null`; then
    echo 未检测到AWK，请先安装AWK再执行本程序...
    exit 127
  fi
}

# 利用awk，从cli.txt gui.txt两文件中截取软件包名称
get_package_name() {
  local file_name=$1
  local row=$2
  local col=$3
  awk -v line=$row -v field=$col '{if(NR==line){print $field}}' $file_name
}

# 计算与软件名称编号对应的行和列号码
# 不要破坏cli.txt gui.txt文件排版
# 否则会导致计算行列值失败，进而无法提取出正确的软件包名称
locate() {
  local tmp=`expr $1 + 2`
  row_number=`expr $tmp \/ 3`
  tmp=`expr $1 % 3`
  [ $tmp -eq 0 ] && tmp=3
  column_number=`expr $tmp \* 3 - 1`
}

cat << EOF

     Homebrew，真正的OS X缺失的包管理器
     使用本脚本，需要注意一些事情

=>1. 安装QQ 微信 Intellij IDEA或者pycharm之类的图形化软件
     可能需要你输入用户密码，这是Homebrew的规则，所以
     希望您在安装图形化软件的时候，将您的咖啡带到电脑旁边喝

=>2. Homebrew的输出很长很多，所以我就将安装信息都清掉了

     最后，祝使用愉快 (:
EOF

# 程序入口
while : ; do
  show_menu
  read -t 10 -p "请输入您想要安装的软件包的编号（多个软件包请用空格分隔，直接回车则全部安装）" ans
  IFS=$'\n'
  read -d "" -ra arr <<< "${ans//' '/$'\n'}" # 本脚本中最喜欢的一句代码了

  # 处理单纯的回车
  if [[ "${#arr[@]}" -eq 0 ]]; then
    lines=`wc -l "$type"".txt" | awk '{printf $1}'`
    count=`expr $lines \* 3`
    for((i=0; i<$count; i++)); do
      arr[$i]=`expr $i + 1`
    done
  fi

  for app in ${arr[*]}; do
    if [ $app -eq $app 2>/dev/null ]; then
      :
    else
      continue
    fi

    locate $app
    name=`get_package_name "$type"".txt" $row_number $column_number`
    [ -z "$name" ] && continue
    install $name
  done

  read -t 10 -p "是否继续查看菜单列表，Y/y继续，N/n退出 ：" ans
  case $ans in
    Y|y) :
    ;;
    *) break
    ;;
  esac
done
