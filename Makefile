CLI_PACKAGES := \
	bash \
	flake8 \
	gdb \
	git \
	haskell \
	isort \
	mypy \
	remind \
	scripts \
	shell \
	ssh \
	tin \
	tmux \
	vifm \
	vim \
	zsh \

VISUAL_PACKAGES := \
	X \
	desktop \
	dunst \
	fontconfig \
	i3 \
	i3blocks \
	redshift \
	rofi \
	system-X \
	termite \
	tridactyl \
	wallpapers \
	zathura \

CLI_DEPENDENCIES := \
	aur/bitwarden-cli \
	aur/cppreference \
	aur/git-absorb \
	aur/handlr-bin \
	aur/stdman \
	aur/xdg-utils-handlr \
	aur/zsh-fast-syntax-highlighting-git \
	community/bat \
	community/fd \
	community/fzf \
	community/git-lfs \
	community/global \
	community/lesspipe \
	community/mosh \
	community/mypy \
	community/pandoc \
	community/ripgrep \
	community/rustup \
	community/shellcheck \
	community/shfmt \
	community/stack \
	community/stow \
	community/tig \
	community/tmux \
	community/udiskie \
	community/vifm \
	community/zsh-completions \
	core/archlinux-keyring \
	core/openssh \
	extra/bash-completion \
	extra/ctags \
	extra/git \
	extra/imagemagick \
	extra/keychain \
	extra/networkmanager \
	extra/vim \
	extra/vim-runtime \
	extra/zsh \

VISUAL_DEPENDENCIES := \
	aur/bitwarden-rofi \
	aur/gnome-ssh-askpass3 \
	aur/i3-battery-popup-git \
	aur/i3blocks-contrib-git \
	aur/networkmanager-dmenu-git \
	aur/qsyncthingtray \
	aur/rofi-dmenu \
	aur/rofi-emoji \
	aur/spotify \
	community/acpi \
	community/dunst \
	community/flameshot \
	community/i3lock-color \
	community/playerctl \
	community/redshift \
	community/syncthing \
	community/sysstat \
	community/termite \
	community/xautolock \
	community/xsel \
	community/zathura \
	community/zathura-cb \
	community/zathura-djvu \
	community/zathura-pdf-poppler \
	community/zathura-ps \
	extra/firefox \
	extra/nm-connection-editor \
	extra/noto-fonts-emoji \
	extra/thunderbird \
	extra/vlc \

HASKELL_DEPENDENCIES := \
	brittany \
	hlint \

STOW_TARGET := $(HOME)
STOW = stow -t $(STOW_TARGET) -R -v

YAY := yay -S --noconfirm

.PHONY: all
all: install

# Install packages and their dependencies
.PHONY: install-cli
install-cli: install-cli-deps
install-cli: link-cli
install-cli: rust haskell

.PHONY: install
install: install-cli
install: install-visual-deps
install: link-visual

.PHONY: install-cli-deps
install-cli-deps:
	$(YAY) $(CLI_DEPENDENCIES)

.PHONY: install-visual-deps
install-visual-deps:
	$(YAY) $(VISUAL_DEPENDENCIES)

# Linking packages
.PHONY: link-all
link-all: link-cli link-visual

.PHONY: link-cli
link-cli: $(addprefix stow-,$(CLI_PACKAGES))

.PHONY: link-visual
link-visual: $(addprefix stow-,$(VISUAL_PACKAGES))

# Installing configuration packages
.PHONY: $(addprefix stow-,$(CLI_PACKAGES))
.PHONY: $(addprefix stow-,$(VISUAL_PACKAGES))
stow-%: %
	$(STOW) $<

stow-scripts: STOW_TARGET=~/.scripts
stow-scripts: scripts
	mkdir -p $(STOW_TARGET)
	$(STOW) $<

stow-system-X: STOW_TARGET=/
stow-system-X: system-X
	sudo $(STOW) $<

stow-tin: tin
	rm -rf $(STOW_TARGET)/.tin
	ln -s $(realpath tin/.tin) $(STOW_TARGET)/.tin

stow-tmux: tmux
	$(STOW) $<
	[ -d ~/.config/tmux/plugins/tpm ] || \
	    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm;
	    ~/.config/tmux/plugins/tpm/bin/install_plugins

stow-vim: vim
	$(STOW) $<
	vim +PlugInstall +qa

# Removing packages
.PHONY: unlink-all
unlink-all: unlink-cli unlink-visual

.PHONY: unlink-cli
unlink-cli: $(addprefix unstow-,$(CLI_PACKAGES))

.PHONY: unlink-visual
unlink-visual: $(addprefix unstow-,$(VISUAL_PACKAGES))

.PHONY: $(addprefix unstow-,$(CLI_PACKAGES))
.PHONY: $(addprefix unstow-,$(VISUAL_PACKAGES))
unstow-%:
	$(STOW) -D $*

unstow-scripts: STOW_TARGET=~/.scripts
unstow-scripts:
	$(STOW) -D scripts

unstow-system-X: STOW_TARGET=/
unstow-system-X:
	sudo $(STOW) -D system-X

unstow-tin:
	rm -f $(STOW_TARGET)/.tin

unstow-tmux:
	$(STOW) -D tmux
	rm -rf ~/.config/tmux/plugins/

# The `rustup` package does not install a toolchain by default
.PHONY: rust
rust:
	rustup default stable

.PHONY: haskell
haskell:
	if [ -n "$(HASKELL_DEPENDENCIES)" ]; then \
	    stack build --copy-compiler-tool $(HASKELL_DEPENDENCIES); \
	fi
