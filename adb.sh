#!bin/bash

# This script made by ScripterXGC will install adb and fastboot.

## ANSI colors (FG & BG)
## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

#############SCRIPT BY SCRIPTERXGC########DO NOT COPY##############

clear
# Script termination
exit_on_signal_SIGINT() {
    printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted"
    exit 0
}

exit_on_signal_SIGTERM() {
    printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated"
    exit 0
}

# Trap SIGINT (Ctrl-C) and SIGTERM signals
trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

cat << "EOF"
            _____   ____  _____              _          _  _             
     /\    |  __ \ |  _ \|_   _|            | |        | || |            
    /  \   | |  | || |_) | | |   _ __   ___ | |_  __ _ | || |  ___  _ __ 
   / /\ \  | |  | ||  _ <  | |  | '_ \ / __|| __|/ _` || || | / _ \| '__|
  / ____ \ | |__| || |_) |_| |_ | | | |\__ \| |_| (_| || || ||  __/| |   
 /_/    \_\|_____/ |____/|_____||_| |_||___/ \__|\__,_||_||_| \___||_|   
EOF
                     echo -e ${CYAN} Version${RESETBG}${GREEN} 1.0 By${RESETBG}${ORANGE} ScripterXGC${RESETBG}                            
echo
echo Choose your preferred option:
echo -e "${GREEN}[1] Install ADB & Fastboot"
echo -e "${RED}[2] Uninstall ADB & Fastboot"
echo
read  -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}" option

if [ "$option" -eq 1 ]; thendirectory="$(pwd)"
echo
echo -e "\e[93mInstalling."
echo
echo -e "\e[32m[*] \e[34mDownloading wrapper script..."
mkdir $PREFIX/tmp/adbtemp
downpath="$PREFIX/tmp/adbtemp"
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb -P $downpath/ -q
echo -e "\e[32m[*] \e[34mDownloading binaries..."
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb.bin -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot-armeabi -P $downpath/ -q
echo -e "\e[32m[*] \e[34mCopying files to bin..."
cp $downpath/* $PREFIX/bin
echo -e "\e[32m[*] \e[34mSetting execution permissions..."
files="$(ls $downpath)"
cd $PREFIX/bin
chmod +x $files
echo -e "\e[32m[*] \e[34mCreating workspace directory..."
cd $HOME
if [ ! -d "adbfiles" ]; then
  mkdir adbfiles
fi
echo -e "\e[32m[*] \e[34mCleaning up..."
cd $directory
rm -rf $downpath
rm -rf InstallTools.sh
echo
echo -e "\e[32mTools were successfully installed!\e[39m"
echo
elif [ "$option" -eq 2 ]; then
echo
echo -e "\e[93mUninstalling."
echo
echo -e "\e[32m[*] \e[34mRemoving wrapper script..."
rm -rf $PREFIX/bin/adb
echo -e "\e[32m[*] \e[34mRemoving binaries..."
rm -rf $PREFIX/bin/adb.bin $PREFIX/bin/fastboot $PREFIX/bin/fastboot-armeabi
echo -e "\e[32m[*] \e[34mRemoving keys..."
case `find $HOME/adbfiles -type f | wc -l` in
0 | 2)
  rm -rf $HOME/adbfiles ;;
*)
  rm -rf $HOME/adbfiles/adbkey $HOME/adbfiles/adbkey.pub ;;
esac
echo -e "\e[32m[*] \e[34mCleaning up..."
rm -rf RemoveTools.sh
echo
echo -e "\e[32mTools were successfully uninstalled!\e[39m"
echo
else
echo -e "${RED}Invalid Option."
exit 0
fi
