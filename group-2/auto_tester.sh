#!/bin/bash

input_data="1234567890" # Входные данные.
expected_result="0987654321" # Ожидаемый результат.

# Проверяем наличие папки для программ прошедших проверку в текущей директории, и если её нет создаём.
find_dir=$(find . -name success_folder)
if [ "$find_dir" = "" ] ; then
    mkdir success_folder
	#chmod 777 success_folder
fi

# Проверяем наличие папки для программ не прошедших проверку в текущей директории, и если её нет создаём.
find_dir=$(find . -name failure_folder)
if [ "$find_dir" = "" ] ; then
    mkdir failure_folder
	#chmod 777 failure_folder
fi

# В случае прохождения или не прохождения теста перемещаем тестируемые файлы в одну из этих папок.

# Проверка наличия входного текстового файла.
find_input_word=$(find . -name input_word.txt)
if [ "$find_input_word" = "" ]; then
    #echo "$input_data" > ./input_word.txt
	printf "%s" $input_data > ./input_word.txt
fi

# Проверка наличия файла лога.
find_log=$(find . -name log.txt)
if [ "$find_log" = "" ]; then
    touch ./log.txt	
fi


# Проверка наличия файла исходного кода.
find_reverse_word=$(find . -name reverse_word.c)
if [ "$find_reverse_word" = "" ] ; then
    current_time=$(date +%d_%m_%Y\_%H_%M_%S)
    echo "$current_time Тест провален. Отсутствует фаил <reverse_word.c>." >> log.txt
	exit 1
fi

# Компиляция файла исходного кода.
gcc -o reverse_word.elf reverse_word.c 2>/dev/null

# Проверка наличия исполняемого файла.
find_elf_file=$(find . -name reverse_word.elf)
if [ "$find_elf_file" = "" ] ; then
    current_time=$(date +%d_%m_%Y\_%H_%M_%S)
    echo "$current_time Тест провален. Не удалось создать файл <reverse_word.elf>." >> log.txt
	mv reverse_word.c ./failure_folder/"$current_time"_reverse_word.c
	exit 2
fi

# Запуск исполняемого файла.
./reverse_word.elf

# Проверка наличия выходного файла.
find_output_word=$(find . -name output_word.txt)
if [ "$find_output_word" = "" ] ; then
    current_time=$(date +%d_%m_%Y\_%H_%M_%S)
    echo "$current_time Тест провален. Не удалось создать выходной файл <output_word.txt>." >> log.txt
	mv reverse_word.c ./failure_folder/"$current_time"_reverse_word.c
	mv reverse_word.elf ./failure_folder/"$current_time"_reverse_word.elf
	exit 3
fi

# Проверка содержимого выходного файла.
obtained_result=$(cat ./output_word.txt)

if [ "$obtained_result" = "$expected_result" ] ; then
    current_time=$(date +%d_%m_%Y\_%H_%M_%S)
    echo "$current_time Тест пройден." >> log.txt
	mv reverse_word.c ./success_folder/"$current_time"_reverse_word.c
	mv reverse_word.elf ./success_folder/"$current_time"_reverse_word.elf
	mv output_word.txt ./success_folder/"$current_time"_output_word.txt
	exit 0
else
    current_time=$(date +%d_%m_%Y\_%H_%M_%S)
    echo "$current_time Тест провален. Полученный результат не совпал с ожидаемым." >> log.txt
	mv reverse_word.c ./failure_folder/"$current_time"_reverse_word.c
	mv reverse_word.elf ./failure_folder/"$current_time"_reverse_word.elf
	mv output_word.txt ./failure_folder/"$current_time"_output_word.txt
	exit 4
fi
