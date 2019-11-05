use example1;

DELIMITER //
DROP PROCEDURE IF EXISTS example1.my_version //
create procedure example1.my_version () SELECT version(); //
DELIMITER ;

call my_version;


DROP function IF EXISTS example1.get_version;
DELIMITER //
create function example1.get_version()
returns varchar(255) deterministic -- deterministic - если возращает одно и тоже значение, иначе not deterministic
begin
	return version();
end //
DELIMITER ;

select example1.get_version();


SHOW VARIABLES;
SELECT version();


show procedure status like 'my_version';

select * from mysql.`user` limit 10;

show create procedure example1.my_version;



-- с модификатором IN @y НЕ будет изменен!!!
DROP procedure IF EXISTS example1.set_x;
DELIMITER //
create procedure example1.set_x(IN value INT) -- IN - будет по умолчанию, если не указывать
begin
	set @x = value;
	set value = value-1000;
end //
DELIMITER ;

call example1.set_x(12345);
select @x;

set @y = 10000;
call example1.set_x(@y);
select @x, @y;



-- с модификатором OUT @y БУДЕТ изменен!!!
DROP procedure IF EXISTS example1.set_x;
DELIMITER //
create procedure example1.set_x(OUT value INT) -- OUT
begin
	set @x = value;
	set value = 1000; -- если оставить по-старому, то будет то будет @y = NULL, потому что не INOUT
end //
DELIMITER ;

-- call example.set_x(12345); -- такой вызов на OUT не пройдет!

set @y = 10000;
call example1.set_x(@y);
select @x, @y;



-- с модификатором INOUT @y все удет работать!!!
DROP procedure IF EXISTS example1.set_x;
DELIMITER //
create procedure example1.set_x(INOUT value INT) -- INOUT
begin
	set @x = value;
	set value = value- 1000; -- работает!
end //
DELIMITER ;

-- call example1.set_x(12345); -- такой вызов на OUT не пройдет!

set @y = 10000;
call example1.set_x(@y);
select @x, @y;




-- DECLARE
DROP procedure IF EXISTS example1.DECLARE_var;
DELIMITER //
create procedure example1.DECLARE_var()
begin
	DECLARE var tinytext default 'внешняя переменная'; -- эта переменая будет доступна и во внутреннем блоке (видно будет, если закомментить строку 'внутренняя переменная')
	begin		
		DECLARE var tinytext default 'внутренняя переменная';
		select var;
	end;
	select var;
end//
DELIMITER ;

call example1.DECLARE_var();



-- ДЗ 3.1
/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
 * в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
 * возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
 * фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — 
 * "Доброй ночи".
*/
-- сделал процедуру:
DROP procedure IF EXISTS example1.w1;
DELIMITER //
create procedure example1.w1()
begin
SELECT CASE 
          WHEN HOUR(now()) <= 6 THEN 'Доброй ночи' 
          WHEN HOUR(now()) > 6 AND HOUR(now()) <= 12 THEN 'Доброе утро'
          WHEN HOUR(now()) > 12 AND HOUR(now()) <= 18 THEN 'Добрый день' 
          WHEN HOUR(now()) > 18 THEN 'Добрый вечер' 
          ELSE 'error!' 
       END AS part_of_day;
end //
DELIMITER ;

call example1.w1();



-- вот функция, только почему-то не работает:
DROP function IF EXISTS example1.hello;
DELIMITER //
create function example1.hello(time_now int)
returns varchar(255) deterministic -- deterministic - если возращает одно и тоже значение, иначе not deterministic
begin
	declare str varchar(255);
      if (time_now <= 6) THEN set str = 'Доброй ночи';
      if (time_now > 6 AND time_now <= 12) THEN set str = 'Доброе утро';
      if (time_now > 12 AND time_now <= 18) THEN set str = 'Добрый день'; 
      if (time_now > 18) THEN set str = 'Добрый вечер'; 
	return str;
end //
DELIMITER ;

select example1.hello(HOUR(now()));

/*В таблице products есть два текстовых поля: name с названием товара и description с 
 * его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба 
 * поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь 
 * того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям 
 * NULL-значение необходимо отменить операцию.*/

use shop;





/*
 * (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 * Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих 
 * чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.
 * 0	1	2	3	4	5	6	7	8	9	10
 * 0	1	1	2	3	5	8	13	21	34	55
*/

DROP FUNCTION IF EXISTS example1.fibo;
DELIMITER //
CREATE FUNCTION example1.fibo(x DOUBLE)
RETURNS DOUBLE DETERMINISTIC -- deterministic - если возращает одно и тоже значение, иначе not deterministic
BEGIN
 DECLARE y, summ DOUBLE DEFAULT 0;
 DECLARE y1, y2 DOUBLE DEFAULT 1;
   IF (x = 1 or x = 2) THEN 
   	  SET summ = 1;
   else
      fibo_loop: LOOP
         SET summ = y1 + y2;
         SET y1 = y2;
         SET y2 = summ;
         SET y = y + 1;
         IF (y = x-2) THEN
            LEAVE fibo_loop;
         END IF;
      END LOOP fibo_loop;
   END IF;
	RETURN y2;
END //
DELIMITER ;

SELECT example1.fibo(1476); -- INT до 46, BIGINT - до 92, DOUBLE - до 1476 вычисляет мгновенно!!!




































