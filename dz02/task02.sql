create database example;

use example;

create table users (
	id INT auto_increment not null primary key,
	name VARCHAR(150) unique
);

mysqldump example > mysql.sql
mysqldump -uroot -pUsp03kw4F example > example.sql