#!/bin/bash

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
mise use -g node@latest
mise settings set python.compile false
mise use -g python@latest
mise use -g poetry@latest
mise use -g terraform@latest
mise use -g neovim@latest
mise use -g lazygit@latest
mise use -g ripgrep@latest
mise use -g fd@latest
