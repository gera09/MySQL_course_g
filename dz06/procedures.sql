use example;

DELIMITER //
DROP PROCEDURE IF EXISTS example.my_version //
create procedure example.my_version () SELECT version(); //
DELIMITER ;

call my_version;


DROP function IF EXISTS example.get_version;
DELIMITER //
create function example.get_version()
returns varchar(255) deterministic -- deterministic - если возращает одно и тоже значение, иначе not deterministic
begin
	return version();
end //
DELIMITER ;

select example.get_version();


SHOW VARIABLES;
SELECT version();


show procedure status like 'my_version';

select * from mysql.`user` limit 10;

show create procedure example.my_version;



-- с модификатором IN @y НЕ будет изменен!!!
DROP procedure IF EXISTS example.set_x;
DELIMITER //
create procedure example.set_x(IN value INT) -- IN - будет по умолчанию, если не указывать
begin
	set @x = value;
	set value = value-1000;
end //
DELIMITER ;

call example.set_x(12345);
select @x;

set @y = 10000;
call example.set_x(@y);
select @x, @y;



-- с модификатором OUT @y БУДЕТ изменен!!!
DROP procedure IF EXISTS example.set_x;
DELIMITER //
create procedure example.set_x(OUT value INT) -- OUT
begin
	set @x = value;
	set value = 1000; -- если оставить по-старому, то будет то будет @y = NULL, потому что не INOUT
end //
DELIMITER ;

-- call example.set_x(12345); -- такой вызов на OUT не пройдет!

set @y = 10000;
call example.set_x(@y);
select @x, @y;



-- с модификатором INOUT @y все удет работать!!!
DROP procedure IF EXISTS example.set_x;
DELIMITER //
create procedure example.set_x(INOUT value INT) -- INOUT
begin
	set @x = value;
	set value = value- 1000; -- работает!
end //
DELIMITER ;

-- call example.set_x(12345); -- такой вызов на OUT не пройдет!

set @y = 10000;
call example.set_x(@y);
select @x, @y;




-- DECLARE
DROP procedure IF EXISTS example.DECLARE_var;
DELIMITER //
create procedure example.DECLARE_var()
begin
	DECLARE var tinytext default 'внешняя переменная'; -- эта переменая будет доступна и во внутреннем блоке (видно будет, если закомментить строку 'внутренняя переменная')
	begin		
		DECLARE var tinytext default 'внутренняя переменная';
		select var;
	end;
	select var;
end//
DELIMITER ;

call example.DECLARE_var();










