/bin/sudo apt -y update
/bin/sudo apt -y upgrade
/bin/sudo apt -y install ansible make build-essential libssl-dev pkg-config
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

/home/jacsan/.cargo/bin/rustup toolchain add nightly
/home/jacsan/.cargo/bin/cargo +nightly install racer
/home/jacsan/.cargo/bin/cargo install rustfmt


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
