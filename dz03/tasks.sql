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

select * from users; -- тип данных как текст, при выполнении alt+x этого не видно, т.к. надо обновить dbeaver слева в структуре

UPDATE users set created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i:%s'); -- тут ошибка переписать апдейт нормально (см в инете)
UPDATE users set updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i:%s');

ALTER TABLE vk.users MODIFY COLUMN created_at DATETIME NULL;
ALTER TABLE vk.users MODIFY COLUMN updated_at DATETIME NULL;

select * from users; -- все работает



-- ВОПРОС: почему код не выполняется через выделение нескольких строк и нажатие на ctrl+Enter? Выдает ошибку. 
-- При это построчно работает, и через alt+x тоже работает!



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
















