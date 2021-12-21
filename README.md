# the Usage of My Neovim

> if you want to copy My neovim configuration, this readme tutorial may help you a lot.

> Also, this configuration help me to remember the forgotten function. After all, the configuration is so much.

![](https://raw.githubusercontent.com/Rogerskelamen/nvim/master/images/screenshot.png)

## Installation

1. Of course you have to install `Neovim`:

  - for Windows:

    ```powershell
    choco install neovim
    ```

  - for Linux:

    ```shell
    apt install neovim
    ```

  - for MacOS:

    ```shell
    brew install neovim
    ```

  > if you don't know what Neovim is, please see [here](https://neovim.io) and [here](https://github.com/neovim/neovim)

2. clone the repo into your `$HOME/.config/`

  ```shell
  git clone https://github.com/Rogerskelamen/nvim.git
  mv -r ./nvim $HOME/.config/
  ```

3. get into your neovim and add plugin: `:PlugInstall`(*optional but recommended*)

## Dependencies

- `python3`

- `node`

### Plugin Management

> My neovim use [vim-plug](https://github.com/junegunn/vim-plug) as default plugin manager

You can change it into other plugin manager as you wish

### Code Completion

> I use the [coc.nvim](https://github.com/neoclide/coc.nvim) as default code completion tool

#### the extensions in Conquer of Completion

- `coc-yank`

- `coc-vimlsp`

- `coc-syntax`

- `coc-snippets`

- `coc-marketplace`

- `coc-json`

- `coc-html`

- `coc-vetur`

- `coc-tsserver`

- `coc-jedi`

- `coc-java`

- `coc-go`

- `coc-css`

- `coc-clangd`

You easily change one of them by set the following setting:

```vim
let g:coc_global_extensions = ['coc-go']
```

## Theme

> My neovim use the [material theme](https://github.com/kaicataldo/material.vim) as default

There has some other options to choose:

- [onedark](https://github.com/joshdick/onedark.vim)

- [neodark](https://github.com/KeitaNakamura/neodark.vim)

- [seoul256](https://github.com/junegunn/seoul256.vim)

  A low-contract theme

- [nova](https://github.com/trevordmiller/nova-vim)

  A low-contract theme with cold color (*mainly blue*)

- [cosmic_latte](https://github.com/haystackandroid/cosmic_latte)

  A eye-protected theme (*it changes along with the time, if you don't like the light background, don't turn it on*)

- [snazzy](https://github.com/connorholyday/vim-snazzy)

  You may find all the colorscheme I integrate don't support transparent background, but for this one.

<u>All of these has coded into the `init.vim`, you can turn on one of them by release the certain comment</u>

### the Cursor

> my neovim makes the cursor as a block when you in normal mode, and it will changes into a slim line once you insert some content

## Basic Usage

> First of all, My LEADER key is <kbd>Space</kbd>, do remember

### Save and Quit

<kbd>S</kbd> for Save, and <kbd>Q</kbd> for Quit

<kbd>Ctrl</kbd>+<kbd>q</kbd> for Quit All!

### the basic movement: J, K, H, L

These four has been changed into move 5 lines or 5 columns

<u>use <kbd>m</kbd> to jump to the end or start of the line</u>

### Windows Open and Move

- `<LEADER>` + movement key

  Move toward the exact direction that you press the key between different windows.

- direction key (<kbd>UP</kbd>...)

  Expand or shrink the windows size according to your direction key

- `<LEADER>` + v or + s

  Create a split window, <kbd>v</kbd> for vertical, <kbd>s</kbd> for no vertical

- `sv`, `sj`

  Change the format of current split window, sv for vertical one, sj for up and down one.

### Tab Usage

- `tu`: open a new tab

- `th`, `tl`: move to a left/right tab

### Indentation Usage

> use only one `>` or `<` to indent the line

### Some LEADER key functions

- `<LEADER>rc`: open the $NVIM/init.vim with nvim.

- `<LEADER>sc`: open the Spell Check function

- `<LEADER>y`: open the clipboard history

- `<LEADER>o`: toggle fold

### Others

> the default <kbd>s</kbd> key has been disabled. You can either transform it into some other key function

- `<LEADER> + <CR>`: make the highlight disabled

- `\v`: visual mode make to line end

- `\s`: the global replace

- double press `<LEADER>`

  Press space twice to jump to the next '<++>' and edit it, this is a little trick to make your coding more sufficiently

## UI Performance

Line number is shown at left, cursorline is also able. And if you want to turn on the relativenumber, please set `set relativenumber`

I have made the neovim shows the `|` when you press <kbd>Tab</kbd> (*polyglot support*), and the `▫` when you press <kbd>Space</kbd> as long as the cursor at end of the line.

---

Also, when you open a file, I make the neovim to put your cursor on the position the last place you closed the file.

---

In addition, when you scroll you screen, the cursor will stay 5 lines above the bottom of the screen and 5 lines below the top of the screen.

## Run Function

> you can run your code just simply press <kbd>r</kbd> key, and the supported languages are listed below:

- `c`

- `c++`

- `java`

- `shell`

- `python`

- `html`

- `markdown`

- `tex`

- `javascript`

- `go`

*Of course you have to get the correct compiler first*

## Plugin Hot Key

- <kbd>Ctrl</kbd>+<kbd>i</kbd>: open NerdTree

- `tt`: open the Tagbar

- `<LEADER>c<LEADER>`: comment or discomment one line or a block

- `<LEADER>f`: open the fzf in neovim

- `<LEADER>r`: open the ranger in neovim

- `[g`: go to the next error place

- `]g`: go to the previous error place

- `gd`: go to the definition

- `gy`: go to the type definition

- `gi`: go to the implementation

- `gr`: go to the references

- <kbd>Ctrl</kbd>+<kbd>h</kbd>: show document

- `<LEADER>H`: preview the Git Change

- `<LEADER>gf`: fold git Gutter

- `g-`: go to previous git change

- `g=`: go to next git change

## Markdown Usage

- `,b`: bold text

- `,i`: italic text

- `,u`: underline text

- `,k`: keyboard text

- `,$`: latex math text

- `<LEADER>t`: toggle markdown table mode
