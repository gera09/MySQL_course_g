show status like 'Key%'

show status like 'Innodb_buffer_%'

use shop;
explain select id, name from catalogs order by id;
explain select id, name from catalogs 
union all select id, name from catalogs;

/*
 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 catalogs и products в таблицу logs помещается время и дата создания записи, 
 название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
use shop;
create table logs (
	время и дата создания записи, 
 	название таблицы, 
 	идентификатор первичного ключа 
	содержимое поля name
 a int,
 b varchar(32))
ENGINE=ARCHIVE






/*
2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/














