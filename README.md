# Install These Dependencies
- Tailscale
- Flatpak
- Deskflow
- flameshot
    - Change PrtScn screenshot function to flameshot screenshot function
- Mosh (SSH Alternative)
- Docker
- Localsend
- TLP (Battery optimization)
- p7zip-full
    - Unzipping files

# Correct Versions
- git >= 2.19.0

# Commands

## Turn on zswap to enable compressed memory (cmds from https://easylinuxtipsproject.blogspot.com/p/first-mint-cinnamon.html) 
- Run `xed admin:///etc/default/grub`
- Find `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` in the opened text file
- Replace that with 
    - <= 8 Gigs of RAM `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash zswap.enabled=1 zswap.max_pool_percent=40 zswap.zpool=zsmalloc zswap.compressor=lz4"`
    - > 8 Gigs of RAM `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash zswap.enabled=1 zswap.zpool=zsmalloc zswap.compressor=lz4"`
- Run `sudo update-grub`
- Run `xed admin:///etc/initramfs-tools/modules`
- At the very bottom of the opened text file, write this: `zsmalloc`
- Run `sudo update-initramfs -uk all`
- Run `Reboot`
- Check to see if it's enabled using `sudo dmesg | grep zswap`
    - Output should be `zswap: loaded using pool lz4/zsmalloc`

## Enable Linux Mint's Firewall
- Run `sudo ufw enable`

## Make wifi faster (eats up a bit of power)
- Run `iwconfig`
- Run `sudo sed -i 's/3/2/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf`

## Remove speech help
- Run `sudo apt-get remove orca speech-dispatcher`

## Install simple games
- Run `sudo apt-get install aisleriot gnome-cards-data gnome-mines quadrapassel gnome-sudoku`
