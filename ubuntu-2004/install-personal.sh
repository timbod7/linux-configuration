repos_3rd_party=$HOME/personal/repos-3rd-party
mkdir -p $repos_3rd_party

# Setup sdkman and java tools
curl -s "https://get.sdkman.io" | bash
source "/home/timd/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.252.hs-adpt
sdk install gradle 5.6.2
sdk install kotlin 1.3.50

# Install rustup and stable toolchain
curl -sf -L https://static.rust-lang.org/rustup.sh | sh
source $HOME/.cargo/env
rustup install stable
rustup default stable-x86_64-unknown-linux-gnu
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 

# Setup kakoune
(cd $repos_3rd_party; git clone git@github.com:mawww/kakoune.git)
(cd $repos_3rd_party/kakoune; git checkout v2019.07.01; cd src; make) 
ln -s $repos_3rd_party/kakoune/src/kak $HOME/bin/kak
(cd $repos_3rd_party; git clone git@github.com:ul/kak-lsp.git)
(cd $repos_3rd_party/kak-lsp; git checkout v7.0.0; cargo build --release) 
ln -s $HOME/.cargo/bin/kak-lsp $HOME/bin/kak-lsp

# Setup rust lsp
rustup component add rls-preview rust-analysis rust-src

# Install android sdk 29
wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -O /tmp/android-tools-installer.zip
mkdir -p $HOME/android/29/cmdline-tools
export ANDROID_HOME=$HOME/android/29
unzip /tmp/android-tools-installer.zip -d $ANDROID_HOME/cmdline-tools
$ANDROID_HOME/cmdline-tools/tools/bin/sdkmanager "build-tools;29.0.3"
$ANDROID_HOME/cmdline-tools/tools/bin/sdkmanager "platforms;android-29"

# Install deno
curl -fsSL https://deno.land/x/install/install.sh | sh

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Rust CLI utils
cargo install cargo-edit
cargo install cargo-generate

