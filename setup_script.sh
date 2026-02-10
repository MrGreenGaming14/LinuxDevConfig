#!/bin/bash

# Install tailscale and start it
curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale up

# Install Discord through flatpak
flatpak install flathub com.discordapp.Discord 

# Install deskflow to move mouse/keyboard between devices
sudo apt install deskflow

# Install flameshot to have a better screenshot application
sudo apt install flameshot

# Install mosh for a better ssh expereince
sudo apt-get install mosh

# Need to do Docker. Requires extensive testing before being put to use

##
##
##
##

# Now you manually go through and do this part
# 1. Set up your tailscale account with the new device
# 2. Go to keyboard shortcuts and set screenshot to map to `/usr/bin/flameshot gui`
# 3. Make sure your .bashrc is set up correctly and you /.config/ssh
