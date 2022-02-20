#!/bin/bash

set -e

if [ "${EUID}" -ne 0 ]; then
    echo "-> Run as root!"
    exit 1
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    if [[ ! "$distro" == "arch" ]]; then
        echo " - Starting the installation of packages"
        if $(sudo -E apt-get -qq install wget expect aria2 unzip p7zip-full aria2 simg2img aria2 tree >>./.apt 2>&1); then
            echo "-> Successfully installed."
            rm -rf "$(pwd)/.apt"
        else
            echo "-> Failed, here the log:"
            cat "$(pwd)/.apt"
            rm -rf "$(pwd)/.apt"
        fi
    elif [[ "$distro" == "arch" ]]; then
        echo " - Starting the installation of packages"
        if $(sudo pacman -Sy --noconfirm unace unrar zip unzip p7zip aria2 expect tree >>./.pacman 2>&1); then
            echo "-> Successfully installed."
            rm -rf "$(pwd)/.pacman"
        else
            echo "-> Failed, here the log:"
            cat "$(pwd)/.pacman"
            rm -rf "$(pwd)/.pacman"
        fi
    else
        echo "-> Your $distro distro seems not supported, try making a issue on GitHub."
        exit 1
    fi
fi
