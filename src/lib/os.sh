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

# returns true if $1 exists as a declared function
fn_exists() { declare -F "$1" >/dev/null; }

distro_version() {
    echo "${ID}_${VERSION_ID}_$1"
}

distro() {
    echo "${ID}_$1"
}

general() {
    echo "$1_$2"
}

install_function() {

    dv=$(distro_version $1)

    fn_exists $dv && echo $dv && return

    dis=$(distro $1)
    fn_exists $dis && echo $dis && return

    for i in $(echo $ID_LIKE | xargs); do
        generalname=$(general $i $1)
        fn_exists $generalname && echo $generalname && return
    done

    return 0

}

install() {
    myscript=$(install_function $1)

    if [[ ! -z $myscript ]]; then
        eval $myscript
    else
        echo "No installation script found for script $(green $1) on ${ID}/${VERSION_ID}, ${ID}, or other candidates (${ID_LIKE})"
    fi

}
