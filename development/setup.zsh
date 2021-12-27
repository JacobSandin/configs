/bin/sudo apt -y update
/bin/sudo apt -y upgrade
#/bin/sudo apt -y install ansible make build-essential libssl-dev pkg-config nodejs mupdf ctags texlive-full

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt update
apt remove yarn
apt install yarn

for i in python3-pip ansible make build-essential libssl-dev pkg-config mupdf ctags nodejs npm; do
  echo "installing $i"
#for i in python3-pip ansible make build-essential libssl-dev pkg-config nodejs mupdf ctags texlive-full; do
  sudo apt-get install $i
done

curl https://sh.rustup.rs -sSf | sh -s -- -y


mkdir -p ~/utv/git
mkdir -p ~/utv/svn
cd ~/utv/git

# Set git to use the credential memory cache
git config --global credential.helper cache
# Set the cache to timeout after 1 hour (setting is in seconds)
git config --global credential.helper 'cache --timeout=3600'


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

~/.cargo/bin/rustup toolchain add nightly
~/.cargo/bin/cargo +nightly install racer
#~/.cargo/bin/cargo install rustfmt
~/.cargo/bin/rustup component add rust-src



curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chown -R jacsan.jacsan ./.local/share/.cpan
nvim +'CocInstall -sync coc-rust-analyzer' +qall
nvim +CocUpdateSync +qall

