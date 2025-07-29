#!/bin/bash

# Dependencies
sudo apt-get update
sudo apt install unzip

# Install mise
curl https://mise.run | sh

# Add mise to bashrc and source it
if ! grep -q 'eval "$(.*mise activate bash)"' ~/.bashrc; then
  echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc
fi
eval "$(~/.local/bin/mise activate bash)"

# Install and set each tool
mise use -g zig@latest
# Set up Zig as the C compiler for make compilation
export CC="zig cc"
export CXX="zig c++"
# Import GPG keys for make verification
gpg --keyserver keyserver.ubuntu.com --recv-keys 96B047156338B6D4 80CB727A20C79BB2
mise use -g make@latest
mise use -g node@latest
mise use -g python@latest
mise use -g poetry@latest
mise use -g terraform@latest

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
mkdir -p ~/.config/lazygit/
touch ~/.config/lazygit/config.yml
