#!/bin/bash

# Отримуємо інформацію про назву дистрибутиву та записуємо в змінну op_system
op_system=$(lsb_release -is)

#Перевіряємо чи наш дистрибутив Ubuntu
if [ $op_system == 'Ubuntu' ]; then
	#Отримуємо поточний час для запису в лог
	time_now=$(date +"%Y-%m-%d %H:%M:%S")
	# Вибираємо відсоток завантаження CPU за допомогою mpstat та awk
	cpu_load=$(mpstat 1 1 | awk '$12 ~ /[0-9.]+/ {printf "%.2f", 100 - $12; exit}')
	# Записуємо результат в файл логу
	echo "$time_now CPU Load: $cpu_load%" >> ~/hw03/cpu_usage.log
else
	echo "ERROR! Нажаль Ваш дистрибутив $op_system. Для роботи цього скрипта потрібен дистрибутив Ubuntu"
	exit 1
fi

