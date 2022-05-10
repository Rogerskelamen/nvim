# the Usage of My Neovim on Windows

> This branch is the introduction of my neovim config works on Windows.

**NOTE**: This branch may differ from the master branch.

![](https://raw.githubusercontent.com/Rogerskelamen/nvim/win/images/screenshot.png)

## Installation

1. Of course you have to install `Neovim` on Windows:

  Use Chocolatey:

    ```powershell
    choco install neovim
    ```

2. clone the repo into your `$HOME/AppData/Local/` and change the branch:

  ```shell
  cd $HOME/AppData/Local
  git clone https://github.com/Rogerskelamen/nvim.git
  cd nvim
  git checkout win
  ```

3. get into your neovim and add plugin: `:PlugInstall`(*optional but recommended*)

## Dependencies

- `python3`

- `node`

- `clang`

- `ctags`

## Differences from master(Unix-like)

- gcc can't work

- ranger can't work

- lazygit can't work

> I don't find other things different for now

