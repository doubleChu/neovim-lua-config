> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [nvchad.github.io](https://nvchad.github.io/quickstart/install#pre-requisites)

> Try in docker container

Try in docker container[​](#try-in-docker-container "Direct link to heading")
-----------------------------------------------------------------------------

This will leave your current Neovim configuration untouched. Once you exit Neovim, the image is deleted.

```
docker run -w /root -it --rm alpine:edge sh -uelic '    apk add git nodejs neovim ripgrep alpine-sdk --update    git clone https://github.com/NvChad/NvChad ~/.config/nvim    nvim    '
```

Pre-requisites[​](#pre-requisites "Direct link to heading")
-----------------------------------------------------------

*   [Neovim 0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0)
*   If neovim's very old for your OS then consider trying this [neovim version manager](https://github.com/MordechaiHadad/bob)
*   [Use a Nerd Font](https://www.nerdfonts.com/) in your terminal emulator.

### Semi-optional[​](#semi-optional "Direct link to heading")

*   [`ripgrep`](https://github.com/BurntSushi/ripgrep) is required for grep searching with _Telescope_

Install[​](#install "Direct link to heading")
---------------------------------------------

### Linux/macos (UNIX)[​](#linuxmacos-unix "Direct link to heading")

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### Windows[​](#windows "Direct link to heading")

```
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 && nvim
```

(Note: windows users must have [`mingw`](http://mingw-w64.org/doku.php) installed & set on path)

Update[​](#update "Direct link to heading")
-------------------------------------------

NvChad has an update mechanism built-in, which will pull any new updates to the git repository.

*   Update nvchad by pressing `<leader> + uu`
    
*   **Note**: by NvChad default, `<leader>` is the `<space>` key
    

This will open a prompt in NeoVim warning you that it is about to do a `git reset --hard` and **you will lose any customisations** you've made to NvChad outside the custom folder

Uninstall[​](#uninstall "Direct link to heading")
-------------------------------------------------

```
# linux/macos (unix)rm -rf ~/.config/nvimrm -rf ~/.local/share/nvimrm -rf ~/.cache/nvim# windowsrd -r ~\AppData\Local\nvimrd -r ~\AppData\Local\nvim-data
```
