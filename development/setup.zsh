/bin/sudo apt -y update
/bin/sudo apt -y upgrade
/bin/sudo apt -y install ansible make build-essential libssl-dev pkg-config nodejs

curl https://sh.rustup.rs -sSf | sh -s -- -y


mkdir -p ~/utv/git
mkdir -p ~/utv/svn
cd ~/utv/git

git clone https://github.com/JacobSandin/configs.git
git clone https://github.com/JacobSandin/sip_tester.git
git clone https://github.com/JacobSandin/koha_password_generator.git
git clone https://github.com/JacobSandin/sni-proxy.git
git clone https://github.com/JacobSandin/koha_csv_importer.git
git clone https://github.com/JacobSandin/marc_21.git


cd ~/utv/svn
# Login needed
#svn co https://svn.imcode.com/imcode/internal/Ansible Ansible


wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/development/dev.vim -O ~/.config/nvim/dev.vim 
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/development/dev-plugin.vim -O ~/.config/nvim/dev-plugin.vim 

nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall

mkdir -p ~/.local/bin
#curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
#chmod +x ~/.local/bin/rust-analyzer

/home/jacsan/.cargo/bin/rustup toolchain add nightly
/home/jacsan/.cargo/bin/cargo +nightly install racer
/home/jacsan/.cargo/bin/cargo install rustfmt
/home/jacsan/.cargo/bin/rustup component add rust-src                                                                                                              │Oct 06, 2020 9:45:42 PM org.apache.coyote.AbstractProtocol start
/home/jacsan/.cargo/bin/cargo xtask install --server                                                                                                               │INFO: Starting ProtocolHandler ["ajp-bio-192.168.96.71-9276"]

nvim +'CocInstall -sync coc-rust-analyzer' +qall
nvim +CocUpdateSync +qall

