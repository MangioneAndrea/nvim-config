# Nvim config

This is my nvim config, feel free to copy and make your own version of it.

## Usage

### Install minimal requirements

#### Linux/MacOS

##### Setup this repo

`git clone https://github.com/MangioneAndrea/nvim-config ~/.config/nvim`

#### Windows

##### Setup this repo

`git clone https://github.com/MangioneAndrea/nvim-config "$env:LOCALAPPDATA\nvim"`

##### Not working?

if you are coming from another config, you probably have to reset everything first, so run 
```
cd $env:LOCALAPPDATA/nvim-data
explorer .
```
and delete everything. Notice that `rm -r` works only with admin ps`

### Init configurations

#### Add additional features, if not installed already

[ripgrep](https://github.com/mrLuisFer/neovim-dotfiles/blob/main/README.md#--ripgrep) - Which allows `ctrl-f` to fuzzy search inside the repo 

[arduino-cli](https://github.com/arduino/arduino-cli) - for Arduino development (must also run `arduno-cli core install arduino:avr`)

#### Enjoy your new Editor!
