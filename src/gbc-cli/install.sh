set -e
echo "Activating feature 'gbc-cli'"

# https://github.com/microsoft/bond/issues/940
DEBIAN_FRONTEND=noninteractive

apt-get update \
    && apt-get install -y \
        curl \
        git \
        clang \
        cmake \
        zlib1g-dev \
        libboost-dev \
        libboost-thread-dev

# Use clang instead of gcc
#update-alternatives --set cc /usr/bin/clang

# Install the Haskell Tool Stack
curl -sSL https://get.haskellstack.org/ | sh

#build in temp 
#cd /tmp

git clone --recursive https://github.com/microsoft/bond.git
cd bond
mkdir build
cd build
cmake ..
make
sudo make install

cd ../../