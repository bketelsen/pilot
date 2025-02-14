header "Install Incus" "This command will install Incus and configure your user permissions"

confirm_task "Updating the system"
start "apt update"
sudo apt update
finish "apt update"

sudo mkdir -p /etc/apt/keyrings/

sudo curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc

sudo sh -c 'cat <<EOF > /etc/apt/sources.list.d/zabbly-incus-stable.sources
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/stable
Suites: $(. /etc/os-release && echo ${VERSION_CODENAME})
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc

EOF'

sudo apt-get update

sudo apt-get install -y incus
sudo usermod -aG incus-admin $USER

footer "Incus Installed" "Run 'incus admin init' to initialize your incus server."
