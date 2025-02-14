debian_azcli() {
    header "Install Azure CLI" "This command will install the Azure CLI (az)."

    confirm_task "Installing AzureCLI"

    start install azcli
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    finish install azcli

    footer "Azure CLI Installed"

}
