# Install standard dev tools
apt-get update
apt-get install -y software-properties-common
apt-get update
apt-get install -y gcc g++ libc-dev wget pkg-config less git git-lfs libfuse-dev fuse zip

# The doit command line build tool
apt-get install -y python3-doit python3-pip
pip3 install pystache

# And other command line tools
apt-get install meld tmux jq awscli arcanist htop postgresql-client

# Install dependencies for kak
apt-get install libncursesw5-dev

# Install yarn, node, etc
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn

# Install rustup and stable toolchain
curl -sf -L https://static.rust-lang.org/rustup.sh | sh
rustup install stable
rustup default stable-x86_64-unknown-linux-gnu


# Install dart, sass for plp builds
wget https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.3/sdk/dartsdk-linux-x64-release.zip -O /tmp/dartsdk-linux-x64-release.zip
mkdir -p /opt
unzip /tmp/dartsdk-linux-x64-release.zip -d /opt
chmod -R a+rX /opt/dart-sdk/
apt-get install ruby-full build-essential rubygems
gem install sass

# Install haskell tooling
curl -sSL https://get.haskellstack.org/ | sh

# Install dev libs for haskell chart builds
apt-get install libglib2.0-dev libcairo2-dev libpango1.0-dev libgtk-3-dev libgtk2.0-dev

# Install dev libs for hx-deploy-tool
apt-get install libbz2-dev

# Install helix java tooling
wget https://github.com/bazelbuild/bazel/releases/download/0.11.1/bazel-0.11.1-installer-linux-x86_64.sh -O /tmp/bazel-installer.sh
chmod +x /tmp/bazel-installer.sh
/tmp/bazel-installer.sh --prefix=/opt/bazel/0.11
wget https://github.com/bazelbuild/bazel/releases/download/0.28.1/bazel-0.28.1-installer-linux-x86_64.sh -O /tmp/bazel-installer.sh
chmod +x /tmp/bazel-installer.sh
/tmp/bazel-installer.sh --prefix=/opt/bazel/0.28

# Install typescript language servers
npm install -g typescript
npm install -g typescript-language-server
