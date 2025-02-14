# install azcli on any debian family distro
ubuntu_docker() {
    header "Install Docker" "This command will install docker and configure your user permissions"

    confirm_task "Updating the system"
    start "apt update"
    sudo apt update
    finish "apt update"

    start "remove outdated packages"
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    finish "remove outdated packages"

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt-get update

    start "install docker"
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    finish "install docker"

    start "add user to docker group"
    sudo usermod -aG docker $USER
    finish "add user to docker group"

    footer "Docker Installed" "Log out or reboot to see docker group membership or type 'newgrp docker' in the current shell."

}
