#!/bin/bash - 
# Install My Dwm Configurations And Dependencis.
# Author: CrypticSpider.
# set -x
CHECK_ERR()
{
if [[ $? -ne 0  ]]; then
      echo "Failed"
   else
      echo "Succes"
fi
}

INSTALL_DEP()
{
  echo "WARNING!"
  echo "SCRIPT WILL ASK FOR USER PASSWORD FOR ROOT PERMISSION!"
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
            echo "Ok, I Canseld It."
             ;;
           *)
             ;;
esac
}

INSTALL_DWM()
{
git clone https://github.com/CrypticSpider/dwm-dots.git ; CHECK_ERR && cd dwm-dots || exit; 
    mkdir -p ~/.config/dwm/ \
    mkdir -p ~/.config/dwmblocks/ \
    cp -R dwm/* ~/.config/dwm/;CHECK_ERR \
    cp -R dwmblocks/* ~/.config/demblocks/; CHECK_ERR \
    cp -R statusbar/ ~/.local/bin/; CHECK_ERR \
    make -C ~/.config/dwm clean install && make -C ~/.config/dwmblocks clean install; CHECK_ERR
}

CHANGE_TERMINAL()
{
    read -rp "Do You Want To Change The Default Terminal?" TERMINAL_CHANGE
     if [ "$TERMINAL_CHANGE" = 'y' ]; then
       read -rp "enter Your terminal Name Here :" TERMINAL_NAME
         if ! command -v "$TERMINAL_NAME" &>/dev/null; then
           echo "You Terminal Does Not Exist!" 
             exit 127
               fi
                 if command -v "$TERMINAL_NAME" &>/dev/null; then
                   sed -i "s/konsole/$TERMINAL_NAME/g" ~/.config/dwm/config.h
                     fi
                      elif [ "$TERMINAL_CHANGE"  == 'n' ]; then
                        echo "Canseld."
                          fi
}

INSTALL_PICOM()
{
                              read -rp "Do You Wanna To Copy New Configuration For Picom?" PICOM_INSTALL
                                if [ "$PICOM_INSTALL" == 'y' ]; then
                                  if [ -d ~/.config/picom ]; then
                                   cp -rv picom/* ~/.config/picom
                                    fi
                                  elif [ "$PICOM_INSTALL" == 'n' ]; then
                                echo "Canseld."
                               fi
}

                           read -rp "Do You Want To Install Dependencis? y/n : " DEPN_INSTALL
                         if [ "$DEPN_INSTALL" == 'y' ]; then
                       INSTALL_DEP
                    elif [ "$DEPN_INSTALL"  == 'n' ]; then
                  echo "Canseld."
                fi

            read -rp "Do You Want To Copy The Configuration? y/n :" DWM_CONFIG
          if [ "$DWM_CONFIG" == 'y' ]; then
        INSTALL_DWM
      elif
    [ "$DWM_CONFIG" == 'n' ]; then
   echo "Canseld."
  fi

CHANGE_TERMINAL


    read -rp "Do You Want To Install Custom Dark Theme For Konsole? y/n :" KONSOLE_THEME
if [ "$KONSOLE_THEME" == 'y' ]; then
        cp -v konsole-themes/One\ Dark\ Color.colorscheme ~/.local/share/konsole/
elif [ "$KONSOLE_THEME" == 'n' ]; then
    echo "canseld"
fi

read -rp "Do You Want To Use .xinirc? y/n :" REPLY
if [ "$REPLY" == 'y' ]; then
     cp .xinirc ~/
elif [ "$REPLY" == n ]; then 
    echo "Canseld." 
    echo "Install Finished"
fi
# set +x
