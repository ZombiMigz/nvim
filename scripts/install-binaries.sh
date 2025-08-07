#!/bin/bash

set -e

# Download static-get
cd /tmp/
curl -L https://github.com/minos-org/minos-static/raw/master/static-get -o static-get
chmod +x static-get

# Create directories for organized extraction
mkdir -p static-downloads/make static-downloads/autoconf static-downloads/git static-downloads/unzip

# Setup Make
./static-get make
tar -xf make-*.tar.xz -C static-downloads/make
sudo cp ./static-downloads/make/bin/make /usr/bin/

# Setup Autoconf
./static-get autoconf
tar -xf autoconf-*.tar.xz -C static-downloads/autoconf
sudo cp ./static-downloads/autoconf/usr/bin/* /usr/bin/

# Setup unzip
./static-get unzip
tar -xf unzip60-*.tar.xz -C ./static-downloads/unzip
sudo cp -r ./static-downloads/unzip/usr/bin /usr/bin/

# Setup Ar
mkdir -p static-downloads/binutils
./static-get binutils
tar -xf binutils-*.tar.xz -C static-downloads/binutils
sudo cp static-downloads/binutils/usr/bin/ar /usr/bin/
sudo cp static-downloads/binutils/usr/bin/nm /usr/bin/ 2>/dev/null || true

# Setup Git & Depdendencies
mkdir -p /tmp/git
cd /tmp/git

curl -L -o libcurl3-gnutls.deb http://deb.debian.org/debian/pool/main/c/curl/libcurl3-gnutls_7.88.1-10+deb12u12_amd64.deb
ar x libcurl3-gnutls.deb
tar -xf data.tar.xz
sudo cp -r usr/lib/x86_64-linux-gnu/* /usr/lib/

curl -L -o librtmp1.deb http://deb.debian.org/debian/pool/main/r/rtmpdump/librtmp1_2.4+20151223.gitfa8646d.1-2+b2_amd64.deb
ar x librtmp1.deb
tar -xf data.tar.xz
sudo cp usr/lib/x86_64-linux-gnu/librtmp.so.* /usr/lib/

curl -L -o libssh2.deb http://deb.debian.org/debian/pool/main/libs/libssh2/libssh2-1_1.10.0-3+b1_amd64.deb
ar x libssh2.deb
tar -xf data.tar.xz
sudo cp usr/lib/x86_64-linux-gnu/libssh2.so.* /usr/lib/

curl -L -o libldap.deb http://deb.debian.org/debian/pool/main/o/openldap/libldap-2.5-0_2.5.13+dfsg-5_amd64.deb
ar x libldap.deb
tar -xf data.tar.xz
sudo cp usr/lib/x86_64-linux-gnu/libldap-2.5.so.* /usr/lib/

curl -L -o liblber.deb http://deb.debian.org/debian/pool/main/o/openldap/libldap-2.5-0_2.5.13+dfsg-5_amd64.deb
ar x liblber.deb
tar -xf data.tar.xz
sudo cp usr/lib/x86_64-linux-gnu/liblber-2.5.so.* /usr/lib/

curl -L -o libsasl2.deb http://deb.debian.org/debian/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.28+dfsg-10_amd64.deb
ar x libsasl2.deb
tar -xf data.tar.xz
sudo cp usr/lib/x86_64-linux-gnu/libsasl2.so.* /usr/lib/

curl -L -o git-debian.deb https://archive.debian.org/debian/pool/main/g/git/git_2.39.2-1~bpo11+1_amd64.deb
ar x git-debian.deb
tar -xf data.tar.xz
sudo cp -r usr/* /usr/
