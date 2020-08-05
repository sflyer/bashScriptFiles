# bashScriptFiles
<b>dav_convert.sh</b><br>
Ковертирует dav в mp4. Крайне полезен с видеорегистраторами dahua. <br>
Пример команды:<br>
./dav_convert.sh /home/user/test-dav /home/user/test-mp4 10 23-03-2020<br><br>
Собирет одно видео из 10 файлов в папке /home/user/test-dav и сохраняет его в домашнюю папку пользователя с именем full-video-23-03-2020.mp4<br><br>
<b>cons.sh</b><br>
Позволяет запускать Консультант+ из wine. <br>
В скрипте укажите переменные: сервер, домен. (domain, share)<br>
К сожалению не нашел способа монтирования без sudo поэтому подготовка к запуску выглядит так:<br>
1) sudo apt install cifs-utils<br>
2) В /etc/sudoers добавить строчку:<br>
%my\ group ALL=NOPASSWD: /usr/sbin/mount.cifs<br>
Где my\ group - имя группы, пользователи которой будут пользоваться Консультантом<br>
Далее просто сделайте скрипт исполняемым и запустите.<br><br>
Работоспособность проверена на x64 debian 10
