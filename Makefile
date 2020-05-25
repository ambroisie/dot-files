CLI_PACKAGES := \
	bash \
	flake8 \
	gdb \
	git \
	haskell \
	isort \
	mypy \
	ranger \
	remind \
	scripts \
	shell \
	ssh \
	tin \
	vim \
	zsh \

VISUAL_PACKAGES := \
	X \
	desktop \
	dunst \
	i3 \
	i3blocks \
	redshift \
	rofi \
	termite \
	tridactyl \
	wallpapers \
	zathura \

CLI_DEPENDENCIES := \
	aur/bitwarden-cli \
	aur/cppreference \
	aur/global \
	aur/stdman \
	aur/zsh-fast-syntax-highlighting-git \
	community/bat \
	community/fd \
	community/git-lfs \
	community/lesspipe \
	community/mosh \
	community/mypy \
	community/pandoc \
	community/ripgrep \
	community/shellcheck \
	community/shfmt \
	community/stack \
	community/stow \
	community/tig \
	community/udiskie \
	community/zsh-completions \
	core/archlinux-keyring \
	core/openssh \
	extra/bash-completion \
	extra/ctags \
	extra/git \
	extra/imagemagick \
	extra/keychain \
	extra/networkmanager \
	extra/zsh \

VISUAL_DEPENDENCIES := \
	aur/bitwarden-rofi \
	aur/i3-battery-popup-git \
	aur/i3blocks-contrib-git \
	aur/networkmanager-dmenu-git \
	aur/qsyncthingtray \
	aur/rofi-dmenu \
	aur/spotify \
	community/acpi \
	community/dunst \
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
	extra/thunderbird \
	extra/vlc \

RUST_DEPENDENCIES := \
	clippy \
	rustfmt \

HASKELL_DEPENDENCIES := \
	brittany \
	hlint \

STOW_TARGET := $(HOME)
STOW = stow -t $(STOW_TARGET) -R -v

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
	yay -S $(CLI_DEPENDENCIES)

.PHONY: install-visual-deps
install-visual-deps:
	yay -S $(VISUAL_DEPENDENCIES)

# Linking packages
.PHONY: link-all
link-all: link-cli link-visual

.PHONY: link-cli
link-cli: $(addprefix stow-,$(CLI_PACKAGES))

.PHONY: link-visual
link-visual: $(addprefix stow-,$(VISUAL_PACKAGES))

# Installing configuration packages
stow-%: %
	$(STOW) $<

stow-scripts: STOW_TARGET=~/.scripts
stow-scripts: scripts
	mkdir -p $(STOW_TARGET)
	$(STOW) $<

stow-tin: tin
	rm -rf $(STOW_TARGET)/.tin
	ln -s $(realpath tin/.tin) $(STOW_TARGET)/.tin

stow-vim: vim
	$(STOW) $<
	vim +PlugInstall

# Removing packages
unlink: unlink-cli unlink-visual

unlink-cli: $(addprefix unstow-,$(CLI_PACKAGES))

unlink-visual: $(addprefix unstow-,$(VISUAL_PACKAGES))

unstow-%:
	$(STOW) -D $*

unstow-scripts: STOW_TARGET=~/.scripts
unstow-scripts:
	$(STOW) -D scripts

unstow-tin:
	rm -f $(STOW_TARGET)/.tin

# Development related installations
.PHONY: rust
rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup component add $(RUST_DEPENDENCIES)

.PHONY: haskell
haskell:
	stack build --copy-compiler-tool $(HASKELL_DEPENDENCIES)
