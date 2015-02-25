# -*- mode: shell-script -*-

if [[ "$1" == "source" ]]; then
    # Initial source
    source $TOP_DIR/lib/akanda
    source $TOP_DIR/patches/utils

    # The akanda-devstack/patches folder needs to be already linked to devstack/patches so that we can refer to
    # it here using the TOP_DIR variable.
    PATCHES_FOLDER=$TOP_DIR/patches

elif [[ "$1" == "stack" && "$2" == "install" ]]; then
    echo_summary "Installing Akanda"
    set_neutron_user_permission
    install_akanda

elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    echo_summary "Patching Neutron"
    old_cwd=$PWD
    cd $DEST/neutron
    patch_neutron
    echo_summary "Installing Akanda"
    configure_akanda
    configure_akanda_nova
    configure_akanda_neutron
    cd $old_cwd

elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
    echo_summary "Initializing Akanda"
    pre_start_akanda
    start_akanda_rug
    post_start_akanda
fi

if [[ "$1" == "unstack" ]]; then
    stop_akanda_rug
fi

if [[ "$1" == "clean" ]]; then
    # no-op
    :
fi
