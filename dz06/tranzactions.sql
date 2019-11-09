use shop;

select @id:=user_id from orders; 
select @id; -- получает максимальное значение! А не последнее!!! Из-за индекса???

select @date_create:=created_at from orders; 
select @date_create; -- получает ПОСЛЕДНЕЕ значение!

select @name:=name from products; 
select @name; -- получает ПОСЛЕДНЕЕ значение!

select @price:=price from products; 
select @price; -- получает ПОСЛЕДНЕЕ значение!

-- Переменные НЕ чуствительны к регистру!!!

use example1;
drop table if exists numerics;
create table numerics (
	value varchar(150) null
);
insert into numerics (value) values 
	('val1'),('val2'),('val3');

select * from numerics;
set @start :=0;
select @start:= @start + 1 as id, value from numerics;
select * from numerics;

-- describe products;



/*
Практическое задание по теме “Транзакции, переменные, представления”

1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/
use shop;
-- предварительно создал копию БД sample
select * from users;
START TRANSACTION;

INSERT INTO sample.users (*)
  VALUES (select * from shop.users where id =1);

SELECT @last_user_id := (SELECT MAX(id) FROM users); -- опасный способ

INSERT INTO profiles (user_id, gender, birthday, hometown)
  VALUES (@last_user_id, 'M', '1999-10-10', 'Moscow'); 
  
COMMIT;

select * from sample.users;

-- пример перемещения
    INSERT INTO Persons_Table (person_id, person_name,person_email)
          SELECT person_id, customer_name, customer_email
          FROM customer_table
          WHERE "insert your where clause here";
    DELETE FROM customer_table
          WHERE "repeat your where clause here";
         
/*
2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.

3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые 
календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.

4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, 
который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/











