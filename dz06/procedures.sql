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