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
INSTALL_DEP()
{
    read -pr "Do You Wanna To Install All Deps For Configuration?" DEP_INSTALL
    case $DEP_INSTALL in
          y)
            if command -v pacman; then
            sudo pacman -Sy base-devel \
            dwm slock konsole make cmake git curl
            fi
            if command -v xbps-install; then
                sudo xbps-install -S base-devel libX11-devel libXft-devel \
                libXinerama-devel freetype-devel fontconfig-devel dwm slock konsole make cmake git curl -y
            fi
            if command -v apt; then
                sudo apt install dwm slock konsole make cmake git curl -y 
            fi
            if command -v pkg; then
            doas pkg install slock konsole make cmake git curl
            fi
             ;;
           n)
            echo "ok, i canseld it."
             ;;
           *)
             ;;
esac
}
INSTALL_DWM() {
git clone https://github.com/CrypticSpider/dwm-dots.git ; check_err && cd dwm-dots || exit; 
    mkdir -p ~/.config/dwm/ \
    mkdir -p ~/.config/dwmblocks/ \
    cp -R dwm/* ~/.config/dwm/;check_err \
    cp -R dwmblocks/* ~/.config/demblocks/; check_err \
    cp -R statusbar/ ~/.local/bin/; check_err \
    make -C ~/.config/dwm clean install && make -C ~/.config/dwmblocks clean install; check_err
}
CHANGE_TERMINAL(){
    read -rp "Do You Want To Change The Default Terminal?" TERMINAL_CHANGE
    if [ "$TERMINAL_CHANGE" = 'y' ]; then
        read -rp "enter Your terminal Name Here :" TERMINAL_NAME
        sed -i "s/konsole/$TERMINAL_NAME/g" ~/.config/dwm/config.h
    elif [ "$TERMINAL_CHANGE"  == 'n' ]; then
        echo "canseld."
    fi
}
INSTALL_PICOM() {
    read -pr "Do You Wanna To Copy New Configuration For Picom?" PICOM_INSTALL
  if [ "$PICOM_INSTALL" == 'y' ]; then
  if [ -d ~/.config/picom ]; then
    cp -rv picom/* ~/.config/picom
fi
   elif [ "$PICOM_INSTALL" == 'n' ]; then
    :
fi
}
read -rp "Do You Want To Install The Configuration? y/n :" dwm_config
if [ "$dwm_config" == 'y' ]; then
    INSTALL_DWM
elif
    [ "$dwm_config" == 'n' ]; then
    echo "Canseld"
fi
CHANGE_TERMINAL
if [ "$TERMINAL_CHANGE" == 'n' ]; then
    :
fi
    read -rp "Do You Want To Install Custom Dark Theme For Konsole? y/n :" konsole_theme
    if [ "$konsole_theme" == 'y' ]; then
        cp -v konsole-themes/One\ Dark\ Color.colorscheme ~/.local/share/konsole/
    elif [ "$konsole_theme" == 'n' ]; then
       :
   fi
read -rp "Do You Want To Use .xinirc? y/n :" REPLY
if [ "$REPLY" == 'y' ]; then
     cp .xinirc ~/
elif [ "$REPLY" == n ]; then 
    echo "Canseld" 
    echo "Install Finished"
fi
# set +x
