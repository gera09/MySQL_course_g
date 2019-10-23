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

select * from users;

/*
 * Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля 
 * к типу DATETIME, сохранив введеные ранее значения.
 */

ALTER TABLE vk.users MODIFY COLUMN created_at VARCHAR(50);
ALTER TABLE vk.users MODIFY COLUMN updated_at VARCHAR(50);

select * from users;

UPDATE users
	SET created_at = "20.10.2017 8:10",
	updated_at = "20.10.2017 8:20"
;

UPDATE users set created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i:%s') from users; -- тут ошибка переписать апдейт нормально (см в инете)
UPDATE users set updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i:%s') from users;

ALTER TABLE vk.users MODIFY COLUMN created_at DATETIME NULL;
ALTER TABLE vk.users MODIFY COLUMN updated_at DATETIME NULL;


















