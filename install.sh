sudo usermod -aG wheel arvigeus
echo "%wheel ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/wheel
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/99_wheel_nopasswd
sudo chmod 440 /etc/sudoers.d/wheel
sudo chmod 440 /etc/sudoers.d/99_wheel_nopasswd

# Chaotic AUR
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n" | sudo tee -a /etc/pacman.conf
sudo pacman -Sy

sudo pacman -S --needed --noconfirm chaotic-aur/paru
sudo pacman -S --needed --noconfirm chaotic-aur/cosmic-session-git

sudo systemctl enable --now cosmic-greeter.service
