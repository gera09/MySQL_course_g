/* Описание БД
 * Эта база данных для работы отдела ОРЭМ (оптовый рынок электроэнергии и мощности)
 * Она в себе содержит данные из отчетов инфраструктурных организаций (ценовые и объемные показатели)
 * А также фактические и прогнозные данные из различных метеоисточников, с приборов, принадлежащих 
 * непосредственно самой Организации
 * БД будет обновляться ежедневно, по мере поступления новой информации
 */

/* table's name:
 * report_27 - отчет 27
 * report_28 - отчет 28
 * br - отчет с сайта БР
 * fact_rp5 - факт погоды
 * forecast_rp5 - прогноз погоды
 * insol - инсоляция и пр данные
 * links_obj_insol - список объектов по инсоляции и пр данным
 * links_meteo_lok - список локаций метеообъектов (добавить расположение СЭС и дистанцию с метеостанцией)
 * gtp - список ГТП
 * logs - логи
 * 
 * На будущее сделать таблицы:
 * ku
 * fin_rez
 * peni_mounth
 * peni_kontrag
 * */

DROP DATABASE IF EXISTS SQL_project;
CREATE DATABASE SQL_project;
USE SQL_project;

DROP TABLE IF EXISTS report_27;
CREATE TABLE report_27 (
	id SERIAL PRIMARY KEY,
	-- trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html ======================
	-- trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime -- 1 =====================================
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s'), -- 2019-10-13 - дата, 00 - час          -- 1
	-- select STR_TO_DATE('2019-10-13 00', '%Y-%m-%d %H:%i:%s') 
	
	gtp VARCHAR(8) COMMENT 'GVIE0001',
	
	-- stair FLOAT COMMENT 'Заявка субъекта - Ступень', -- пустая колонка												 -- 2
	-- p_stair FLOAT COMMENT 'Заявка субъекта - Цена руб/(МВт*час)', -- пустая колонка									 -- 3
	v_bid_so FLOAT UNSIGNED COMMENT 'Заявка субъекта - Количество МВт*час.',											 -- 4
	
	-- ограничения
	t_min FLOAT UNSIGNED COMMENT 'технический минимум',																	-- 5
	-- t_min_tehnolog FLOAT COMMENT 'технический минимум' -- повторяющаяся колонка,										-- 6
	-- Рмин (СО)  МВт -- пустая колонка																					-- 7
	t_max FLOAT UNSIGNED COMMENT 'Рмакс** МВт из колонки 8',															-- 8
	change_load_down SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - снижения',				-- 9
	change_load_up SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - повышения',				-- 10
	
	-- v_rd -- у нас нет РД -- пустая колонка																			-- 11
	trade_graph FLOAT UNSIGNED COMMENT 'Объем Торгового графика МВт*час',												-- 12
	p_unreg FLOAT UNSIGNED COMMENT 'Средневзвешенная цена на продажу (по принятым поузловым объемам) руб/(МВт*час)',	-- 13
	v_sell_rsv FLOAT UNSIGNED COMMENT 'Продажа в РСВ - Объем продажи МВт*час',											-- 14
	p_sell_rsv FLOAT UNSIGNED COMMENT 'Продажа в РСВ - Цена руб/(МВт*час)',												-- 15
	
	-- v_sell_rsv FLOAT UNSIGNED COMMENT 'Покупка в обеспечение РД - Объем покупки МВт*час',							-- 16
	-- p_sell_rsv FLOAT UNSIGNED COMMENT 'Покупка в обеспечение РД - Цена руб/(МВт*час)',								-- 17
	
	v_buy_sdd FLOAT UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Объем покупки МВт*час',						-- 18
	p_buy_sdd FLOAT UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 19
	-- v_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Объем продажи МВт*час',					-- 20
	-- p_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',						-- 21
	
	-- korr_stair UNSIGNED COMMENT 'Скорректированная заявка субъекта - Ступень'										-- 22
    -- korr_p UNSIGNED COMMENT 'Скорректированная заявка субъекта - Цена руб/(МВт*час)' 								-- 23
    korr_v FLOAT UNSIGNED COMMENT 'Скорректированная заявка субъекта - Количество МВт*час',								-- 24
	-- индексы
	index(trading_date),
	index(gtp)
    -- прописать внешние ключи

);

