header "Install Intune Packages" "This command will install Intune Portal"

confirm_task "Updates and required packages"

start apt update
sudo apt update
finish apt update

start apt-get dist-upgrade
sudo apt-get dist-upgrade
finish apt-get dist-upgrade

start required packages
sudo apt install -y curl gpg wget
finish required packages

confirm_task "Adding the Microsoft package signing key"
start get signing key
curl -sSl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm -f packages.microsoft.gpg
finish get signing key

confirm_task "Adding the Microsoft repositories"
start add repositories
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
finish add repositories

start apt update
sudo apt update
finish apt update

confirm_task "Installing Intune Repositories"

start jammy repos
sudo sh -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ jammy main restricted" > /etc/apt/sources.list.d/intune_temp.jammymain.sources.list'
sudo sh -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ jammy updates restricted" > /etc/apt/sources.list.d/intune_temp.jammyupdates.sources.list'
sudo sh -c 'echo "deb http://security.ubuntu.com/ubuntu jammy-security main restricted" > /etc/apt/sources.list.d/intune_temp.jammysecurity.sources.list'
finish jammy repos

start update and upgrade
sudo apt update
sudo apt upgrade
finish update and upgrade

confirm_task "Installing JDK"
start install openjdk-11-jre
sudo apt install -y openjdk-11-jre
finish install openjdk-11-jre

confirm_task "Installing Intune Portal"
start apt install intune-portal microsoft-edge-stable
sudo apt install -y intune-portal

sudo rm /etc/apt/sources.list.d/intune_temp.*
sudo rm /etc/apt/sources.list.d/microsoft-edge-dev.*

finish apt install intune-portal

start systemctl --user daemon-reload
systemctl --user daemon-reload
finish systemctl --user daemon-reload

start apt update
sudo apt update
finish apt update

confirm_task "Installing VSCode"

start install code
sudo apt install code
finish install code

confirm_task "Installing AzureCLI"
start install azcli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
finish install azcli

footer "Intune Installed" "Reboot before running Intune Portal"
