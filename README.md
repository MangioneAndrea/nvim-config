# Nvim config

This is my nvim config, feel free to copy and make your own version of it.

## Usage

### Linux/MacOS

Install packer

`git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.Nvim`

Setup this repo

`git clone https://github.com/MangioneAndrea/nvim-config ~/.config/nvim`

### Windows

Install packer

`git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"`

Setup this repo

`git clone https://github.com/MangioneAndrea/nvim-config "$env:LOCALAPPDATA\nvim"`

3) Sync packages

After opening nvim, with normal mode type :PackerSync

4) Add additional features, if not installed already

[ripgrep](https://github.com/mrLuisFer/neovim-dotfiles/blob/main/README.md#--ripgrep) - Which allows `ctrl-f` to fuzzy search inside the repo 

5) Enjoy your new IDE
