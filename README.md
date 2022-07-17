原地址 [nvchad.github.io](https://nvchad.github.io/quickstart/install#pre-requisites)

在Docker容器中尝试
-----------------------------------------------------------------------------

这将保持当前的Neovim配置不变。一旦退出Neovim，Docker image将被删除。

```
docker run -w /root -it --rm alpine:edge sh -uelic '
   apk add git nodejs neovim ripgrep alpine-sdk --update
   git clone https://github.com/NvChad/NvChad ~/.config/nvim
   nvim
   '
```

预先准备
-----------------------------------------------------------

*   [Neovim 0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0)
*   如果neovim对你的操作系统来说很老，那么考虑试试这个[Neovim版本管理器](https://github.com/MordechaiHadad/bob)
*   在使用的终端中[使用一种Nerd Font](https://www.nerdfonts.com/).

### 半可选

*   _Telescope_ 在grep搜索时需要 [`ripgrep`](https://github.com/BurntSushi/ripgrep)

安装
---------------------------------------------

### Linux/MacOS

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### Windows

```
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 && nvim
```

(注意: Windows 必须安装 [`mingw`](http://mingw-w64.org/doku.php) 或者将其设置在Path中)

更新
-------------------------------------------

NvChad 有一个内置的更新机制，它将把任何新的更新拉到git存储库中。

*   通过按下 `<leader> + uu` 来更新NvChad
    
*   **注意**: 在 NvChad 默认设置中, `<leader>` 为 `<space>` 按键
    

这将在NeoVim中打开一个提示，警告您它即将执行 `git reset --hard` 并且 **您将失去任何** 在custom文件夹外进行过的自定义更改

卸载
-------------------------------------------------

```
# linux/MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```
