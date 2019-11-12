/*show status like 'Key%'

show status like 'Innodb_buffer_%'

use shop;
explain select id, name from catalogs order by id;
explain select id, name from catalogs 
union all select id, name from catalogs;*/


/*
 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 catalogs и products в таблицу logs помещается время и дата создания записи, 
 название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
use shop;
drop table if exists logs;
create table logs (
	time_add datetime not null COMMENT 'время и дата создания записи', 
 	table_name varchar(50) not null COMMENT 'название таблицы', 
 	key_id int not null COMMENT 'идентификатор первичного ключа',
	name_from_table varchar(50) not null COMMENT 'содержимое поля name'
	)
ENGINE=ARCHIVE;

SELECT
  ENGINE
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = 'shop' AND TABLE_NAME = 'logs'; -- ARCHIVE

  
-- как сделать в одном треггере - не знаю (но хотелось бы узнать на последнем занятии). 
-- Сделал для каждого отдельно!
  
DROP trigger IF EXISTS insert_products;
DROP trigger IF EXISTS insert_users;
DROP trigger IF EXISTS insert_catalogs;
DELIMITER //
create trigger insert_products after insert on products
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'products', (select id from products order by id desc limit 1), (select name from products order by id desc limit 1));
end //
create trigger insert_users after insert on users
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'users', (select id from users order by id desc limit 1), (select name from users order by id desc limit 1));
end //
create trigger insert_catalogs after insert on catalogs
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'catalogs', (select id from catalogs order by id desc limit 1), (select name from catalogs order by id desc limit 1));
end //
DELIMITER ;

SHOW TRIGGERS;


insert into catalogs (name) values 
	('Корпуса');
delete from catalogs order by id desc limit 1;

insert into products (name, description, price, catalog_id, created_at, updated_at) values 
	('Intel Core i7', 
	 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.',
	 19999,
	 1,
	 now(),
	 now()
	);
delete from products order by id desc limit 1;

insert into users (name, birthday_at, created_at, updated_at) values 
	('Никодим', 
	 '2000-01-01',
	 now(),
	 now()
	);
delete from users order by id desc limit 1;

/*
2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/
select @million;

DELIMITER //
drop procedure if exists dowhile //
CREATE PROCEDURE dowhile()
begin
	set @million = 0;
	WHILE @million < 1000 DO
	    insert into users (name, birthday_at, created_at, updated_at) values 
		('Никодим', 
		 '2019-01-01',
		 now(),
		 now()
		);
	 SET @million = @million + 1;
	END WHILE;
end //
DELIMITER ;

CALL dowhile();

insert into users (name, birthday_at, created_at, updated_at) values 
	('Никодим', 
	 FROM_UNIXTIME(RAND() * 2147483647),
	 now(),
	 now()
	);
use shop;

select id from users order by id desc limit 1;

-- вставка 1 000 0000 только строки 					- сек
-- вставка 1 000 0000 строки и случайная дата 			- сек
-- вставка 1 000 0000 строи и случайная дата и текст	- сек

/*set profiling=1;
SELECT LEFT(UUID(), 8);
show profiles;

set profiling=0;*/








