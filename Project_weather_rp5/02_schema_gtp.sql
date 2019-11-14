/* Описание БД
 * Эта база данных для работы отдела ОРЭМ (оптовый рынок электроэнергии и мощности)
 * Она в себе содержит данные из отчетов инфраструктурных организаций (ценовые и объемные показатели)
 * А также фактические и прогнозные данные из различных метеоисточников, с приборов, принадлежащих 
 * непосредственно самой Организации
 * БД будет обновляться ежедневно, по мере поступления новой информации.
 * Для примера заполнения я взял по 50 строк. В некоторых таблицах меньше, потому что
 * это вся существующая информация, которая может в них содержаться.
 * 
 * В БД нет полей not null - это потому что периодически совершенно в любых колонках могут возникать 
 * значения null.
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
 * logs - логи (тип движка ARCHIVE) - логирование вставки в таблицы report_27, report_28, br
 * 
 * На будущее сделать таблицы:
 * ku
 * fin_rez
 * peni_mounth
 * peni_kontrag
 * */



DROP DATABASE IF EXISTS SQL_project2;
CREATE DATABASE SQL_project2;
USE SQL_project2;

drop function if exists RAND_INT;
CREATE FUNCTION RAND_INT (minVal INT, maxVal INT)
RETURNS INT DETERMINISTIC
RETURN FLOOR(minVal + (RAND() * (maxVal + 1 - minVal)));

-- SHOW PROCEDURE STATUS;
-- SHOW FUNCTION STATUS;

DROP TABLE IF EXISTS gtp;
CREATE TABLE gtp (
	id SERIAL PRIMARY KEY,
	gtps VARCHAR(100) COMMENT 'SVIE0001',  -- ============ заменить на VARCHAR(8)
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)
	gtp VARCHAR(100) COMMENT 'GVIE0001',  -- ============ заменить на VARCHAR(8)
	name_ses VARCHAR(100) COMMENT 'наименование СЭС',
	index id_gtp (id),
	index gtps_gtp (gtps),
	index gtpp_gtp (gtpp),
	index gtp_gtp (gtp),
	index name_ses_gtp (name_ses)
);

insert into gtp (gtps, gtpp, gtp, name_ses)
  values
  ('VIE0001', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '0'), concat('name_ses_',gtps)),
  ('VIE0001', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '1'), concat('name_ses_',gtps)),
  ('VIE0001', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '2'), concat('name_ses_',gtps)),
  ('VIE0001', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '3'), concat('name_ses_',gtps)),
  ('VIE0020', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '0'), concat('name_ses_',gtps)),
  ('VIE0020', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '1'), concat('name_ses_',gtps)),
  ('VIE0500', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '0'), concat('name_ses_',gtps)),
  ('VIE0120', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '0'), concat('name_ses_',gtps)),
  ('VIE0120', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '1'), concat('name_ses_',gtps)),
  ('VIE0150', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '0'), concat('name_ses_',gtps)),
  ('VIE0150', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '1'), concat('name_ses_',gtps)),
  ('VIE0150', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '2'), concat('name_ses_',gtps)),
  ('VIE0150', concat('P', gtps), concat('G', SUBSTR(gtps, 1,6), SUBSTR(gtps, 7,1) + '3'), concat('name_ses_',gtps))
 ;


DROP TABLE IF EXISTS report_27;
CREATE TABLE report_27 (
	id SERIAL PRIMARY KEY,
	-- trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html ======================
	-- trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime -- 1 =====================================
	trading_date DATETIME null, -- DATETIME
	-- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s'), -- 2019-10-13 - дата, 00 - час          -- 1
	-- select STR_TO_DATE('2019-10-13 00', '%Y-%m-%d %H:%i:%s') 
	gtp VARCHAR(100) null COMMENT 'GVIE0001', -- ============ заменить на VARCHAR(8)
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
    -- gtpp VARCHAR(100) null COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)
	index(trading_date),
	index(gtp),
    FOREIGN KEY (gtp) REFERENCES gtp(gtp)
);

