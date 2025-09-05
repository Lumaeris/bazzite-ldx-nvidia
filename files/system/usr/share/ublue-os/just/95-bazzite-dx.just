# vim: set ft=make :

# Install fonts from brew
install-fonts:
    #!/usr/bin/bash
    echo "Installing extra fonts..."
    brew bundle --file=/usr/share/ublue-os/homebrew/bazzite-dx-fonts.Brewfile

# Create docker group and add an user to it
setup-docker:
    #!/usr/bin/bash
    echo "Creating docker group and adding this user to it..."
    sudo groupadd docker
    sudo usermod -aG docker $USER
