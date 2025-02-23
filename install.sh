#!/bin/bash
# Install My Dwm dot
# Author: CrypticSpider
check_err() {
    if [[ $? -ne 0  ]]; then
        echo "Failed"
    else
        echo "Succes"
    fi
}
git clone https://github.com/CrypticSpider/dwm-dots.git ; check_err && cd dwm-dots \  
    mkdir -p ~/.config/dwm/ \ 
    mkdir -p ~/.config/dwmblocks/ \ 
    cp -R dwm/* ~/.config/dwm/;check_err \
    cp -R dwmblocks/* ~/.config/demblocks/; check_err \
    cp -R statusbar/ ~/.local/bin/; check_err \
make -C ~/.config/dwm clean install && make -C ~/.config/dwmblocks clean install; check_err
read -p "Do you want to use .xinirc? y/n :" REPLY
if [ $REPLY == 'y' ]; then
    cp .xinirc ~/
else
    echo "Install Finished"
fi
