#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
mkdir -p task/dir{1..3};mkdir task/dir3/dir4;

# изменяем текущую директорию на task
cd task;

# создаём пустой файл task/dir2/empty
touch dir2/empty;

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo -e '#!/bin/bash\necho "$1 $2, привет!"' > dir2/hello.sh;

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh;

# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls dir2 > dir2/list.txt;

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2/* dir3/dir4;

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
find . -type f -iname "*.txt" > dir1/summary.txt;
# находящихся в task, включая поддиректории

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt;

# определяем переменную окружения NAME со значением "Всем студентам"
NAME='Всем студентам';

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
./dir2/hello.sh $NAME >> dir1/summary.txt;
# вывод скрипта должен дописаться в файл task/dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv dir1/summary.txt 'Практическое задание';

# выводим на консоль содержимое файла task/Практическое задание
cat 'Практическое задание';

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
grep -i "dir" 'Практическое задание' | sort;
# и затем отсортировываем их

# меняем текущую директорию на родительскую для task
cd ..;
# удаляем директорию task со всем содержимым
rm -r task
