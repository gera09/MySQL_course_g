use example;

drop table if exists load_data_csv;
create table load_data_csv	(
	id SERIAL PRIMARY KEY,
	product varchar(50),
	price float unsigned,
	type_product varchar(10)
);

insert IGNORE into load_data_csv(product, price, type_product) values
('machine', 1000, 'mechanizm'), ('chiar', 155, 'furniture');

/*
 * 
 * 
-- secure-file-priv = «C:\Users\v\Desktop\GB\MySQL_course\MySQL_course_g\»;
SHOW VARIABLES LIKE "secure_file_priv";
SET GLOBAL local_infile = 1; 

-- select * from user where User='user' \G;

-- --local-infile=1 -uroot -p;

-- загрузить данные из файла
LOAD DATA local INFILE '‪‪C:\Users\v\Desktop\GB\MySQL_course\MySQL_course_g\for_impor_example.csv' INTO TABLE load_data_csv FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY 'n' IGNORE 1 ROWS;


LOAD DATA local INFILE 'C:\Users\v\Desktop\GB\MySQL_course\MySQL_course_g\for_impor_example.csv' INTO TABLE load_data_csv;

LOAD DATA  INFILE 'C:\Users\v\Desktop\GB\MySQL_course\MySQL_course_g\for_impor_example.csv' INTO TABLE load_data_csv COLUMNS TERMINATED BY '\t';

select * from load_data_csv;

 */