# Install standard dev tools
apt-get update
apt-get install -y software-properties-common
apt-get update
apt-get install -y gcc g++ libc-dev wget pkg-config less git libfuse-dev fuse zip

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
