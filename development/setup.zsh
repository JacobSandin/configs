/bin/sudo apt install ansible make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wget --no-cache https://raw.githubusercontent.com/JacobSandin/configs/master/development/zshrc -O ~/.zshrc

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
svn co https://svn.imcode.com/imcode/internal/Ansible Ansible