DROP TABLE IF EXISTS report_28;
CREATE TABLE report_28 (
	id SERIAL PRIMARY KEY,
	-- trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html
	-- trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime 
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          -- 1
	-- select STR_TO_DATE('2019-10-13 00', '%Y-%m-%d %H:%i:%s')
	
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
	-- stair FLOAT COMMENT 'Заявка субъекта - Ступень', -- пустая колонка												 -- 2
	-- p_stair FLOAT COMMENT 'Заявка субъекта - Цена руб/(МВт*час)', -- пустая колонка								 	 -- 3
	-- v_bid_so FLOAT UNSIGNED COMMENT 'Заявка субъекта - Заявленный объем в АТС МВт*час',								 -- 4
	-- v_bid_so_korr FLOAT UNSIGNED COMMENT 'Заявка субъекта - Скорректированный АТС объем заявки МВт*час',				 -- 5
	-- v_losses_load_prog FLOAT COMMENT 'Объем прогнозных нагрузочных потерь в сетях, включенных в данную ГТП, МВт*час'  -- 6
	
	v_SO_zayav FLOAT UNSIGNED COMMENT 'Заявленный объем в СО',															 -- 7
	-- v_rd -- у нас нет РД -- пустая колонка																			 -- 8
	trade_graph FLOAT UNSIGNED COMMENT 'Объем Торгового графика МВт*час',												 -- 9
	p_unreg FLOAT UNSIGNED COMMENT 'Средневзвешенная цена на продажу (по принятым поузловым объемам) руб/(МВт*час)', 	 -- 10
	-- Полный отнесённый на ГТПП объём генерации блок-станций МВт*час -- нулевая колонка							   	 -- 11	

	tr_graph_gp FLOAT UNSIGNED COMMENT 'Объем ТГ за вычетом блок-станций, с учётом отнесения объёмов розничных договоров на ГП (ТГ*)МВт*час',	-- 12

	-- РСВ
	v_buy_rsv FLOAT UNSIGNED COMMENT 'Покупка в РСВ - Объем покупки МВт*час',											-- 13
	-- В т.ч. потери, отнесенные к объему покупки -- нулевая колонка  													-- 14
	p_buy_rsv FLOAT UNSIGNED COMMENT 'Покупка в РСВ - Цена руб/(МВт*час)',												-- 15
	
	-- v_sell_rsv FLOAT UNSIGNED COMMENT 'Продажа в обеспечение РД - Объем покупки МВт*час',							-- 16
	-- p_sell_rsv FLOAT UNSIGNED COMMENT 'Продажа в обеспечение РД - Цена руб/(МВт*час)',								-- 17
	
	-- СДД
	v_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Объем покупки МВт*час',						-- 18
	p_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 19
	-- v_buy_sdd FLOAT UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Объем продажи МВт*час',						-- 20
	-- p_buy_sdd FLOAT UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',						-- 21
	
	-- Продажа перевышения генерации блок-станций над потреблением - Объем покупки МВт*час	-- пустая колонка			-- 22
	-- Продажа перевышения генерации блок-станций над потреблением - Цена руб/(МВт*час)		-- пустая колонка			-- 23
	-- Объем нагрузочных потерь, отнесенных на данную ГТП, МВт*час 							-- пустая колонка			-- 24
	-- Объем нагрузочных потерь в ЭР участника, определенных по результатам конкурентного отбора МВт*час -- пустая кол  -- 25
	-- Стоимость нагрузочных потерь, учтенных в равновесных ценах, руб						-- пустая колонка			-- 26
	-- korr_stair UNSIGNED COMMENT 'Скорректированная заявка субъекта - Ступень'										-- 27
    -- korr_p UNSIGNED COMMENT 'Скорректированная заявка субъекта - Количество МВт*час' 								-- 28
    -- korr_v FLOAT UNSIGNED COMMENT 'Скорректированная заявка субъекта - Цена руб/(МВт*час)'							-- 29
	-- индексы
	index(trading_date),
	index(gtpp),
    -- прописать ключи
       FOREIGN KEY (trading_date) REFERENCES report_27(trading_date), -- ON DELETE RESTRICT ON UPDATE RESTRICT
       FOREIGN KEY (gtpp) REFERENCES report_27(gtp)
);


