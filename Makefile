
## Print available build targets
help:
	@cat $(MAKEFILE_LIST) | \
	awk '/^##.*$$/{l1=$$0;getline;l2=(l1 "##" $$0); print l2 $$0}' | awk -F"##" '{split($$3,t,":");printf "\033[36m%-11s\033[0m %s\n",t[1],$$2}'


## Install all required tools
all: zsh nvim
	@echo "All done"

## Install NVM for pyright lsp
nvm:
	@echo "========================="
	@echo "Install NVM(Node Version Manager)..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	reset
	nvm install node
	npm install -g pyright
	@echo "========================="

## Install rust
rust:
	@echo "========================="
	@echo "Install rust..."
	curl https://sh.rustup.rs -sSf | sh
	@echo "========================="

## Install exa (modern replacement for ls)
exa: rust
	@echo "========================="
	@echo "Download and unzip binary..."
	wget -c https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
	unzip exa-linux-x86_64-v0.10.1.zip
	@echo "copy bin, completion, and man"
	sudo cp bin/exa /usr/bin/
	sudo cp man/exa.1 /usr/share/man/man1
	sudo cp man/exa_colors.5 /usr/share/man/man5
	sudo cp completions/exa.zsh /usr/local/share/zsh/site-functions
	@echo "========================="

## Install ZSH shell
zsh:
	@echo "========================="
	@echo "Install zsh..."
	sudo apt install zsh -y
	chsh -s $(which zsh)
	echo "export ZDOTDIR="$HOME/.config/zsh"" | sudo tee -a /etc/zsh/zshenv
	@echo "Stow ZSH"
	stow -D zsh
	stow zsh
	@echo "========================="

build_tools:
	@echo "========================="
	@echo "Install build tools..."
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y build-essential tree ascii stow powerline fonts-powerline x11-apps unzip
	sudo apt install -y gcc-multilib g++-multilib cmake clang
	sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
	sudo apt install exa
	sudo apt install -y python3-tk
	sudo apt install -y npm
	sudo npm install -g n
	sudo n 12.0.0
	sudo npm install -g pyright
	@echo "========================="

## Install neovim 
nvim: build_tools
	@echo "========================="
	@echo "Install neovim..."
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv nvim.appimage /usr/bin/nvim
	@echo "========================="

.PHONY: all zsh nvim help rust exa
