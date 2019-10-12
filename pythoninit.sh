#!/bin/sh
pyenv install 2.7.15
pyenv virtualenv 2.7.15 neovim2
pyenv activate neovim2
pip2 install neovim
pyenv which python
pyenv install 3.5.3
pyenv virtualenv 3.5.3 neovim3
pyenv activate neovim3
pip install neovim
pyenv which python
