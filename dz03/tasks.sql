use vk;

ALTER TABLE vk.users DROP COLUMN created_at;
ALTER TABLE vk.users DROP COLUMN updated_at;
ALTER TABLE vk.users ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL;
ALTER TABLE vk.users ADD updated_at DATETIME default current_timestamp on update current_timestamp NULL;

delete from users;

INSERT INTO users (firstname, lastname, email, phone) values
('Ivan', 'Ivanov', 'ar7dlo50102@example.org', '9374071116'),
('Petr', 'Petrov', 'terrence8.cartwright@example.org', '9127498182'),
('Nikola', 'Mikolay', 'rup8ert55@example.org', '9921090703'),
('Sablya', 'Drezdovic', 're9bekah29@example.net', '9592139196'),
('Sanya', 'Sekiro', 'von.7bridget@example.net', '9909791725')
;

-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”

/*1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 * Заполните их текущими датой и временем.*/
UPDATE users
SET 
	lastname = 'NOT1'
	-- `updated_at` = NOW() - не требуется, дата "updated_at" обновляется автоматически
WHERE
	firstname = 'Ivan' or firstname = 'Petr'
;

select * from users; -- посмотрел, что дата апдейта обновилась автоматически

/*
 * 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля 
 * к типу DATETIME, сохранив введеные ранее значения.
 */

ALTER TABLE vk.users MODIFY COLUMN created_at VARCHAR(50);
ALTER TABLE vk.users MODIFY COLUMN updated_at VARCHAR(50);

UPDATE users
	SET created_at = "20.10.2017 8:10",
	updated_at = "20.10.2017 8:20"
;

select * from users; -- тип данных как текст, при выполнении всего кода через alt+x этого не видно, т.к. надо обновить dbeaver слева в структуре

UPDATE users set created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i:%s');
UPDATE users set updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i:%s');

ALTER TABLE vk.users MODIFY COLUMN created_at DATETIME NULL;
ALTER TABLE vk.users MODIFY COLUMN updated_at DATETIME NULL;

select * from users; -- все работает



/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи 
 * таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы 
 * должны выводиться в конце, после всех записей.
*/

DROP DATABASE IF EXISTS example1;
CREATE DATABASE example1;
USE example1;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	
	id SERIAL PRIMARY KEY,
    value BIGINT UNSIGNED NOT NULL
);

INSERT INTO storehouses_products  (value)
	VALUES
	(1),(0),(5),(2),(0),(3),(100),(5),(999),(15),(25),(10)
;

SELECT value FROM storehouses_products
	ORDER BY CASE WHEN 
		value = 0 THEN 1 
		END, 
	value -- вместо 1 вроде как советуют границу максимального даипазона, но можно хоть что!!!!
;
-- до запятой сортируем нули, после - значения

SELECT value
	FROM storehouses_products
	ORDER BY IF(value = 0, 1, 0), value -- второй вариант (IF( condition, [value_if_true], [value_if_false] ))
;
	
--  ВОПРОС: таблицы для заданий надо создавать самому или где-то есть готовые?



/*
4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий ('may', 'august')
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамиль', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    birthday VARCHAR(50)
);

-- добавим несколько пользователей
insert into users (id, firstname, lastname, email, phone, birthday) values
('1', 'Reuben', 'Nienow', 'arlo50102@example.org', '9374071116', '29 may 1988'),
('2', 'Frederik', 'Upton', 'terrence.cartwright@example.org', '9127498182', '30 july 1990'),
('3', 'Unique', 'Windler', 'rupert55@example.org', '9921090703', '1 june 2000'),
('4', 'Norene', 'West', 'rebekah29@example.net', '9592139196', '2 august 1995'),
('5', 'Frederick', 'Effertz', 'von.bridget@example.net', '9909791725', '15 may 1985'),
('6', 'Norene2', 'West', 'rebesdfskah29@example.net', '9592139196', '10 september 1990'),
('7', 'Norene1', 'West', 'rebeksfah29@example.net', '9592139196', '5 august 1998')
;

SELECT * FROM users; 

SELECT firstname, birthday FROM users
	WHERE birthday like '% may %' OR birthday like '%august%'
;



/*5 .(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    product VARCHAR(50)
);

insert into catalogs (product) values 
	('something'),	('photo'),	
	('table'),	('check'),	
	('brown'),	('napkin')
;

SELECT * FROM catalogs; 

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER by FIELD (id, 5, 1, 2);

-- по-моему задание пора обновить: 
-- https://ru.stackoverflow.com/questions/562351/mysql-%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B8-%D0%B2-%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5-%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D0%BE%D0%BC-%D0%B2-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%B5-in



-- Практическое задание теме “Агрегация данных”

/*
 * 1. Подсчитайте средний возраст пользователей в таблице users
 *  */

select birthday from users;
select avg(DATEDIFF(curdate(), STR_TO_DATE(birthday, '%d %M %Y')) div 365) from users; -- средний возраст



/*2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/


select sum(WEEKDAY(select STR_TO_DATE( birthday, 2019 '%d %M') from users))

select SUBSTRING(birthday, length(birthday)-3, length(birthday)) from users; -- получил год

select 
	REPLACE(birthday, SUBSTRING(birthday, length(birthday)-3, length(birthday)), '2019') 
from users; -- заменил год

select STR_TO_DATE(
			REPLACE(birthday, SUBSTRING(birthday, length(birthday)-3, length(birthday)), '2019'),
		'%d %M %Y') as `date`
from users; -- привел к типу DATETIME





-- выбрать количество по дням недели count -- не работает!!!!
select COUNT( 
		select STR_TO_DATE(REPLACE(birthday, SUBSTRING(birthday, length(birthday)-3, length(birthday)), '2019'), '%d %M %Y') from users
		)
from users;


SELECT WEEKDAY(STR_TO_DATE(birthday, '%d.%m.%Y %H:%i:%s')); -- не работает, как получить для всего столбца???



/*
 * 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы
 */

select id from users;
SELECT EXP(SUM(LOG(id))) FROM users; -- работает!!!

-- Немаловажно также получать верный ответ на все задачи и обратную связь, по своему решению. Спасибо!










