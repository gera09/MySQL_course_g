DROP DATABASE IF EXISTS SQL_project;
CREATE DATABASE SQL_project;
USE SQL_project;

DROP TABLE IF EXISTS report_27;
CREATE TABLE report_27 (
	id SERIAL PRIMARY KEY,
	trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)',
	trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',
	gtp VARCHAR(8) COMMENT 'GVIE0001',
	-- v_bid INT COMMENT 'Заявка субъекта - Заявленный объем в АТС МВт*час', -- пустая колонка
	v_so 'Заявленный объем в СО МВт*час',
		COMMENT 'id состоит из ГТП, даты и часа (GIVE0001_2019-10-13_00)',
	DECIMAL(9,3) -- диапазон от -999999.999 до 999999.999
	
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамиль', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    INDEX users_phone_idx(phone), -- как выбирать индексы?
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

