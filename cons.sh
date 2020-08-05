#!/bin/bash
#ид пользователя
uid=$(id -u)
#путь, где храниться вайн
prefix=~/.cons
#путь, где монтируется шара
point=$prefix/share
#путь шары
share=//server_dns_or_ip/consultant/
#домен пользователя
domain=DOMAIN
#проверка монтирования шары
echo "Проверяю наличие доступа к серверу..."
if [[ ! $(mount | grep $share) ]];
  then echo "Не найдено, начинаем авторизацию..."
#проверка префикса и установка corefonts
  if [ ! -d $prefix ]; then
    mkdir $prefix
    echo "Префикс пуст, запускаю установку шрифтов!"
    WINEPREFIX=$prefix winetricks corefonts
  fi
  if [ ! -d $point ]; then
    mkdir $point
  fi
#GUI
  logpass=$(zenity --forms --title "Авторизация" --text  "Введите ваше имя пользователя и пароль!" \
  --separator="," \
  --add-entry "Имя: " \
  --add-password="Пароль: ")
#получаем лоин и пароль
  login=$( echo $logpass | awk -F ',' '{print $1}' )
  password=$( echo $logpass | awk -F ',' '{print $2}' )
#монтирование шары
  sudo mount.cifs $share $point -o uid=$uid,user=$login,domain=$domain,password=$password
fi
#запуск через wine
if [[ $(mount | grep $share) ]];
  then echo "Попытка запуска через wine..."
  sudo echo 'Запускаю из '$point'/cons.exe'
  WINEPREFIX=$prefix wine $point/cons.exe /Linux /Yes
fi