INSERT INTO `report_27` VALUES 
('101','2007-06-29 13:49:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1072380','5800','7785150','3','8','8','9','1','8','7','8','0'),
('102','1988-05-23 07:39:43', (select gtp from gtp where id = (select RAND_INT (1, 13))),'57813.8','743309','165358','4','3','6','1','8','8','9','1','3'),
('103','1995-09-22 13:44:38', (select gtp from gtp where id = (select RAND_INT (1, 13))),'7.2084','42989','9185970','4','1','4','2','1','5','2','5','6'),
('104','1971-07-03 09:50:35', (select gtp from gtp where id = (select RAND_INT (1, 13))),'7847','2202','2089','6','7','6','3','6','5','6','1','8'),
('105','1974-08-06 17:21:02', (select gtp from gtp where id = (select RAND_INT (1, 13))),'76.7409','30630','5469','1','1','8','3','8','2','1','5','1'),
('106','2010-01-07 01:40:38', (select gtp from gtp where id = (select RAND_INT (1, 13))),'40177800','132','26','6','2','2','6','9','3','6','0','8'),
('107','1988-03-27 12:44:37', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','685443000','17612','5','4','7','9','6','9','9','1','9'),
('108','1976-12-26 01:34:48', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','34660200','0','6','6','9','1','2','3','8','3','4'),
('109','1990-01-24 08:25:46', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1696200','37','8505340','9','5','9','0','1','5','0','0','5'),
('110','2002-08-28 05:16:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'8167570','2501840','63567900','0','3','3','7','4','8','0','5','5'),
('111','1997-01-06 16:47:35', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1.99837','532235000','81238','9','5','2','9','9','8','2','3','4'),
('112','2006-11-29 07:50:15', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3287950','27','2790140','0','6','8','3','6','4','8','0','8'),
('113','2015-06-16 05:01:31', (select gtp from gtp where id = (select RAND_INT (1, 13))),'32.1299','50334500','7348','4','6','8','6','6','5','5','9','5'),
('114','1992-09-25 02:12:21', (select gtp from gtp where id = (select RAND_INT (1, 13))),'11030.5','890783','32262','3','5','3','8','0','3','6','4','0'),
('115','2006-08-07 01:04:48', (select gtp from gtp where id = (select RAND_INT (1, 13))),'40178.8','0','708452','9','9','7','9','9','9','1','8','0'),
('116','1974-10-20 16:43:32', (select gtp from gtp where id = (select RAND_INT (1, 13))),'343956','8192900','7830060','6','5','5','9','0','0','2','8','5'),
('117','1987-01-27 14:33:50', (select gtp from gtp where id = (select RAND_INT (1, 13))),'8879900','67','374664','7','5','8','0','3','9','6','9','5'),
('118','1986-08-17 11:22:41', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3.40645','694','29962','6','3','0','3','3','6','0','5','9'),
('119','2013-08-19 17:21:27', (select gtp from gtp where id = (select RAND_INT (1, 13))),'34307700','4029','5','4','8','4','9','3','9','1','1','4'),
('120','1992-01-20 06:25:32', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3615','69873500','13718','5','5','5','9','5','3','8','9','0'),
('121','2011-01-10 10:46:25', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','0','62378','1','5','5','5','0','2','9','3','8'),
('122','1993-12-23 12:04:00', (select gtp from gtp where id = (select RAND_INT (1, 13))),'20206000','5928','798618','2','2','1','7','3','3','3','7','9'),
('123','1977-10-29 05:19:47', (select gtp from gtp where id = (select RAND_INT (1, 13))),'19347200','377','8725','2','0','0','0','1','3','5','0','9'),
('124','1985-09-07 09:22:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'65.6175','31871000','0','5','4','9','4','4','0','7','1','1'),
('125','2003-10-27 21:36:24', (select gtp from gtp where id = (select RAND_INT (1, 13))),'12415700','0','0','1','7','8','2','5','0','4','3','6'),
('126','1983-01-24 07:06:33', (select gtp from gtp where id = (select RAND_INT (1, 13))),'61773','34','9598','9','0','6','6','8','8','3','2','3'),
('127','1978-04-07 12:10:31', (select gtp from gtp where id = (select RAND_INT (1, 13))),'4418.56','43545600','40613','5','7','4','9','3','3','6','6','8'),
('128','2018-04-11 03:31:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1988.01','63888500','57131700','2','6','5','8','1','3','2','2','6'),
('129','1994-05-21 16:09:05', (select gtp from gtp where id = (select RAND_INT (1, 13))),'417735','73248','0','3','3','7','9','2','3','2','2','5'),
('130','2013-10-06 00:33:29', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','0','97401','3','1','4','9','8','7','1','1','0'),
('131','1992-09-01 09:34:16', (select gtp from gtp where id = (select RAND_INT (1, 13))),'5674.3','256888000','4582600','5','3','2','8','2','4','9','7','4'),
('132','2009-03-16 13:43:35', (select gtp from gtp where id = (select RAND_INT (1, 13))),'42038200','329','833','4','0','0','0','5','7','6','5','5'),
('133','1978-01-15 17:03:33', (select gtp from gtp where id = (select RAND_INT (1, 13))),'645.674','449103','906','3','3','3','5','1','9','4','8','0'),
('134','1991-05-03 00:42:47', (select gtp from gtp where id = (select RAND_INT (1, 13))),'26.3','2','167272','2','0','2','7','2','5','8','1','5'),
('135','2002-12-31 08:29:39', (select gtp from gtp where id = (select RAND_INT (1, 13))),'6413530','986','98022','7','0','9','1','0','3','1','3','4'),
('136','2018-05-02 18:15:58', (select gtp from gtp where id = (select RAND_INT (1, 13))),'70241','0','29023','1','6','1','4','4','6','9','6','2'),
('137','1993-09-30 14:11:37', (select gtp from gtp where id = (select RAND_INT (1, 13))),'63165000','196252000','3','5','1','8','8','6','6','8','0','1'),
('138','2000-08-15 13:16:49', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','6933','91','0','0','0','4','2','9','9','5','6'),
('139','2002-09-12 06:55:16', (select gtp from gtp where id = (select RAND_INT (1, 13))),'432.222','30401200','39','0','0','5','3','1','1','1','8','2'),
('140','1980-06-27 11:38:06', (select gtp from gtp where id = (select RAND_INT (1, 13))),'70165.5','411692','83727','1','5','7','8','5','4','7','9','2'),
('141','1982-02-12 19:34:33', (select gtp from gtp where id = (select RAND_INT (1, 13))),'14628900','45335','52248','0','0','2','7','1','1','0','2','2'),
('142','2009-07-16 18:59:15', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','0','0','0','5','6','7','2','2','2','8','0'),
('143','2018-11-06 23:49:24', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3366.11','394','707','7','1','5','9','8','8','3','6','8'),
('144','2007-12-16 08:30:06', (select gtp from gtp where id = (select RAND_INT (1, 13))),'2698710','415397000','48','8','6','5','4','3','8','0','4','1'),
('145','1993-05-26 20:12:13', (select gtp from gtp where id = (select RAND_INT (1, 13))),'2475480','44','1','2','4','9','6','2','8','8','8','2'),
('146','2007-09-19 13:21:47', (select gtp from gtp where id = (select RAND_INT (1, 13))),'723535','277559000','799375','7','2','6','5','2','8','2','6','9'),
('147','2016-02-23 13:46:26', (select gtp from gtp where id = (select RAND_INT (1, 13))),'680.31','477','77752','1','2','7','1','8','0','9','4','0'),
('148','1983-07-18 21:03:06', (select gtp from gtp where id = (select RAND_INT (1, 13))),'12289400','529294','22593800','7','1','1','1','6','8','7','4','1'),
('149','1998-01-20 03:30:04', (select gtp from gtp where id = (select RAND_INT (1, 13))),'5678140','450','384623','0','9','6','9','8','8','9','6','5'),
('150','2011-07-25 22:04:58', (select gtp from gtp where id = (select RAND_INT (1, 13))),'2408680','6183','253736','4','3','5','4','2','0','0','3','5'); 

DROP TABLE IF EXISTS report_28;
CREATE TABLE report_28 (
	id SERIAL PRIMARY KEY,
	-- trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html
	-- trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime 
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          -- 1
	-- select STR_TO_DATE('2019-10-13 00', '%Y-%m-%d %H:%i:%s')
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)
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
    FOREIGN KEY (gtpp) REFERENCES gtp(gtpp)
);

INSERT INTO `report_28` VALUES 
('401','2005-03-26 07:09:21', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'925','0','0','4','6','7','4','2'),
('402','2006-08-23 02:40:03', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'128','274.808','4','9','4','8','4','7'),
('403','1988-07-30 21:36:36', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'923','2006.57','7','7','2','3','6','0'),
('404','2017-11-02 17:11:21', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'888','7287.61','6','7','5','6','9','9'),
('405','1987-10-29 16:11:40', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'136','445201000','7','5','1','1','7','7'),
('406','1999-01-29 18:12:06', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'457','185870','5','5','3','8','8','6'),
('407','2012-03-28 01:06:31', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'470','0','3','9','7','7','9','3'),
('408','1989-07-10 03:04:23', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'124','496237000','9','9','8','6','1','4'),
('409','2008-10-21 21:14:05', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'633','36751800','0','0','0','7','8','7'),
('410','1994-12-06 05:22:38', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'40','43.8266','1','4','9','9','9','6'),
('411','1973-04-06 01:01:26', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'873','0','9','9','4','1','1','4'),
('412','1972-04-04 12:03:54', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'621','4715','6','9','2','9','7','3'),
('413','2008-07-08 09:36:42', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'725','1.79391','4','5','3','6','6','5'),
('414','2008-05-18 14:43:13', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'800','6390760','2','4','4','2','5','6'),
('415','1984-07-11 08:58:29', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'972','0','9','1','6','1','5','6'),
('416','1990-08-31 04:02:15', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'691','0','6','2','8','2','7','7'),
('417','2003-09-29 00:44:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'186','2137.88','9','5','1','9','3','3'),
('418','2011-12-08 01:06:28', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'662','4713960','2','6','3','0','4','4'),
('419','1987-07-05 13:06:48', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'728','4.28175','2','9','8','2','4','8'),
('420','1972-10-10 19:32:33', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'655','175843000','4','0','4','4','7','1'),
('421','2003-01-21 09:30:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'37','5127720','0','0','3','5','2','5'),
('422','2010-04-30 15:53:13', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'34','29602600','8','4','0','4','2','3'),
('423','1993-12-15 10:26:25', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'869','194.609','6','2','6','8','8','7'),
('424','1983-06-03 11:18:55', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'354','45','8','3','8','3','4','1'),
('425','2011-05-13 03:19:25', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'976','111396','3','8','3','2','3','7'),
('426','1989-01-01 02:38:23', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'540','0','2','2','0','1','7','5'),
('427','1999-06-15 02:20:03', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'454','57031100','9','1','0','7','6','0'),
('428','1972-04-11 05:27:41', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'892','230.349','2','3','9','7','4','8'),
('429','2019-02-06 06:13:54', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'102','1841350','6','1','7','0','7','7'),
('430','2001-07-19 01:11:46', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'924','0','8','9','2','7','1','8'),
('431','1981-12-09 19:00:43', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'239','0','7','9','5','2','3','9'),
('432','1977-04-11 07:20:35', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'504','14865.1','7','2','1','0','3','8'),
('433','2018-03-30 08:16:30', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'757','2.57322','6','0','2','6','7','5'),
('434','1972-10-30 03:03:11', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'751','17384','3','5','2','6','5','0'),
('435','1977-12-17 00:33:49', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'297','228023','4','3','8','6','5','6'),
('436','2008-03-17 22:01:01', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'961','75','2','2','5','8','2','5'),
('437','1974-07-02 17:57:02', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'782','31490.3','2','3','3','3','6','0'),
('438','2012-09-06 09:16:30', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'345','236.1','6','6','5','6','2','5'),
('439','1980-04-07 00:41:54', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'355','582.524','2','4','9','2','1','1'),
('440','1981-05-30 13:27:39', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'508','0','0','3','6','2','3','7'),
('441','2019-07-17 01:33:49', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'814','76379700','3','1','7','2','7','3'),
('442','1979-11-18 12:20:03', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'253','0','5','5','7','2','9','8'),
('443','2007-10-30 15:01:46', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'956','328.88','8','1','8','6','5','2'),
('444','1987-01-07 18:49:29', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'69','1675170','5','3','1','2','9','9'),
('445','1989-10-11 08:45:33', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'669','396234','5','9','3','4','5','1'),
('446','1992-12-27 14:30:32', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'443','0.164375','8','2','3','0','0','1'),
('447','2016-10-25 08:07:47', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'638','7030880','2','4','5','3','5','8'),
('448','1975-10-10 20:34:54', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'465','1010010','1','4','7','3','8','7'),
('449','1973-09-16 22:03:50', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'287','1769.16','0','5','6','0','9','3'),
('450','1982-10-28 10:43:10', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'468','1595340','4','4','0','7','0','0'); 

DROP TABLE IF EXISTS br;
CREATE TABLE br (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtp VARCHAR(100) COMMENT 'GVIE0001',  -- ============ заменить на VARCHAR(8)
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
    FOREIGN KEY (gtp) REFERENCES gtp(gtp) 
);

INSERT INTO `br` VALUES 
('201','1990-10-28 05:49:17', (select gtp from gtp where id = (select RAND_INT (1, 13))),'206.872','0','5','0','6551400','0','0','6678410','315828','170048','8277190','311984','0','4','2','5','21','0'),
('202','1971-11-12 17:01:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1','1','8','164','115488000','1986','0','648045','332485','6880.49','6824500','580579','26.0683','3','8','8','23417000','67630000'),
('203','1997-12-21 11:29:06', (select gtp from gtp where id = (select RAND_INT (1, 13))),'518603000','6','2','856','982030','991','0','2487370','0','0','656254000','29124700','57.5','9','6','2','94','35'),
('204','2019-07-06 14:34:48', (select gtp from gtp where id = (select RAND_INT (1, 13))),'223040','5','8','8','21774','56817','92771600','8919.72','81145','0','2728.1','1429.95','6996.96','4','4','0','791238000','48234100'),
('205','1998-12-01 07:17:41', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1802.25','6','8','23875900','5645','5','25764.2','7682.3','673487','16865900','1571.27','14034.7','2996700','2','5','8','79563','98058400'),
('206','2010-07-23 17:51:11', (select gtp from gtp where id = (select RAND_INT (1, 13))),'56497000','6','8','4','421','1','47989600','0','27.6026','35442300','2398940','28107.4','4673280','2','7','6','334242','3370'),
('207','1989-03-26 23:53:22', (select gtp from gtp where id = (select RAND_INT (1, 13))),'12550100','0','4','9427','273277','0','0','21480800','77402.9','577667','11610800','145422000','5228930','5','2','2','357382','0'),
('208','1986-01-26 16:11:00', (select gtp from gtp where id = (select RAND_INT (1, 13))),'49.718','9','0','31','799440','735743','71.8325','6674720','334639','47146900','0','16.5965','2485.4','6','6','1','53764400','1016'),
('209','1986-12-15 08:32:13', (select gtp from gtp where id = (select RAND_INT (1, 13))),'72211200','6','1','8370','5104420','753055','169366','935.028','65.6','510525','0','6643.34','60584400','8','5','4','9869450','0'),
('210','1989-06-21 20:40:44', (select gtp from gtp where id = (select RAND_INT (1, 13))),'84.255','6','2','153','92','3','14275300','2898960','0.607557','322547','1564300','3668450','176.172','4','5','8','3065290','408817000'),
('211','1970-09-11 09:58:57', (select gtp from gtp where id = (select RAND_INT (1, 13))),'284101000','9','4','6134','8808500','1117550','271703','25893','6.216','847863','4310.51','15863','50.0268','9','8','1','472792','427235000'),
('212','1970-06-23 11:17:41', (select gtp from gtp where id = (select RAND_INT (1, 13))),'214124000','1','1','673848000','505533000','402175000','22217600','0','1772.49','8.41334','13722.4','6.00225','8.40837','1','0','3','31597','308'),
('213','1995-08-24 06:20:09', (select gtp from gtp where id = (select RAND_INT (1, 13))),'7879.84','6','0','456','408633','10719600','4.56882','442.771','2542.38','385589000','732305','0','422539','2','9','5','5','74'),
('214','1991-04-03 10:08:30', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1011130','7','0','38','0','9319','71.7','2','720577','2.208','0.602191','779451000','1632400','8','1','4','288','0'),
('215','1994-02-13 08:28:58', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3498920','7','3','5','0','521','198665','0','120376000','3606010','12500.6','48862.4','0','1','1','4','2984850','5'),
('216','2011-10-03 16:08:00', (select gtp from gtp where id = (select RAND_INT (1, 13))),'9.2','8','4','1531930','0','0','2146','508524000','0.761','71.9425','35569900','340791','18504.1','2','1','1','899','142022000'),
('217','1972-05-24 18:20:46', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1617700','9','9','1128380','29885','300','115472000','3170050','55141300','0','1.46','669.397','85493600','3','1','6','87','0'),
('218','1998-09-18 10:01:15', (select gtp from gtp where id = (select RAND_INT (1, 13))),'336441','0','8','76936','49177','59014300','403441000','1872.23','21.163','4472.3','3282.31','8.7468','83799400','6','3','6','6236','7684'),
('219','2016-11-23 03:31:17', (select gtp from gtp where id = (select RAND_INT (1, 13))),'2409.76','5','4','44','2585','612','607281','75.489','6917.67','3044120','3427560','21.1019','0','8','1','4','25068400','687'),
('220','2010-07-08 06:28:42', (select gtp from gtp where id = (select RAND_INT (1, 13))),'403610000','8','3','90521','8868850','169311000','1896.64','1','133.455','0','1.009','105093','5.63311','3','2','8','132162','63208'),
('221','2002-08-02 07:19:54', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0.775966','5','6','986712','11','98','11691100','4.14369','23076.8','18048','158','0','37278700','7','9','4','81922100','191'),
('222','1984-11-02 03:18:42', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','2','1','18175100','927','802719000','2833.77','193920000','304101','45114','48863000','60674.4','8842730','7','7','5','70751','0'),
('223','2017-03-07 11:43:34', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','9','1','646920000','311580','125791','245303','2042.1','142.125','325.121','17240.1','65935.7','14086500','9','4','9','838','37'),
('224','1983-06-01 11:24:57', (select gtp from gtp where id = (select RAND_INT (1, 13))),'378','1','9','339239','643111','338637000','399473','19082.7','7783.23','6493940','80.4751','0.1161','2495740','8','6','6','82671000','51'),
('225','1994-06-29 14:27:15', (select gtp from gtp where id = (select RAND_INT (1, 13))),'29.54','3','5','31362','0','716427','0','359439','1800.15','46506.3','2.86055','1','3613.97','7','4','0','91686700','0'),
('226','1973-10-19 11:49:57', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','8','7','30322','2805','0','6','24919900','456958','516.045','8.315','3829570','443009','4','7','0','94363300','607'),
('227','1976-08-11 09:21:26', (select gtp from gtp where id = (select RAND_INT (1, 13))),'134586000','4','5','0','41','78525','4397.76','0','46669.4','116524000','1179.4','13323900','139.439','8','7','2','322203000','904487'),
('228','1998-02-20 07:22:27', (select gtp from gtp where id = (select RAND_INT (1, 13))),'1.99359','9','2','459','27','107813','13168.4','0','1087.86','872629','2.95','19285.8','35.6407','5','3','1','563818','250'),
('229','1981-10-18 18:23:43', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3937.6','6','9','0','4845','72366900','0','306570','31994800','121486000','2743.01','351926000','209.677','6','2','9','1197900','893211000'),
('230','2010-07-09 22:17:13', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','2','4','649207','0','0','3014600','1.28','0','108926000','351029','0','0.553','8','7','5','99884500','4'),
('231','2002-07-23 08:10:54', (select gtp from gtp where id = (select RAND_INT (1, 13))),'713','7','6','2','133643','84437','2157480','0','566842000','2.992','470322000','197419','304852','8','4','1','213075','391333'),
('232','1983-12-29 15:57:12', (select gtp from gtp where id = (select RAND_INT (1, 13))),'25850800','9','2','14871900','90','65438','4','4.4917','32155','0','0','0','35.8067','7','5','7','9','3690270'),
('233','1990-03-18 15:00:27', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3483.39','8','3','63','24063','8','18.189','1791280','473559','75','24.8817','29012900','134427','2','8','7','135507','7542020'),
('234','1979-04-02 08:48:11', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3834.9','8','0','41073400','459','233973000','532715000','9078380','0','209641000','31519.8','346.044','460424','9','1','3','205696000','8453'),
('235','1982-05-06 05:33:56', (select gtp from gtp where id = (select RAND_INT (1, 13))),'659.906','3','0','0','406','92','704185000','358.886','102.135','461760','465.48','3.26','141.915','7','2','6','37875800','39'),
('236','2005-11-04 08:52:30', (select gtp from gtp where id = (select RAND_INT (1, 13))),'67.5217','3','7','52328','9802440','9','6343.4','0','3.6166','493537','2938110','3.4767','1205210','6','0','2','51','6283110'),
('237','1970-10-30 03:17:21', (select gtp from gtp where id = (select RAND_INT (1, 13))),'64888.2','4','5','0','99','193358000','4496710','17.263','2893.33','61.865','3094.13','61920600','43597','2','5','9','0','738'),
('238','1999-11-05 14:57:23', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','7','6','9733','42','27295','334.547','0','29519.9','0','1241350','0','577068000','8','1','6','88180000','745'),
('239','2013-01-02 16:00:53', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','6','7','0','7','21137','468.508','0','209939','286249','173094','24759700','553','3','5','4','52255','3162'),
('240','1978-12-23 04:52:03', (select gtp from gtp where id = (select RAND_INT (1, 13))),'28.4263','2','1','41415400','0','25','3.47341','1.71038','0','3306300','6907.67','3915430','8465.8','3','4','4','29','551544000'),
('241','1994-05-08 02:35:04', (select gtp from gtp where id = (select RAND_INT (1, 13))),'18971.3','1','0','310881','305','5','0','369.4','1068.7','2150.68','8693520','122618','10410800','3','2','6','1','50292'),
('242','1989-10-04 14:04:49', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','3','3','0','51493','3998800','39893000','49636.6','1163910','46023000','13266900','0','32.309','9','7','7','451','71659'),
('243','1975-02-01 12:25:41', (select gtp from gtp where id = (select RAND_INT (1, 13))),'99198','6','9','8689440','0','135','64725900','0.49612','24201.6','75851200','4407','112253','119598','9','7','6','919750000','7903370'),
('244','2017-04-21 13:15:42', (select gtp from gtp where id = (select RAND_INT (1, 13))),'80045500','5','8','5801470','7584890','0','1.22355','3353900','0','0','24.8','5771.22','0','8','3','4','7','8752770'),
('245','1971-04-20 17:17:42', (select gtp from gtp where id = (select RAND_INT (1, 13))),'3733.59','3','0','13','784874','202752000','58.2143','1288','614460000','870.932','3341820','0','129.564','8','9','6','332','87'),
('246','2001-05-11 11:12:03', (select gtp from gtp where id = (select RAND_INT (1, 13))),'35.7797','5','8','846927000','463','86527','5609.39','2443190','2739610','67151.6','3.373','10240','720.697','1','5','7','682807000','30'),
('247','1973-01-21 19:01:50', (select gtp from gtp where id = (select RAND_INT (1, 13))),'129322000','2','7','0','186122000','57580800','27856','4570.81','5522200','443280','1990.2','45651800','6960020','7','9','7','340068000','4'),
('248','2012-08-09 07:24:54', (select gtp from gtp where id = (select RAND_INT (1, 13))),'71606.1','8','4','74503600','0','634012','3.61455','32105600','13.7527','490','431451000','3174.13','60.8633','8','2','0','9','486707'),
('249','1989-12-22 02:57:45', (select gtp from gtp where id = (select RAND_INT (1, 13))),'0','2','5','6133','670151','0','80934','293398','831.733','2611','242.712','432136000','0','4','8','5','157941000','410'),
('250','1981-08-31 03:04:20', (select gtp from gtp where id = (select RAND_INT (1, 13))),'184481','3','9','61','5','34797000','572.976','587015000','4.158','9162290','0','1.8','335.071','5','7','1','0','53120400'); 

DROP TABLE IF EXISTS fact_rp5;
CREATE TABLE fact_rp5 (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)	
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
	index(trading_date),
	index(gtpp),
	index(local_time),
    FOREIGN KEY (gtpp) REFERENCES gtp(gtpp) 
);


DELIMITER //
drop procedure if exists dowhile2_fact_rp5 //
CREATE PROCEDURE dowhile2_fact_rp5()
begin
	set @million = 1;
	WHILE @million < 51 DO
	INSERT INTO `fact_rp5` (id, trading_date, gtpp, local_time, temp,humid, w_dir, w_speed, w_gusts, ww, www, сloudy, vv, td) VALUES 
(
@million, 
FROM_UNIXTIME(RAND() * 2147483647), -- trading_date
(select gtpp from gtp where id = (select RAND_INT (1, 13))), -- gtpp
(select trading_date from br where id = (select RAND_INT (201, 250))), -- случайная даа из табл br - local_time
RAND_INT (0, 9), -- temp
RAND_INT (0, 9), -- humid
RAND_INT (0, 9), -- w_dir
RAND_INT (0, 9), -- w_speed
RAND_INT (0, 9), -- w_gusts
(select LEFT(UUID(), 8)), -- ww
(select LEFT(UUID(), 8)), -- www
RAND_INT (0, 9), -- сloudy
RAND_INT (0, 9), -- vv
RAND_INT (0, 9) -- td
);
	 SET @million = @million + 1;
	END WHILE;
end //
DELIMITER ;

-- select @x;
CALL dowhile2_fact_rp5();


/*INSERT INTO `fact_rp5` VALUES 
('101','0000-00-00 00:00:00'), (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','2','9','3','4','2','Quis rerum velit illo natus expedita doloremque officia.','Corrupti vel vel voluptatem illum sunt sed.',NULL,'3','9'),
('102','1970-06-11 04:56:56', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1971-06-06 18:53:58','5','2','0','7','0','Eum eos reiciendis culpa non voluptas aspernatur.','Quam facere consequatur error officia quas.',NULL,'9','1'),
('103','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1993-10-24 17:32:09','0','6','6','6','8','Reiciendis fuga consequatur quaerat sint reiciendis illo.','Aut natus hic quam aperiam atque et dolor.',NULL,'6','0'),
('104','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','5','3','3','0','8','Consequuntur qui totam minima iste.','Natus corporis tenetur et consectetur.',NULL,'1','4'),
('105','1970-01-16 18:34:07', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','4','8','8','4','4','Nesciunt rerum id labore quae earum nemo.','Similique suscipit nihil vel quia aut debitis ut.',NULL,'5','2'),
('106','1981-05-25 22:55:56', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','5','7','0','4','4','Eaque consectetur labore ut et.','Maiores magni aut delectus.',NULL,'7','2'),
('107','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1998-01-21 07:26:07','5','9','4','5','3','Ratione hic temporibus sed in.','Consectetur in reprehenderit nobis officiis totam.',NULL,'7','8'),
('108','2016-03-21 08:43:20', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1994-12-18 00:25:40','5','7','6','4','8','Soluta distinctio dolor quos quas.','Id consequatur quia modi quisquam enim recusandae dolorem est.',NULL,'5','8'),
('109','2014-03-29 20:57:49', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','4','8','6','3','7','Accusantium dignissimos quis facilis.','Sequi quasi accusantium ut sapiente non soluta.',NULL,'6','0'),
('110','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1982-06-01 08:55:39','5','6','8','2','2','Unde beatae sint id modi quis natus qui.','Saepe vel aspernatur non.',NULL,'0','2'),
('111','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','4','3','5','1','7','Quod a repudiandae et consectetur aut nihil a.','Quia quisquam facere nostrum eos nisi.',NULL,'1','7'),
('112','1984-07-07 05:46:42', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2018-08-15 10:14:53','1','4','6','6','5','Exercitationem quibusdam veritatis veniam ex aperiam nulla laudantium.','Consequatur dolores officiis quaerat dolorem laudantium suscipit.',NULL,'5','5'),
('113','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1974-03-11 09:12:03','1','4','0','9','8','Error optio doloribus iste qui eum nostrum ea.','Esse eum eum qui debitis.',NULL,'6','5'),
('114','2000-08-12 20:23:11', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','7','8','9','9','0','Aut iusto est voluptatem.','Corrupti magnam dolor possimus autem consectetur.',NULL,'2','9'),
('115','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1976-01-10 08:30:39','3','6','4','7','8','Officia aut consequatur natus corporis in deserunt laboriosam.','A dolor suscipit voluptatem magnam aliquid dolore quia.',NULL,'5','0'),
('116','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1998-01-14 23:20:06','5','4','5','1','7','Fugit quia accusantium cumque sint voluptas.','Est dolorem et deleniti et voluptas quae.',NULL,'9','8'),
('117','1973-11-09 21:22:14', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','2','9','1','8','7','Et voluptatem et quae exercitationem.','Ut sed omnis dolor asperiores consequatur quis voluptatum.',NULL,'9','3'),
('118','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2016-06-14 23:20:38','3','9','1','5','2','Excepturi assumenda voluptatem est quod quis sint tempora.','Numquam eius facere consequatur perspiciatis.',NULL,'7','3'),
('119','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','8','2','3','0','7','Est aut reprehenderit magnam quam placeat dolor.','Voluptatem esse rerum nisi fuga voluptatem id.',NULL,'6','9'),
('120','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','6','2','2','9','5','Cupiditate voluptatibus odio aut cupiditate numquam minima enim.','Quo ea ea ut.',NULL,'8','1'),
('121','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2019-08-10 09:26:04','5','7','3','4','5','Unde reprehenderit et minima rerum voluptatem repudiandae.','Dolor omnis delectus aperiam.',NULL,'8','7'),
('122','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1979-12-11 06:45:38','1','7','1','5','3','Accusamus magni laboriosam est et odio.','Odio vero nemo nesciunt voluptatem aut maiores.',NULL,'5','5'),
('123','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','8','9','0','6','5','Suscipit ut ipsum inventore.','Enim necessitatibus ullam officiis distinctio corporis nihil rem.',NULL,'1','2'),
('124','2015-06-23 19:09:32', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','9','5','9','2','6','Dignissimos voluptas quod quia ratione laudantium doloremque.','Molestiae incidunt eaque architecto rerum voluptatibus.',NULL,'4','6'),
('125','2011-12-03 15:08:25', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1996-10-07 00:05:23','0','1','7','1','9','Aperiam repudiandae dolore ut tempora nostrum vel.','Culpa laborum dolor dolorem labore ipsa dicta aliquid.',NULL,'0','4'),
('126','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','6','1','8','9','0','Et omnis non eos qui architecto tempore.','Nostrum et est asperiores aut quae voluptas nobis.',NULL,'5','8'),
('127','2009-06-24 04:56:01', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','7','2','5','4','5','Quisquam dolor nemo at eaque sunt aut.','Molestiae aut similique et asperiores aut voluptatem.',NULL,'5','7'),
('128','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2000-07-15 12:42:42','3','6','7','3','5','Itaque voluptatem esse adipisci quo.','Perspiciatis non quae blanditiis aut et placeat ut quaerat.',NULL,'3','5'),
('129','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1993-01-24 21:36:33','0','8','0','6','8','Alias ea itaque dolor praesentium et sed.','Maxime itaque soluta necessitatibus et.',NULL,'3','7'),
('130','1991-12-09 01:45:53', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','0','6','4','4','2','Nulla rerum itaque cupiditate facere aliquid.','Quo iste sint voluptatem.',NULL,'6','1'),
('131','2012-08-09 18:42:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1977-09-15 15:07:10','5','3','6','5','4','Facere delectus sit quis architecto.','Veritatis consequatur aut qui ullam perferendis est enim rem.',NULL,'4','0'),
('132','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1987-01-13 23:13:28','8','4','8','0','6','Voluptatem est porro possimus architecto.','Voluptas quo modi unde possimus similique expedita alias.',NULL,'3','3'),
('133','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','6','1','5','3','9','Nulla architecto maiores nobis quibusdam.','Ex asperiores nobis quas ad laudantium et in.',NULL,
('134','1975-07-15 00:25:02', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2004-11-26 16:29:02','9','8','7','3','8','Quis rerum ut labore voluptas.','Expedita possimus aut tenetur assumenda.',NULL,'8','9'),
('135','1989-06-14 03:19:28', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','1','1','7','2','3','Fugiat dolor voluptas consequuntur hic voluptatem.','Doloribus id repellat vero porro.',NULL,'7','6'),
('136','1981-09-02 00:30:18', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','1','0','1','3','7','Placeat quidem ab expedita dignissimos.','Inventore nulla deleniti aliquid autem ut quaerat nihil.',NULL,'8','1'),
('137','1971-01-05 13:01:03', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2018-09-29 02:41:23','4','2','5','6','3','Quas et est atque.','Voluptatum rem sed aspernatur qui beatae.',NULL,'8','8'),
('138','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','8','8','9','0','4','Ut libero recusandae deleniti reiciendis provident.','Numquam mollitia voluptatem velit et est assumenda dolorum aliquid.',NULL,'4','3'),
('139','1999-05-03 06:11:17', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2015-06-26 01:15:03','6','6','5','7','0','Unde ipsa eum natus molestiae ipsa nemo dolore.','Iusto veritatis et tempora ut quidem dolor.',NULL,'0','2'),
('140','2003-06-02 18:36:05', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2019-02-18 02:03:52','3','3','6','9','4','Aut error nam sint velit eius omnis eos.','Sed nihil saepe quasi repellendus sint nobis deleniti.',NULL,'6','3'),
('141','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2011-05-23 05:38:01','3','4','6','6','4','Natus mollitia est quia beatae ducimus rerum.','Qui aspernatur quidem rem accusantium.',NULL,'9','9'),
('142','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','0','4','1','0','0','Quo sit facere minus est voluptas dolor ut eligendi.','Fugiat maiores non illum a maxime.',NULL,'9','6'),
('143','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1994-08-28 02:27:05','1','4','7','5','7','Nostrum reprehenderit repellat illo qui.','Quasi magnam sit veritatis.',NULL,'3','1'),
('144','1977-07-06 13:00:10', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1989-05-02 21:32:05','6','9','6','5','7','Odio vero ea ex ut dolorum.','Tenetur tenetur sed sunt quia voluptatem.',NULL,'1','9'),
('145','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','2','0','8','7','6','Enim rem vitae explicabo.','Quia et et provident porro.',NULL,'8','4'),
('146','1997-01-19 21:10:19', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1988-06-07 00:06:04','4','5','3','9','2','Saepe odit explicabo eos numquam quis et.','Ad debitis modi assumenda dolorem.',NULL,'4','7'),
('147','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1996-03-18 11:56:54','9','5','2','9','6','Rerum exercitationem et sunt dolor.','Ut itaque commodi consequatur et ipsum laboriosam ducimus.',NULL,'2','0'),
('148','0000-00-00 00:00:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1992-01-15 03:54:26','7','0','2','4','4','Enim non aut perferendis.','Non voluptatem occaecati explicabo voluptas.',NULL,'7','3'),
('149','2011-05-16 06:37:51', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','9','3','1','8','8','Nostrum alias aut voluptatem distinctio expedita molestiae commodi.','Cupiditate illo et est quae.',NULL,'2','8'),
('150','1995-04-24 16:00:37', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'0000-00-00 00:00:00','1','0','7','2','7','Maiores libero ut consequatur ut sed.','Qui beatae maxime ipsum suscipit quia illo veniam.',NULL,'9','4'); 
*/

DROP TABLE IF EXISTS forecast_rp5;
CREATE TABLE forecast_rp5 (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)	
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
	index(trading_date),
	index(gtpp),
	index(local_time),
    FOREIGN KEY (gtpp) REFERENCES gtp(gtpp)
);

INSERT INTO `forecast_rp5` VALUES 
('1','1997-10-16 10:51:47', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1977-10-24 09:29:37','64286100','2','2','4','Illum ut similique officia omnis laboriosam.','0','Consequuntur accusantium debitis aspernatur.','1','7','9','8','tyrq','7'),
('2','2001-12-05 21:34:08', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1983-01-17 17:53:00','0','6','3','6','Eos ducimus inventore delectus eum qui officiis ea dolorum.','2','Nulla omnis nesciunt perferendis magni nostrum doloribus quo.','1','6','0','7','oqav','0'),
('3','1984-01-04 02:34:00', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1977-10-28 13:07:40','75569200','8','9','5','Provident nihil nulla doloribus dolores maiores accusamus.','4','Id sint maxime exercitationem quae nesciunt.','0','2','4','2','pbep','0'),
('4','1972-11-16 03:57:12', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1992-05-08 18:50:15','395577000','8','8','2','Iste aut expedita eum earum sunt est aspernatur.','6','Eum nam et quia quia magnam officiis.','9','7','7','3','bgkl','8'),
('5','2011-05-20 12:34:05', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2009-12-17 06:38:57','1033.4','9','5','1','Iste sunt cupiditate nam dolore in omnis.','9','Quae in quidem dolorem doloremque molestias sit quidem.','3','6','6','8','ookv','2'),
('6','1970-05-06 04:40:43', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1999-09-07 07:15:16','428.75','1','6','5','Quia et maiores assumenda animi et adipisci ad.','9','Incidunt quae molestiae quia vel.','0','8','9','0','eskr','5'),
('7','2018-12-26 14:45:04', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2016-12-06 07:02:21','34.0767','3','3','2','Quibusdam laborum sequi est.','0','Repellat qui laboriosam in cum consequatur voluptatem consequatur.','4','1','6','1','deob','0'),
('8','1977-08-20 12:41:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2007-08-30 12:55:11','4911','5','2','2','Nihil voluptatem in ut aperiam ducimus similique dolorem facilis.','3','Ullam dolor praesentium repudiandae perferendis vitae ut modi optio.','7','7','0','6','ddsx','3'),
('9','2000-05-15 16:30:08', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1985-11-29 04:16:30','142393000','4','9','3','Et ad et ipsum fuga soluta repellat.','1','Architecto iure esse voluptas quos nemo eius et.','3','7','3','3','xtjb','0'),
('10','1999-10-31 04:41:40', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2015-07-10 10:47:12','2.29996','9','5','0','Qui ut aut esse magni quisquam et.','8','Enim consequatur fuga sint architecto non quis.','4','1','9','4','asgr','6'),
('11','2007-09-14 11:49:38', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2003-04-16 19:10:52','4737.04','1','2','1','Ipsam beatae sunt dolorum rerum ab inventore rerum.','6','Reprehenderit ratione voluptatem consequuntur et.','3','3','5','8','lhan','0'),
('12','1971-07-10 13:36:01', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1982-02-14 12:48:58','570.89','2','5','2','Asperiores a impedit laborum.','2','Aut molestias aut quo corporis unde.','7','1','6','5','fdbk','6'),
('13','1973-06-16 23:27:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1989-08-10 05:11:40','1.55017','4','7','0','Et quia dignissimos quasi molestiae sit aliquam.','8','Et voluptates tempore saepe sunt laboriosam id nihil.','5','4','0','3','rxhd','8'),
('14','1991-08-23 19:57:46', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2004-09-17 13:07:46','320.815','7','8','9','Incidunt temporibus et maiores beatae sunt tenetur dolor.','1','Deleniti dicta eaque sit reiciendis quia in ipsam.','6','7','6','0','fzvq','4'),
('15','1995-10-20 07:54:23', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1979-09-24 22:03:36','59756400','8','3','7','Ipsum sit aliquid at est ad iste.','8','Minima quam aut aliquam quia quo.','0','0','1','6','sdve','6'),
('16','1992-04-24 14:50:47', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2000-02-25 02:24:48','45.5774','1','3','5','Voluptas voluptas repudiandae mollitia similique eos.','2','Aut rerum voluptatem dolor aut.','2','5','8','7','tkcq','8'),
('17','2011-04-08 05:35:03', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2015-10-06 02:06:58','185551','9','5','5','Tempora facilis unde voluptates explicabo eaque error.','5','Voluptatem debitis rerum labore quasi ducimus.','0','0','2','3','ueey','1'),
('18','1988-03-09 22:18:34', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1994-03-22 11:20:06','763.529','0','3','5','Unde tempore ipsa quidem dolores.','9','Ut et dolore tempora rem officiis commodi magni.','4','9','4','7','megj','7'),
('19','2000-06-03 06:11:16', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1972-05-12 13:14:53','62.63','5','4','0','Totam sint ea ad temporibus eligendi optio rem.','8','Placeat occaecati iure dolor dolor.','5','9','4','4','crqn','2'),
('20','2016-09-18 13:10:15', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1987-03-08 06:10:32','97.5293','1','6','6','Eius inventore labore doloremque a et.','6','Et impedit quaerat fuga quia.','9','9','0','1','vsnn','2'),
('21','1988-03-28 17:28:04', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1981-05-23 18:15:22','113637','5','9','4','Reprehenderit sunt vel eum aut dolorem qui quos rem.','6','Laboriosam est aut aut quia autem voluptatum.','8','6','8','7','tqvm','2'),
('22','2015-01-22 14:17:20', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2016-09-08 14:39:11','3670.09','8','5','3','Vitae voluptatem dolore nostrum nesciunt.','1','Quod quibusdam dignissimos sequi vero aspernatur tempora.','0','9','0','4','ersx','7'),
('23','1975-07-31 13:12:19', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2014-08-19 16:52:36','7615.46','4','8','4','Animi voluptates quisquam molestiae modi.','8','Molestiae nam error et autem voluptatem.','6','2','7','4','tiys','2'),
('24','1975-04-28 01:03:40', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1975-07-21 21:52:40','1963.7','7','3','7','Quam non similique quos doloremque tempore sed consequatur.','5','In reiciendis non non pariatur quia ut aut illum.','6','9','0','6','qymn','6'),
('25','1970-02-14 00:54:08', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1985-01-14 04:48:17','13629300','4','6','8','Facere harum unde corrupti temporibus repellat recusandae et.','8','Esse dolor quos rerum et itaque.','2','8','9','2','nhpq','3'),
('26','2011-04-03 02:41:23', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2017-08-19 10:18:49','0','1','3','6','Minus quia animi aut consequatur amet.','0','Dolores eos aut in et id porro.','0','8','7','2','ucjv','2'),
('27','1982-02-17 18:58:55', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1979-05-28 08:05:38','1477.19','6','8','4','Repellendus dignissimos facilis assumenda error id.','6','Architecto laboriosam hic voluptatem totam vero in esse.','6','1','4','3','ofny','3'),
('28','1976-04-03 17:25:29', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1978-01-20 20:57:08','156296','7','6','0','Libero dolorem aut debitis.','3','Quia voluptatem recusandae occaecati aut eveniet beatae perspiciatis.','8','0','1','6','riyx','3'),
('29','1976-05-25 05:48:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1999-07-09 16:01:08','80.581','1','3','6','Et placeat eum est cupiditate et.','6','Nihil et officiis quia maxime perspiciatis accusantium nulla.','3','8','3','9','zluq','3'),
('30','1998-08-14 11:24:48', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1970-04-28 16:02:09','0.943203','3','5','5','Rerum ipsum repellendus repellat dolor ab.','0','Rerum animi dolorem at dolore perferendis eveniet aliquam.','0','1','3','0','lnle','3'),
('31','1990-12-11 22:21:48', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1987-04-02 14:42:43','225577000','8','3','0','Numquam aliquid repellat velit.','5','Sint sit recusandae laborum.','4','3','0','4','svjr','9'),
('32','1990-11-30 15:47:02', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1988-09-25 09:52:51','6.241','5','0','6','Natus necessitatibus voluptatibus et itaque architecto facilis.','4','Et accusamus exercitationem iste repudiandae consequatur odit.','6','0','0','7','plds','8'),
('33','2007-02-07 12:41:07', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2000-05-09 13:57:44','1688','3','1','7','Tempora dolores aut a voluptatem iste nihil corporis.','7','Sunt aut quis tempore voluptas cum quaerat.','4','7','9','2','eeoo','7'),
('34','1993-10-11 08:46:55', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2010-11-17 07:01:55','105945','6','3','5','Consequatur molestiae aperiam autem molestiae alias dignissimos.','0','Optio expedita quasi quae ut placeat earum.','7','2','0','2','rynb','1'),
('35','1995-05-15 19:04:21', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1974-11-13 03:57:15','0','7','5','7','Qui aut sunt delectus ut deleniti omnis earum alias.','5','Nam quis exercitationem aut.','1','3','3','1','gmvy','8'),
('36','2012-07-21 02:09:40', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2015-07-14 04:46:01','0','9','4','6','Id minus nihil ipsum velit doloremque cupiditate.','9','Similique provident ut esse maxime rerum.','7','2','1','8','tgpy','5'),
('37','1971-02-08 10:09:20', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2000-12-11 22:19:11','617241','7','8','4','Sequi laboriosam ut vel sunt.','7','Praesentium illum et velit aliquid culpa.','1','3','1','8','ryfr','2'),
('38','2002-12-23 19:01:33', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1996-03-07 01:55:57','405349000','3','9','4','Nam eveniet odit animi maxime illum.','6','In commodi velit nobis dolorem suscipit quam.','7','5','1','7','jxwe','3'),
('39','1994-04-19 02:21:17', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2015-08-20 03:35:33','20.8245','2','0','8','Enim sunt velit aspernatur commodi voluptatem.','8','Vero quod ex odio ad aut dolorum aperiam.','1','6','8','2','rtsh','2'),
('40','1989-11-08 11:53:06', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2014-11-22 07:57:58','5921','4','8','5','Totam natus inventore eos ut ipsam rem.','2','Sed iste ea similique non vel nihil.','3','6','7','6','wlbn','7'),
('41','1975-03-18 11:39:34', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1984-06-01 01:40:22','2.6884','8','8','9','Nihil et est non cupiditate.','7','Provident qui quod nemo aliquid soluta.','5','9','8','9','hdnf','5'),
('42','1977-06-06 19:07:24', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1973-06-28 09:04:31','156.62','5','6','2','Nisi sapiente debitis debitis maxime voluptatem ipsa ut.','9','Et quia et sed labore cum et non.','3','4','8','5','gkwb','4'),
('43','1977-01-27 02:31:53', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2017-06-09 20:55:12','0','1','6','9','Excepturi dicta voluptatem voluptatem nobis voluptas ea.','5','Ipsum eum non quibusdam.','5','7','4','6','ecys','9'),
('44','1979-12-29 13:20:39', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1993-03-09 03:35:01','22917.8','8','7','1','Voluptatum quas autem vel amet.','3','Maiores sit autem beatae adipisci incidunt.','2','6','2','8','qbrd','7'),
('45','1993-11-06 18:54:08', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2004-09-08 03:13:01','444.603','1','0','0','Et quisquam necessitatibus quos.','3','Nemo quis quis vero et est.','0','1','7','0','rixe','4'),
('46','2012-09-04 22:41:51', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1974-04-15 22:07:37','51.5764','2','5','7','Ipsum ut nostrum qui earum vel libero.','4','Quidem accusamus sit inventore.','4','5','8','5','nhqu','4'),
('47','1972-09-26 14:43:21', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2006-01-09 16:57:00','41255.4','8','5','1','Quidem velit magnam sunt.','5','Sed voluptatem voluptatem in aut est molestias.','6','5','6','6','aepr','8'),
('48','1971-04-09 06:02:02', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'2010-12-06 16:58:16','67.5819','7','5','4','Rerum natus non autem alias quibusdam nesciunt quia quia.','4','Officiis nihil incidunt voluptatem neque eveniet nam et.','8','3','9','6','crhz','0'),
('49','2001-05-31 11:38:55', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1988-04-06 20:36:29','0','9','5','7','Quia molestiae ea nihil et tempora incidunt.','8','Facilis officiis aut aliquid soluta sit quae.','5','6','7','9','dcsq','0'),
('50','1994-09-03 22:22:29', (select gtpp from gtp where id = (select RAND_INT (1, 13))),'1973-07-10 22:55:03','54.3635','0','9','3','Repudiandae explicabo vel nam et hic qui consequuntur.','7','Libero sed temporibus natus recusandae magnam nihil.','3','1','2','8','zeql','9'); 


DROP TABLE IF EXISTS links_obj_insol;
CREATE TABLE links_obj_insol ( 
	id SERIAL PRIMARY KEY,
	id_param FLOAT unsigned  COMMENT 'ID параметра на сайте Grafanya',
	name VARCHAR(50)  COMMENT 'наименование значения',
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)
	-- value DOUBLE COMMENT 'само значение', -- не нужно, так как в табл нет значений, табл справочная
	name_ses VARCHAR(100) COMMENT 'наименование СЭС', --  =============== надо будет удалить и обращаться к полю через???? или не надо удалять? 
	index(id_param),
	index(name),
	index(gtpp),
	index(name_ses), --  =============== надо будет удалить и обращаться к полю через???? или не надо удалять?
	FOREIGN KEY (gtpp) REFERENCES gtp(gtpp),
	FOREIGN KEY (name_ses) REFERENCES gtp(name_ses) --  =============== надо будет удалить и обращаться к полю через???? или не надо удалять?
);

DELIMITER //
drop procedure if exists dowhile_links_obj_insol //
CREATE PROCEDURE dowhile_links_obj_insol()
begin
	set @million = 1;
	WHILE @million < 40 DO
	
	INSERT INTO `links_obj_insol` (id_param,name,gtpp,name_ses) VALUES ( 
@million, (select LEFT(UUID(), 8)), 
(select @x := (select gtpp from gtp where id = (select RAND_INT (1, 13)))),
(select name_ses from gtp where gtpp = @x limit 1)
);

	 SET @million = @million + 1;
	END WHILE;
end //
DELIMITER ;

-- select @x;
CALL dowhile_links_obj_insol();

/*INSERT INTO `links_obj_insol` VALUES 
('235','37965','quam', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('236','1458560','tempora', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('237','99','eum', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('238','769462000','ipsa', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('239','348413','omnis', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('240','37559200','vel', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('241','31973300','neque', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('242','11','ipsa', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('243','0','atque', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('244','38','cum', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('245','5790080','quia', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('246','93','soluta', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('247','5540880','necessitatibus', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('248','5','dignissimos', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('249','86037','et', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('250','7105320','pariatur', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('251','82122','nam', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('252','83396500','maiores', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('253','318241','voluptatum', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('254','799135000','voluptatem', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('255','715','harum', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('256','66344','excepturi', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('257','2','necessitatibus', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('258','76','recusandae', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('259','5826010','velit', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('260','53668800','distinctio', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('261','9420240','et', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('262','3','ipsum', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('263','55973','neque', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('264','222','soluta', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('265','33594','officia', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('266','168','ad', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('267','39513200','amet', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('268','602916000','sequi', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('269','368','inventore', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('270','28','molestiae', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('271','64707100','asperiores', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('272','997616','et', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL),
('273','5676','ab', (select gtpp from gtp where id = (select RAND_INT (1, 13))),NULL); */

DROP TABLE IF EXISTS insol;
CREATE TABLE insol (
	id SERIAL PRIMARY KEY,
	trading_date DATETIME null, -- STR_TO_DATE('2019-10-13 00', '%d.%m.%Y %H:%i:%s') -- 2019-10-13 - дата, 00 - час          
		gtpp VARCHAR(100) COMMENT 'PVIE0001',  --  =============== надо будет удалить и обращаться к полю через links_obj_insol
	id_param FLOAT unsigned  COMMENT 'ID параметра на сайте Grafanya',
		name VARCHAR(50)  COMMENT 'наименование значения', --  =============== надо будет удалить и обращаться к полю через links_obj_insol
	value DOUBLE COMMENT 'само значение',
	index(trading_date),
	index(gtpp),
	index(name),
	index(id_param),
    FOREIGN KEY (gtpp) REFERENCES gtp(gtpp),
    FOREIGN KEY (id_param) REFERENCES links_obj_insol(id_param),
    FOREIGN KEY (gtpp) REFERENCES links_obj_insol(gtpp), --  =============== надо будет удалить и обращаться к полю через links_obj_insol
    FOREIGN KEY (name) REFERENCES links_obj_insol(name_ses) --  =============== Показал для сложности процедуры ниже удалю в будущем
);

DELIMITER //
drop procedure if exists dowhile_insol //
CREATE PROCEDURE dowhile_insol()
begin
	set @million = 1;
	WHILE @million < 51 DO
	
	INSERT INTO `insol` (id,trading_date,gtpp,id_param,name,value) VALUES ( 
@million, -- id
(select trading_date from br where id = (select RAND_INT (201, 250))), -- случайная даа из табл br - local_time
(select @x_gtp := (select gtpp from gtp where id = (select RAND_INT (1, 13)))), -- gtpp
(select @x_id := (select id_param from links_obj_insol where gtpp = @x_gtp ORDER BY RAND() limit 1)), -- id_param из выборки берется по случайному id
(select name_ses from links_obj_insol where gtpp = @x_gtp limit 1), -- name - сторого соответсвует id_param и gtpp
(select RAND_INT (1, 1000)) -- value
);
	 SET @million = @million + 1;
	END WHILE;
end //
DELIMITER ;

CALL dowhile_insol();

/*INSERT INTO `insol` VALUES 
('401',NULL,NULL,NULL,NULL,'136050023.18384'),
('402',NULL,NULL,NULL,NULL,'0.0145186'),
('403',NULL,NULL,NULL,NULL,'153374.03678'),
('404',NULL,NULL,NULL,NULL,'309690'),
('405',NULL,NULL,NULL,NULL,'49275176.23'),
('406',NULL,NULL,NULL,NULL,'355203060.319'),
('407',NULL,NULL,NULL,NULL,'91.7982'),
('408',NULL,NULL,NULL,NULL,'36812930.009'),
('409',NULL,NULL,NULL,NULL,'2758828.53'),
('410',NULL,NULL,NULL,NULL,'390645.3279671'),
('411',NULL,NULL,NULL,NULL,'393950.933217'),
('412',NULL,NULL,NULL,NULL,'0'),
('413',NULL,NULL,NULL,NULL,'2891.8540578'),
('414',NULL,NULL,NULL,NULL,'5307.10257054'),
('415',NULL,NULL,NULL,NULL,'0'),
('416',NULL,NULL,NULL,NULL,'744.989'),
('417',NULL,NULL,NULL,NULL,'599414.98585976'),
('418',NULL,NULL,NULL,NULL,'0.60628'),
('419',NULL,NULL,NULL,NULL,'2659.6074'),
('420',NULL,NULL,NULL,NULL,'0.86294'),
('421',NULL,NULL,NULL,NULL,'0'),
('422',NULL,NULL,NULL,NULL,'39371808.8'),
('423',NULL,NULL,NULL,NULL,'4175681.02'),
('424',NULL,NULL,NULL,NULL,'377841263.53127'),
('425',NULL,NULL,NULL,NULL,'17175.979264'),
('426',NULL,NULL,NULL,NULL,'360159.4459804'),
('427',NULL,NULL,NULL,NULL,'0'),
('428',NULL,NULL,NULL,NULL,'58326.115841839'),
('429',NULL,NULL,NULL,NULL,'3366.6933'),
('430',NULL,NULL,NULL,NULL,'927986'),
('431',NULL,NULL,NULL,NULL,'0'),
('432',NULL,NULL,NULL,NULL,'82240.73'),
('433',NULL,NULL,NULL,NULL,'0.087'),
('434',NULL,NULL,NULL,NULL,'17654329.132488'),
('435',NULL,NULL,NULL,NULL,'20672'),
('436',NULL,NULL,NULL,NULL,'1870037.3742'),
('437',NULL,NULL,NULL,NULL,'6611.12275799'),
('438',NULL,NULL,NULL,NULL,'5.66659'),
('439',NULL,NULL,NULL,NULL,'4051445.25'),
('440',NULL,NULL,NULL,NULL,'0'),
('441',NULL,NULL,NULL,NULL,'1959.721969352'),
('442',NULL,NULL,NULL,NULL,'4.96958'),
('443',NULL,NULL,NULL,NULL,'4465.5157'),
('444',NULL,NULL,NULL,NULL,'3044311.8186713'),
('445',NULL,NULL,NULL,NULL,'20148.98844'),
('446',NULL,NULL,NULL,NULL,'6.87574'),
('447',NULL,NULL,NULL,NULL,'25.328469'),
('448',NULL,NULL,NULL,NULL,'59216.06'),
('449',NULL,NULL,NULL,NULL,'408943206.7'),
('450',NULL,NULL,NULL,NULL,'267254661.628'); */

DROP TABLE IF EXISTS links_meteo_lok;
CREATE TABLE links_meteo_lok (
	gtpp VARCHAR(100) COMMENT 'PVIE0001',  -- ============ заменить на VARCHAR(8)
	link VARCHAR(1000) COMMENT 'ссылка на страницу с прогнозом погоды',
	link_fact VARCHAR(1000) COMMENT 'ссылка на страницу с ФАКТОМ погоды',
	name_ses VARCHAR(100) COMMENT 'наименование СЭС', --  =============== надо будет удалить и обращаться к полю через links_obj_insol
	index(gtpp),
	index(name_ses),
    FOREIGN KEY (gtpp) REFERENCES gtp(gtpp),
    FOREIGN KEY (name_ses) REFERENCES gtp(name_ses) -- эту колонку не надо удалять, так как таблица будет менее 100 строк, для удобства оставить!
);

INSERT INTO `links_meteo_lok` VALUES 
((select @lok := (select gtpp from gtp where id = 1)),'http://hayes.org/','http://buckridge.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://connelly.com/','http://www.fay.biz/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://vandervort.org/','http://www.wiegandkiehn.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://considine.info/','http://hand.biz/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://whiteswift.com/','http://www.sporer.net/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://www.pollichlesch.com/','http://www.conroy.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://king.info/','http://www.douglasgrant.net/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://kerlukeskiles.net/','http://www.lynch.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://skilestoy.com/','http://mante.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://www.moorerogahn.info/','http://turner.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://www.lemke.biz/','http://bechtelarhagenes.com/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://miller.com/','http://www.mills.net/',(select name_ses from gtp where gtpp = @lok limit 1)),
((select @lok := (select gtpp from gtp where id = 1)),'http://www.jerdeorn.com/','http://www.windler.com/',(select name_ses from gtp where gtpp = @lok limit 1))
; 

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	log_time DATETIME not null COMMENT 'время создания лога',
	log_txt VARCHAR(1000) not null COMMENT 'текст лога',
	status VARCHAR(50) not null COMMENT 'статус лога - ошибка, примечание и пр.'
	-- индексы нужны ли индексы? размер лога может быть очень большим, но пользоваться им будут крайне редко (только при наличии ошибок)
	-- index(log_time),
	-- index(status)
) ENGINE=ARCHIVE;

DROP trigger IF EXISTS insert_report_27;
DROP trigger IF EXISTS insert_report_28;
DROP trigger IF EXISTS insert_br;
DELIMITER //
create trigger insert_report_27 after insert on report_27
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'products', (select id from products order by id desc limit 1), (select name from products order by id desc limit 1));
end //

create trigger insert_report_28 after insert on report_28
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'users', (select id from users order by id desc limit 1), (select name from users order by id desc limit 1));
end //

create trigger insert_br after insert on insert_br
for each row
begin
	insert into logs (time_add, table_name, key_id, name_from_table) values 
	(now(), 'catalogs', (select id from catalogs order by id desc limit 1), (select name from catalogs order by id desc limit 1));
end //
DELIMITER ;

SHOW TRIGGERS;

/*INSERT INTO `logs` VALUES ('1','Ea nihil consequuntur sint fugit.','Perspiciatis et rerum qui rerum dolores iste repel'),
('2','Eum expedita cupiditate voluptatem corrupti repudiandae voluptatibus.','Numquam temporibus quis possimus dolores aliquam a'),
('3','Laborum sunt et architecto quasi.','Quisquam placeat quidem ullam quia facilis quia. C'),
('4','Velit placeat culpa dicta et distinctio.','Voluptates sed dolore accusamus dolorem placeat. M'),
('5','Similique magnam id et.','Iure quae non minima rem autem veniam quasi aut. B'),
('6','Corrupti hic quo provident et consequuntur quod animi.','Itaque maiores accusantium temporibus omnis sit. Q'),
('7','Voluptatibus quod illum eum nemo laboriosam eum.','Et dolor quo amet eligendi voluptatem impedit. Sed'),
('8','Optio ut nemo perferendis repellat.','Unde impedit nobis deleniti doloribus voluptatem f'),
('9','Ea temporibus aperiam et adipisci voluptatibus recusandae et.','Voluptas ullam quidem aperiam. Aut saepe quam veni'),
('10','Illum consequuntur aliquid nihil numquam quis.','In consequatur earum error architecto sit. Aut iur'); */




/* -- Загрузка информации из CSV - реализовать позднее
SHOW VARIABLES LIKE "secure_file_priv"; -- установил в файле my.ini пустое значение!

SHOW VARIABLES

LOAD DATA INFILE 'csv_to_logs.csv' 
INTO TABLE report_27
CHARACTER SET cp1251
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- '\n'
IGNORE 1 ROWS;
*/

/*
LOAD DATA INFILE 'csv_to_logs.csv' 
INTO TABLE logs
CHARACTER SET cp1251
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- '\n'
IGNORE 1 ROWS;

  
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
 * В ТАБЛИЦЕ НУЖЕН ОТДЕЛЬНЫЙ СПИСОК ГТПП!!! ИЛИ РЕШИТЬ КАК ПОЛУЧАТЬ УНИКАЛЬНЫЕ ГТПП!!!!========================================================
 * */

-- SELECT FLOOR(1 + (RAND() * 13));
