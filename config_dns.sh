#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

echo "Starting Arch Linux network optimization..."

# Install required packages
echo "Installing required packages..."
pacman -Sy --noconfirm reflector systemd-resolvconf

# Configure systemd-resolved
echo "Configuring systemd-resolved..."
systemctl enable systemd-resolved
systemctl start systemd-resolved
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Create network performance settings
echo "Configuring network performance settings..."
cat > /etc/sysctl.d/99-network-performance.conf << EOL
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.ipv4.tcp_fastopen = 3
EOL

# Apply sysctl settings
echo "Applying network settings..."
sysctl -p /etc/sysctl.d/99-network-performance.conf

# Update mirror list for Japan
echo "Updating mirror list for Japanese servers..."
reflector --country Japan,KR,TW --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Refresh package database
echo "Refreshing package database..."
pacman -Syy

# Optional: Install profile-sync-daemon for browser optimization
echo "Would you like to install profile-sync-daemon for browser optimization? (y/n)"
read -r answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    pacman -S --noconfirm profile-sync-daemon
    echo "Please run 'psd' command as your regular user to configure profile-sync-daemon"
fi

# Test DNS resolution
echo "Testing DNS resolution..."
ping -c 3 google.com

echo "Network optimization complete!"
echo "Please check the ping results above to verify improvement."
echo "You may need to restart your system for all changes to take effect."
