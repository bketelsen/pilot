# install azcli on any debian family distro
debian_gum() {
    header "Installing gum" "Installing required helper 'gum'"

    confirm_task "Installing gum"

    start install gum
    #  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install -y gum
    finish install gum

    footer "Gum Installed"

}
