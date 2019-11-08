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

DROP DATABASE IF EXISTS SQL_project1;
CREATE DATABASE SQL_project1;
USE SQL_project1;

DROP TABLE IF EXISTS report_27;
CREATE TABLE report_27 (
	id SERIAL PRIMARY KEY,
	-- trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html ======================
	-- trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime -- 1 =====================================
	trading_date DATETIME null, -- DATETIME
	
	-- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s'), -- 2019-10-13 - дата, 00 - час          -- 1
	-- select STR_TO_DATE('2019-10-13 00', '%Y-%m-%d %H:%i:%s') 
	
	gtp VARCHAR(8) null COMMENT 'GVIE0001',
	
	-- stair FLOAT COMMENT 'Заявка субъекта - Ступень', -- пустая колонка												 -- 2
	-- p_stair FLOAT COMMENT 'Заявка субъекта - Цена руб/(МВт*час)', -- пустая колонка									 -- 3
	v_bid_so FLOAT UNSIGNED null COMMENT 'Заявка субъекта - Количество МВт*час.',											 -- 4
	
	-- ограничения
	t_min FLOAT UNSIGNED null COMMENT 'технический минимум',																	-- 5
	-- t_min_tehnolog FLOAT COMMENT 'технический минимум' -- повторяющаяся колонка,										-- 6
	-- Рмин (СО)  МВт -- пустая колонка																					-- 7
	p_max FLOAT UNSIGNED null COMMENT 'Рмакс** МВт из колонки 8',															-- 8
	change_load_down SMALLINT UNSIGNED null COMMENT 'предел часового изменения нагрузки генератором - снижения',				-- 9
	change_load_up SMALLINT UNSIGNED null COMMENT 'предел часового изменения нагрузки генератором - повышения',				-- 10
	
	-- v_rd -- у нас нет РД -- пустая колонка																			-- 11
	trade_graph FLOAT UNSIGNED null COMMENT 'Объем Торгового графика МВт*час',												-- 12
	p_unreg FLOAT UNSIGNED null COMMENT 'Средневзвешенная цена на продажу (по принятым поузловым объемам) руб/(МВт*час)',	-- 13
	v_sell_rsv FLOAT UNSIGNED null COMMENT 'Продажа в РСВ - Объем продажи МВт*час',											-- 14
	p_sell_rsv FLOAT UNSIGNED null COMMENT 'Продажа в РСВ - Цена руб/(МВт*час)',												-- 15
	
	-- v_sell_rsv FLOAT UNSIGNED COMMENT 'Покупка в обеспечение РД - Объем покупки МВт*час',							-- 16
	-- p_sell_rsv FLOAT UNSIGNED COMMENT 'Покупка в обеспечение РД - Цена руб/(МВт*час)',								-- 17
	
	v_buy_sdd FLOAT UNSIGNED null COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Объем покупки МВт*час',						-- 18
	p_buy_sdd FLOAT UNSIGNED null COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 19
	-- v_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Объем продажи МВт*час',					-- 20
	-- p_sell_sdd FLOAT UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',						-- 21
	
	-- korr_stair UNSIGNED COMMENT 'Скорректированная заявка субъекта - Ступень'										-- 22
    -- korr_p UNSIGNED COMMENT 'Скорректированная заявка субъекта - Цена руб/(МВт*час)' 								-- 23
    korr_v FLOAT UNSIGNED null COMMENT 'Скорректированная заявка субъекта - Количество МВт*час',								-- 24
    
    gtpp VARCHAR(8) null COMMENT 'PVIE0001',
    
	-- индексы
	index(trading_date),
	index(gtp),
	index(gtpp)
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
       FOREIGN KEY (gtpp) REFERENCES report_27(gtpp)
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
       FOREIGN KEY (gtp) REFERENCES report_27(gtpp) 
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
       FOREIGN KEY (gtpp) REFERENCES report_27(gtpp) 
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
    FOREIGN KEY (gtpp) REFERENCES report_27(gtpp) 
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
    FOREIGN KEY (gtpp) REFERENCES report_27(gtpp)
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
	-- log_time DATETIME null COMMENT 'время создания лога', -- ============================= ВОССТАНОВИТЬ ВРЕМЯ ===================
	id SERIAL PRIMARY KEY,
	log_txt VARCHAR(1000) COMMENT 'текст лога',
	status VARCHAR(50) COMMENT 'статус лога - ошибка, примечание и пр.'
	-- индексы
	-- index(log_time), -- эти индексы не нужны, так как поиск будет выполняться редко - только при наличии ошибок
	-- index(status)
    -- прописать ключи
);

