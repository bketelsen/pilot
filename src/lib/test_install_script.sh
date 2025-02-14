test_ubuntu() {
        echo "Ubuntu Test"
}

test_ubuntu24.04() {
        echo "Ubuntu 24.04 Test"
}

# "full" for only centos 10
centos_10_full() {
        header "Full: Centos 10" "This is the 'full' install script for centos 10"
}

# "full" for any centos
centos_full() {
        header "Full: Centos" "This is the 'full' install script for centos"
}
# "full" for any
fedora_full() {
        header "Full: Fedora" "This is the 'full' install script for fedora"
}
# "full" for any rhel
rhel_full() {
        header "Full: rhel" "This is the 'full' install script for rhel"
}

# "distro" for any centos
centos_distro() {
        header "Distro: centos" "This is the 'distro' install script for centos"
}

# "generic" for fedora
fedora_generic() {
        header "Generic: fedora" "This is the 'generic' install script for fedora"
}

# "generic" for fedora
rhel_generic() {
        header "Generic: rhel" "This is the 'generic' install script for rhel"
}
