sudo easy_install pip
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/Library/Application\ Support/pip
touch ~/Library/Application\ Support/pip/pip.conf
echo "
[global]

index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/Library/Application\ Support/pip/pip.conf\

pip install virtualenvwrapper

echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc