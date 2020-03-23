#!/bin/bash
rm $HOME/videos.txt
touch $HOME/videos.txt
search_dir=$1
save_dir=$2
max=$3
date=$4
i=0
j=0
if [ $# -eq 0 ]; then
	echo "Ошибка! Правила использования: $0 source_dir dest_dir sum_videos date_on_final_file"
	exit 99
fi
#конвертируем видео из DAV в mp4 в $save_dir
        mkdir $save_dir
        for entry in "$search_dir"/*
        do
          i=$((i+1))
          ffmpeg -y -i $entry -vcodec libx264 -crf 24 -movflags +faststart $save_dir/$i.mp4
        done
#перечисляем все видосы в текстовый файл

	while [ $j != $max ] 
	do
 	 j=$((j+1))
	 
 	 echo "file '"$save_dir"/"$j".mp4'" >> $HOME/videos.txt
	done
#собираем их в одно видео
	ffmpeg -f concat -safe 0 -i $HOME/videos.txt -c copy full-video-$date.mp4
	exit 1


