#!/bin/bash
# Install My Dwm dot
# Author: CrypticSpider
# set -x
check_err() {
    if [[ $? -ne 0  ]]; then
        echo "Failed"
    else
        echo "Succes"
    fi
}
install-dwm() {
git clone https://github.com/CrypticSpider/dwm-dots.git ; check_err && cd dwm-dots || exit; 
    mkdir -p ~/.config/dwm/ \
    mkdir -p ~/.config/dwmblocks/ \
    cp -R dwm/* ~/.config/dwm/;check_err \
    cp -R dwmblocks/* ~/.config/demblocks/; check_err \
    cp -R statusbar/ ~/.local/bin/; check_err \
make -C ~/.config/dwm clean install && make -C ~/.config/dwmblocks clean install; check_err
}
read -rp "Do You Want To Install The configuration? y/n :" dwm_config
if [ "$dwm_config" == 'y' ]; then
    install-dwm
elif
    [ "$dwm_config" == 'n' ]; then
    echo "Canseld"
fi
    read -rp "Do You Want To Install Custom Dark Theme For Konsole? y/n :" konsole_theme
    if [ "$konsole_theme" == 'y' ]; then
        cp -v konsole-themes/One\ Dark\ Color.colorscheme ~/.local/share/konsole/
    elif [ "$konsole_theme" == 'n' ]; then
       :
   fi
read -rp "Do you want to use .xinirc? y/n :" REPLY
if [ "$REPLY" == 'y' ]; then
    cp .xinirc ~/
else
    echo "Install Finished"
fi
# sex +x
