use vk;

ALTER TABLE vk.users ADD `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NULL;
ALTER TABLE vk.users ADD `updated_at` DATETIME DEFAULT on update CURRENT_TIMESTAMP NULL;

DELETE FROM users;

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
	firstname = 'NOTivan',
	lastname = 'NOTivanov',
	`updated_at` = NOW()
WHERE
	id = 46 or id = 47
;

select * from users;

/*
 * Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля 
 * к типу DATETIME, сохранив введеные ранее значения.
 */















