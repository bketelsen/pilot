# pull in os/distro variables
. /etc/os-release

if ! command -v gum 2>&1 >/dev/null; then
    header "Required Libraries Missing" "Installing Required Library"
    install gum
fi
