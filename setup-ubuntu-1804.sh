# Install standard dev tools
apt-get update
apt-get install -y software-properties-common
apt-get update
apt-get install -y gcc g++ libc-dev wget pkg-config less git git-lfs libfuse-dev fuse zip

# The doit command line build tool
apt-get install -y python3-doit python3-pip
pip3 install pystache

# And other command line tools
apt-get install meld tmux jq awscli arcanist htop

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


# Install haskell tooling
curl -sSL https://get.haskellstack.org/ | sh

# Install dev libs for haskell chart builds
apt-get install libglib2.0-dev libcairo2-dev libpango1.0-dev libgtk-3-dev libgtk2.0-dev

# Install dev libs for hx-deploy-tool
apt-get install libbz2-dev

# Install helix java tooling
wget https://github.com/bazelbuild/bazel/releases/download/0.11.1/bazel-0.11.1-installer-linux-x86_64.sh -O /tmp/bazel-installer.sh
chmod +x /tmp/bazel-installer.sh
/tmp/bazel-installer.sh