DROP TABLE IF EXISTS br;
CREATE TABLE br (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtp VARCHAR(8) COMMENT 'GVIE0001',
		
	tg FLOAT UNSIGNED COMMENT 'торговый график',															 
	PminPDG FLOAT UNSIGNED,																		 
	PmaxPDG  FLOAT UNSIGNED,	
	PVsvgo FLOAT UNSIGNED,	
	PminVsvgo FLOAT UNSIGNED,	
	PmaxVsvgo FLOAT UNSIGNED,	
	PminBR FLOAT UNSIGNED,	
	PmaxBR FLOAT UNSIGNED,	
	IBR FLOAT UNSIGNED,	
	CbUP FLOAT UNSIGNED,	
	CbDown FLOAT UNSIGNED,	
	CRSV FLOAT UNSIGNED,	
	TotalBR FLOAT UNSIGNED,	
	EVR FLOAT UNSIGNED,	
	OCPU FLOAT UNSIGNED,	
	OCPS FLOAT UNSIGNED,	
	Pmin FLOAT UNSIGNED,	
	Pmax FLOAT UNSIGNED,
	-- индексы
	index(trading_date),
	index(gtp),
    -- прописать ключи
       FOREIGN KEY (trading_date) REFERENCES report_27(trading_date),
       FOREIGN KEY (gtp) REFERENCES report_27(gtp) 
);


DROP TABLE IF EXISTS fact_rp5;
CREATE TABLE fact_rp5 (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
		
	local_time DATETIME null COMMENT 'местн. время',-- STR_TO_DATE('2019г. 1 ноября 16:00', '%d.%m.%Y %H:%i:%s') -часть после заяпятой  не адаптирована														 
	temp FLOAT UNSIGNED,																		 
	humid  FLOAT unsigned  COMMENT 'влажность',	
	w_dir FLOAT unsigned COMMENT 'направление ветра',	
	w_speed FLOAT unsigned COMMENT 'скорость ветра',
	w_gusts FLOAT unsigned COMMENT 'порывы ветра',
	ww VARCHAR(1000)  COMMENT 'явления погоды',
	www VARCHAR(1000) COMMENT 'оперативные явления погоды',
	сloudy FLOAT unsigned COMMENT 'общая облачность', 				-- привести от текста к цифрам
	vv FLOAT unsigned COMMENT 'горизонтальная дальность видимости',	-- привести от текста к цифрам
	td FLOAT unsigned COMMENT 'точка росы',	
	-- индексы
	index(trading_date),
	index(gtpp),
	index(local_time),
    -- прописать ключи
       FOREIGN KEY (trading_date) REFERENCES report_27(trading_date),
       FOREIGN KEY (gtpp) REFERENCES report_27(gtp) 
);


DROP TABLE IF EXISTS forecast_rp5;
CREATE TABLE forecast_rp5 (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
		
	local_time DATETIME null COMMENT 'местн. время',-- STR_TO_DATE('2019г. 1 ноября 16:00', '%d.%m.%Y %H:%i:%s') -часть после заяпятой  не адаптирована														 
	cloudy_v FLOAT unsigned  COMMENT 'облака вертикального развития',
	cloudy_l FLOAT unsigned  COMMENT 'облака нижнего яруса',
	cloudy_m FLOAT unsigned  COMMENT 'облака среднего яруса',
	cloudy_h FLOAT unsigned  COMMENT 'облака верхнего яруса',
	hrecip VARCHAR(1000)  COMMENT 'осадки описание (снег/дождь)',
	hrecip_level FLOAT unsigned  COMMENT 'осадки количество мм',
	ww VARCHAR(1000)  COMMENT 'явления погоды', -- туман, дымка
	vis FLOAT unsigned  COMMENT 'горизонтальная видимость', -- крайние часы интерполировать для плавного перехода? (1 - 2,75 - 4,5)
	temp FLOAT UNSIGNED,
	w_speed FLOAT unsigned COMMENT 'скорость ветра',
	w_gusts FLOAT unsigned COMMENT 'порывы ветра',
	w_dir VARCHAR(50) COMMENT 'направление ветра',
	humid  FLOAT unsigned  COMMENT 'влажность',
	-- индексы
	index(trading_date),
	index(gtpp),
	index(local_time),
    -- прописать ключи
    FOREIGN KEY (trading_date) REFERENCES report_27(trading_date),
    FOREIGN KEY (gtpp) REFERENCES report_27(gtp) 
);

