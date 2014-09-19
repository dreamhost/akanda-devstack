# -*- mode: shell-script -*-

if [[ "$1" == "source" ]]; then
    # Initial source
    source $TOP_DIR/lib/akanda

elif [[ "$1" == "stack" && "$2" == "install" ]]; then
    echo_summary "Installing Akanda"
    install_akanda

elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    echo_summary "Installing Akanda"
    configure_akanda
    configure_akanda_nova
    configure_akanda_neutron

elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
    echo_summary "Initializing Akanda"
    pre_start_akanda
    start_akanda_rug
    post_start_akanda
fi

if [[ "$1" == "unstack" ]]; then
    # no-op
    :
fi

if [[ "$1" == "clean" ]]; then
    # no-op
    :
fi

