-- задание 2 
-- у меня не получается подключиться через файл .my.cnf

-- задание 3
show databases;

drop database if exists example;
create database example;
use example;

use example;

create table users (
	id INT auto_increment not null primary key,
	name VARCHAR(150) unique
);

-- файл .my.cnf у меня так и не заработал, поэтому дамп делаю с авторизацией через root в командной строке (как это сделать в dbeaver???):
-- mysqldump -u root -p > example.sql


-- а не как в примере:
-- mysqldump example > example.sql

-- Весь этот код я выполнил в командной строке.
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

-- код ниже не работает в dbeaver, только в командной строке!!! Почему?
-- SOURCE example.sql

/* Еще такой вариант в инете нашел:
# Восстанавливаем базу данных your_base из файла дампа dump_file
mysql -u root -p your_base < dump_file.sql
*/


DESCRIBE users; -- показывает заполненную таблицу из файла дампа БД example.sql


-- задание 4
use mysql;
describe mysql.help_keyword;
select *from help_keyword;

-- Опять же, этот код отрабатывает только из командной строки:
-- mysqldump -u root -p mysql --skip-opt --where="true limit 100" help_keyword > report.sql