DROP TABLE IF EXISTS insol;
CREATE TABLE insol (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
	
	id_param FLOAT unsigned  COMMENT 'ID параметра на сайте Grafanya',
	name VARCHAR(50)  COMMENT 'наименование значения',
	value DOUBLE COMMENT 'само значение',
	-- индексы
	index(trading_date),
	index(gtpp),
	index(name),
	index(id_param),
    -- прописать ключи
    FOREIGN KEY (trading_date) REFERENCES report_27(trading_date),
    FOREIGN KEY (gtpp) REFERENCES report_27(gtp)
);

DROP TABLE IF EXISTS links_obj_insol;
CREATE TABLE links_obj_insol (  
	id_param FLOAT unsigned  COMMENT 'ID параметра на сайте Grafanya',
	name VARCHAR(50)  COMMENT 'наименование значения',
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
	value DOUBLE COMMENT 'само значение',
	name_ses VARCHAR(100) COMMENT 'наименование СЭС',
	-- индексы
    -- прописать ключи
    FOREIGN KEY (id_param) REFERENCES insol(id_param) -- тут сильно не уверен в правильности ключей!!!=====================

);

DROP TABLE IF EXISTS links_meteo_lok;
CREATE TABLE links_meteo_lok (
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
	link VARCHAR(1000) COMMENT 'ссылка на страницу с прогнозом погоды',
	link_fact VARCHAR(1000) COMMENT 'ссылка на страницу с ФАКТОМ погоды',
	name_ses VARCHAR(100) COMMENT 'наименование СЭС',
	
	-- индексы
    -- прописать ключи
    FOREIGN KEY (gtpp) REFERENCES forecast_rp5(gtpp),
    FOREIGN KEY (gtpp) REFERENCES fact_rp5(gtpp)

);

DROP TABLE IF EXISTS gtp;
CREATE TABLE gtp (
	gtps VARCHAR(8) COMMENT 'SVIE0001',
	gtpp VARCHAR(8) COMMENT 'PVIE0001',
	gtp VARCHAR(8) COMMENT 'GVIE0001',
	name_ses VARCHAR(100) COMMENT 'наименование СЭС'
	-- индексы
    -- прописать ключи -- ================== Нужны ли они???? ===============================
);

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	log_time DATETIME null COMMENT 'время создания лога',
	log_txt VARCHAR(1000) COMMENT 'текст лога',
	status VARCHAR(50) COMMENT 'статус лога - ошибка, примечание и пр.'
	-- индексы
	-- index(log_time), -- эти индексы не нужны, так как поиск будет выполняться редко - только при наличии ошибок
	-- index(status)
    -- прописать ключи
);








INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1988-08-29');

	/*========================================================== stoped here!!! */
/* table's name:
 * report_27 - отчет 27
 * report_28 - отчет 28
 * br - отчет с сайта БР
 * fact_rp5 - факт погоды
 * forecast_rp5 - прогноз погоды
 * insol - инсоляция и пр данные
 * links_obj_insol - список объектов по инсоляции и пр данным
 * links_meteo_lok - список локаций метеообъектов (добавить расположение СЭС и дистанцию с метеостанцией)
 * gtp - список ГТП
 * logs - логи
 * 
 * На будущее сделать таблицы:
 * ku
 * fin_rez
 * peni_mounth
 * peni_kontrag
 * */

-- ALTER TABLE sql_project.report_27 ADD CONSTRAINT report_27_fk FOREIGN KEY (trading_date) REFERENCES sql_project.report_28(trading_date) ON DELETE RESTRICT ON UPDATE RESTRICT;


