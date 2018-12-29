# My Setup

Quickly set up my favorite working environment wherever I go.

---

## MacOS

* Terminal Replacement: [iTerm2](https://www.iterm2.com/)(Themes are in `iTerm2_colors`)

* Package manager: Homebrew

  ```shell
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

* Shell: zsh

  * Font: [Source Code Pro Nerd Font Complete]() 
  * Package manager: [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

  ```shell
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

  * Theme: powerlevel9k

* ```bash
  $ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  ```
  * Plug-ins:

    * git
       colorize
       Z
       zsh-syntax-highlighting
       zsh-autosuggestions

      colored-man-pages

       bat (`brew install bat`)

Configurations are stored in my `dot.zshrc` file.

![zsh1](https://github.com/Deerhound579/my-setup/blob/master/zsh1.png)

![zsh2](https://github.com/Deerhound579/my-setup/blob/master/zsh2.png)

* Markdown editor: [Typora](https://typora.io/)

- Text editor: Visual Studio Code

TODO:

- [ ] Windows
- [ ] Python
- [ ] VSCode settings
