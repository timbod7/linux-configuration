repos_3rd_party=$HOME/personal/repos-3rd-party
mkdir -p $repos_3rd_party

# Setup kakoune
(cd $repos_3rd_party; git clone git@github.com:mawww/kakoune.git)
(cd $repos_3rd_party/kakoune; git checkout v2019.01.20; cd src; make) 
ln -s $repos_3rd_party/kakoune/src/kak $HOME/bin/kak
(cd $repos_3rd_party; git clone git@github.com:ul/kak-lsp.git)
(cd $repos_3rd_party/kak-lsp; git checkout v6.1.0; cargo build --release) 
ln -s $HOME/.cargo/bin/kak-lsp $HOME/bin/kak-lsp

# Setup rust lsp
rustup component add rls-preview rust-analysis rust-src

# Rust CLI utils
cargo install cargo-edit
cargo install cargo-generate

