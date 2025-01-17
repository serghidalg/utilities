#!/bin/bash

# Ensure the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Define the source and destination paths
SOURCE="./us"
DESTINATION="/usr/share/X11/xkb/symbols/us"

# Check if the source file exists
if [ ! -f "$SOURCE" ]; then
    echo "Error: Source file $SOURCE does not exist."
    exit 1
fi

# Confirm the action with the user
echo "This will overwrite the keyboard mapping at $DESTINATION."
read -p "Do you want to proceed? (yes/no): " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Copy the file to the destination
cp "$SOURCE" "$DESTINATION"
if [ $? -eq 0 ]; then
    echo "Successfully copied $SOURCE to $DESTINATION."
else
    echo "Error occurred while copying the file."
    exit 1
fi

# Prompt the user to reboot
read -p "Do you want to reboot now to apply changes? (yes/no): " REBOOT
if [[ "$REBOOT" == "yes" ]]; then
    echo "Rebooting now..."
    reboot
else
    echo "Please reboot manually to apply the changes."
    exit 0
fi

