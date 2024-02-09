# Neovim config


### Install Neovim
```shell
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-macos/bin/nvim
```

```shell
brew install neovim
```

### Install Packer
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvima
```

### Add the repo

Add the .nvim folder to your local hidden from root to the .config folder:

```sh
~/.config/<nvim-folder-here>
```

### Source the Package

Open vim at the `packer.lua` file

```sh
vim ~/.config/nvim/lua/scottykaye/packer.lua
```


Source this file
```sh
:so
```

Run `PackerSync`
```sh
:PackerSync
```

and LETS GO
