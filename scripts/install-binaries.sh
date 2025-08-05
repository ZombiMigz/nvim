#!/bin/bash

# Download static-get
cd /tmp/
curl -L https://github.com/minos-org/minos-static/raw/master/static-get -o static-get
chmod +x static-get

# Create directories for organized extraction
mkdir -p static-downloads/make static-downloads/autoconf static-downloads/git

# Setup Make
./static-get make
tar -xf make-*.tar.xz -C static-downloads/make
sudo cp ./static-downloads/make/bin/make /usr/bin/

# Setup Autoconf
./static-get autoconf
tar -xf autoconf-*.tar.xz -C static-downloads/autoconf
sudo cp ./static-downloads/autoconf/usr/bin/* /usr/bin/

# Setup Git
./static-get git
tar -xf git-*.tar.xz -C ./static-downloads/git
sudo cp ./static-downloads/git/bin/git /usr/bin/
