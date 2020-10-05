/bin/sudo apt -y update
/bin/sudo apt -y upgrade
/bin/sudo apt -y install ansible make build-essential libssl-dev pkg-config
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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

