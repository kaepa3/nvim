#!/bin/sh
#add config file
mkdir /home/vagrant/config/nvim
git clone https://github.com/kaepa3/nvim.git /home/vagrant/.config/nvim
curl https://gist.githubusercontent.com/kaepa3/b249fab0d0b23e99df57d50879339c2b/raw/9656f6620ed829744cd4209fbf49a4c6952d2394/gitconfig >/home/vagrant/.gitconfig
#pyenv
git clone https://github.com/pyenv/pyenv.git /home/vagrant/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/vagrant/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/vagrant/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> /home/vagrant/.bash_profile
 
#config pyenv
pyenv install 2.7.18
pyenv virtualenv 2.7.18 neovim2
pyenv activate neovim2
pip2 install neovim
pyenv which python
pyenv install 3.5.3
pyenv virtualenv 3.5.3 neovim3
pyenv activate neovim3
pip install neovim
pyenv which python
