
filter_ubuntu() {
    . /etc/os-release
    if [[ "$ID" != "ubuntu" ]]; then
        echo "This command only works on Ubuntu"
        echo "You're running ${NAME}/${ID}"
    fi

}

filter_ubuntu2404() {

    . /etc/os-release
    if [[ "$ID" != "ubuntu" ]]; then
        echo "This command only works on Ubuntu"
        echo "You're running ${NAME}/${ID}"
    fi

    if [[ "$VERSION_ID" != "24.04" ]]; then
        echo "This command only works on Ubuntu 24.04"
        echo "You have ${NAME} version ${VERSION_ID}"
    fi
    

}