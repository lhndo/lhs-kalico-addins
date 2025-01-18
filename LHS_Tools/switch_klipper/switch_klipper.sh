#!/bin/bash

# Function to switch folders
switch_folders() {
    if [ -d "$1" ] && ! [ -d "$2" ]; then
        mv "$1" "$2"
    else
        echo "Error: Directory $1 or $2 are not set up correctly."
        exit 1
    fi
}

# Function to switch configuration files
switch_configs() {
    if [ -f "$1" ] && ! [ -f "$2" ]; then
        mv "$1" "$2"
    else
        echo "Error: File $1 or $2 are set up correctly."
        exit 1
    fi
}

# Get the non-root user's home directory
USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)

# Check input parameter

    systemctl stop klipper
    if [ "$1" == "klipper" ]; then
        # Switch klipper_ml to klipper and klipper to klipper_kalico
        switch_folders "$USER_HOME/klipper" "$USER_HOME/klipper_kalico"
        switch_folders "$USER_HOME/klipper_ml" "$USER_HOME/klipper"

        # Switch printer.cfg.ml to printer.cfg and printer.cfg to printer.cfg.kalico
        switch_configs "$USER_HOME/printer_data/config/printer.cfg" "$USER_HOME/printer_data/config/printer.cfg.kalico"
        switch_configs "$USER_HOME/printer_data/config/printer.cfg.ml" "$USER_HOME/printer_data/config/printer.cfg"
    elif [ "$1" == "kalico" ]; then
        # Switch klipper_kalico to klipper and klipper to klipper_ml
        switch_folders "$USER_HOME/klipper" "$USER_HOME/klipper_ml"
        switch_folders "$USER_HOME/klipper_kalico" "$USER_HOME/klipper"

        # Switch printer.cfg.kalico to printer.cfg and printer.cfg to printer.cfg.ml
        switch_configs "$USER_HOME/printer_data/config/printer.cfg" "$USER_HOME/printer_data/config/printer.cfg.ml"
        switch_configs "$USER_HOME/printer_data/config/printer.cfg.kalico" "$USER_HOME/printer_data/config/printer.cfg"
    else
        echo "Error: Invalid parameter value. Use klipper or kalico."
        exit 1
    fi


sudo systemctl restart klipper
echo "Folders and configuration files switched successfully."

