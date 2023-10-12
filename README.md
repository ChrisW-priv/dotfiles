# Dotfile repo
This repo is designed to be main source of reproducing my main daily use machine

## Setup
I assume I have arch on a pendrive and have working terminal.

First: Connect to the internet.
```bash
iwctl

station wlan0 connect SSID
```

Second: Disc partition
```bash
cfdisk 
lsblk
mkfs.ext4 /dev/root_partition
mkfs.fat -F 32 /dev/efi_system_partition
mkswap /dev/swap_partition
mount /dev/root_partition /mnt
mkdir /mnt/boot/efi
mount /dev/efi_system_partition /mnt/boot/efi
swapon /dev/swap_partition
```

Download basic packages
```bash
pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr networkmanager vim
```

Save the file system
```bash
genfstab /mnt > /mnt/etc/fstab
```

Configure grub
```bash
grub-install /dev/disk
grub-mkconfig -o /boot/grub/grub.cfg
```

Change to arch root
```bash
arch-chroot /mnt
```

Set timezone
```bash
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc
```

Set Localization
```bash
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
# set hostname
echo "new_machine" > /etc/hostname
```

Setup nework manager
```bash
systemctl enable NetworkManager
```

Add new user
```bash
Add chris user and add to wheel group
useradd -m -G wheel -s /bin/bash chris
passwd chris
visudo

su chris
```

Download more packages
```bash
# Allow user to switch default pacman download to pararell
sudo vim /etc/pacman.conf

sudo pacman -S sddm i3 alacritty git

# clone this repo
https://github.com/ChrisW-priv/dotfiles.git
source ./dotfiles/setup
```

Reboot
```bash
exit
exit
umount -a
reboot
```

After setup script we need to setup stuff in graphical env
```bash
# Config github cli
gh auth login
gh auth setup-git

# Config nitrogen
nitrogen
```