SHOW VARIABLES LIKE "secure_file_priv"; -- установил в файле my.ini путое значение!

SHOW VARIABLES

LOAD DATA INFILE 'csv_to_logs.csv' 
INTO TABLE report_27
CHARACTER SET cp1251
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- '\n'
IGNORE 1 ROWS;

/*
LOAD DATA INFILE 'csv_to_logs.csv' 
INTO TABLE logs
CHARACTER SET cp1251
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- '\n'
IGNORE 1 ROWS;

  
   

-- INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('1', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 884, 750, '0.82', '43.4', '286128000', '1041.06', '0', '124405', '0');
/*
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('1', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 884, 750, '0.82', '43.4', '286128000', '1041.06', '0', '124405', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('2', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 698, 611, '43067200', '7.58', '5.379', '40319.3', '15515200', '533209000', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('3', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 74, 875, '818.798', '0', '53563.8', '5.427', '3260.3', '17575300', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('4', '2019-01-01 00:01:00', 'GVIE0010', '0.1', '800', '800', 585, 929, '0', '4.0008', '782.501', '591615', '82235.9', '0', '0.1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('5', '2019-01-01 00:01:00', 'GVIE0010', '0.2', '800', '800', 583, 721, '6.08562', '314.885', '23229.8', '5189380', '0', '13.5154', '0.2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('6', '2019-01-01 00:01:00', 'GVIE0010', '0.4', '800', '800', 495, 85, '14.4055', '48837000', '2764.51', '45.216', '0', '501.299', '0.4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('7', '2019-01-01 00:01:00', 'GVIE0010', '0.45', '800', '800', 780, 479, '158', '477852000', '19371.3', '0.2', '2595', '0', '0.45');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('8', '2019-01-01 00:01:00', 'GVIE0010', '0.564', '800', '800', 408, 212, '3.12376', '26454200', '6369370', '0', '61.8551', '35.3327', '0.564');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('9', '2019-01-01 00:01:00', 'GVIE0010', '0.45', '800', '800', 685, 166, '322464', '2238', '29938', '63851', '26.3498', '324275', '0.45');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('10', '2019-01-01 00:01:00', 'GVIE0010', '0.2', '800', '800', 454, 670, '181292', '9398320', '3042', '516.388', '683725000', '275.651', '0.2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('11', '2019-01-01 00:01:00', 'GVIE0010', '0.1', '800', '800', 898, 356, '65.8215', '6866540', '171290', '1.62633', '15263.4', '261508000', '0.1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('12', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 72, 506, '3212', '14965.5', '7464', '2784200', '155.871', '178504000', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('13', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 799, 513, '0', '1674.43', '117446', '31672200', '171.715', '39.09', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('14', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 43, 377, '556198000', '1370.66', '539165', '1.14565', '61383', '367.999', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('15', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 114, 359, '0', '1018850', '2970670', '5531770', '521214', '3774.78', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('16', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 553, 710, '6629050', '184181', '209162', '16.8615', '2.3098', '568046000', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('17', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 505, 966, '4202260', '33.2', '780302', '235.057', '165.1', '21052500', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('18', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 510, 85, '0', '551', '42.213', '16.7892', '18.1973', '191.898', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('19', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 544, 740, '25.6735', '1.0476', '0', '9.43176', '743299', '4933210', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('20', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 129, 83, '652563000', '69.8699', '6198.14', '0', '2857660', '0', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('21', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 246, 301, '2157.4', '235.32', '125.069', '2', '1.1041', '289160', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('22', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 831, 603, '46019000', '821.487', '0', '26693600', '46177.8', '4.885', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('23', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 357, 479, '3', '35540300', '40147.1', '302124', '27296.6', '16823.4', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `t_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('24', '2019-01-01 00:01:00', 'GVIE0010', '0', '0', '0', 336, 155, '3824.7', '22.1631', '0', '161222000', '57879400', '2.55945', '0');
*/
 
 

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


