/*Тема “Сложные запросы”

1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

use vk;

-- опять вопрос, надо самому создавать таблицы для заданий?

DROP TABLE IF EXISTS market;
CREATE TABLE market (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	user_id BIGINT UNSIGNED NOT NULL,
    orders VARCHAR(50),
    
	FOREIGN KEY (user_id) REFERENCES users(id)
);

insert into market (user_id, orders) values
(1, 'tv'), (1, 'soap'), (41, 'case'), (31, 'milk'), (21, 'pistol'), (21, 'ORANGE'), (1, 'tube'), (1, 'glases'), (11, 'monitor'), (11, 'bass');


select * from users where id IN (select distinct user_id from market); -- решение!



/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

use shop;

SELECT products.catalog_id as pc, products.name, catalogs.name from products
    JOIN 
    catalogs ON products.catalog_id = catalogs.id;

   -- нашел заготовку для задания


/*
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
*/
use example1;
  
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY, 
	`from`  VARCHAR(50),
    `to` VARCHAR(50)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL PRIMARY KEY, 
	label  VARCHAR(50),
    name VARCHAR(50)
);

insert into flights (`from`, `to`) values
	('moskow','omsk'), ('novgorod','kazan'), ('irkutsk','moskow'), ('omsk','irkutsk'), ('moskow','kazan');

insert into cities (label, name) values
	('moskow','Москва'), ('irkutsk','Иркутск'), ('novgorod','Новгород'), ('kazan','Казань'), ('omsk','Омск');

select * from flights 

select * from cities

select * from flights 
select name from cities 

SELECT flights.`from`, flights.`to` from flights
    JOIN 
    cities ON flights.`from` = cities.label
  
    
select 	flights.`from` as ff, flights.`to`, cities.label, cities.name as ft from flights 
inner join 
		cities on (flights.`from` = cities.label)
 -- 	where citiess=flights
   


select replace((flights.`from`),
    			(cities.label),
    			(cities.name)) as `from`,
    	replace((flights.`to`),
    			(cities.label),
    			(cities.name)) as `to`
    			from cities
join
	flights on (flights.`from` = cities.label  or flights.`to` = cities.label); --  почти получилось!!!


	
(select replace((flights.`from`),
    			(cities.label),
    			(cities.name)) as `from`
    			from cities
join
	flights on (flights.`from` = cities.label))
union
(select replace((flights.`to`),
    			(cities.label),
    			(cities.name)) as `to`
    			from cities
join
	flights on (flights.`to` = cities.label));  --  не работает вместе, отдельно я получил эти две колонки (если выполнить отдельно до и после union)

-- в итоге так и не получилось!

select IF('Привет' REGEXP '[А-Яа-я]', 'русский', 'yt jxty,'); -- конструкция для выбора русского текста

















