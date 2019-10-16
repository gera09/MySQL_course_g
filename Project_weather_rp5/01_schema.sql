/* Описание БД
 * 
 * 
 * 
 * 
 */

DROP DATABASE IF EXISTS SQL_project;
CREATE DATABASE SQL_project;
USE SQL_project;

DROP TABLE IF EXISTS report_27;
CREATE TABLE report_27 (
	id SERIAL PRIMARY KEY,
	trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html
	trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime -- 1
	gtp VARCHAR(8) COMMENT 'GVIE0001',
	
	-- stair DOUBLE COMMENT 'Заявка субъекта - Ступень', -- пустая колонка												 -- 2
	-- p_stair DOUBLE COMMENT 'Заявка субъекта - Цена руб/(МВт*час)', -- пустая колонка								 -- 3
	v_bid_so DOUBLE UNSIGNED COMMENT 'Заявка субъекта - Количество МВт*час.',											 -- 4
	
	-- ограничения
	t_min DOUBLE UNSIGNED COMMENT 'технический минимум',																	-- 5
	-- t_min_tehnolog FLOAT COMMENT 'технический минимум' -- повторяющаяся колонка,										-- 6
	-- Рмин (СО)  МВт -- пустая колонка																					-- 7
	t_max DOUBLE UNSIGNED COMMENT 'Рмакс** МВт из колонки 8',															-- 8
	change_load_down SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - снижения',				-- 9
	change_load_up SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - повышения',			-- 10
	
	-- v_rd -- у нас нет РД -- пустая колонка																			-- 11
	trade_graph DOUBLE UNSIGNED COMMENT 'Объем Торгового графика МВт*час',												-- 12
	p_unreg DOUBLE UNSIGNED COMMENT 'Средневзвешенная цена на продажу (по принятым поузловым объемам) руб/(МВт*час)',	-- 13
	v_sell_rsv DOUBLE UNSIGNED COMMENT 'Продажа в РСВ - Объем продажи МВт*час',											-- 14
	p_sell_rsv DOUBLE UNSIGNED COMMENT 'Продажа в РСВ - Цена руб/(МВт*час)',												-- 15
	
	-- v_buy_rsv DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение РД - Объем покупки МВт*час',								-- 16
	-- p_buy_rsv DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение РД - Цена руб/(МВт*час)',									-- 17
	
	v_buy_sdd DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Объем покупки МВт*час',						-- 18
	p_buy_sdd DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 19
	-- v_sell_sdd DOUBLE UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Объем продажи МВт*час',						-- 20
	-- p_sell_sdd DOUBLE UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 21
	
	-- korr_stair UNSIGNED COMMENT 'Скорректированная заявка субъекта - Ступень'										-- 22
    -- korr_p UNSIGNED COMMENT 'Скорректированная заявка субъекта - Цена руб/(МВт*час)' 								-- 23
    korr_v DOUBLE UNSIGNED COMMENT 'Скорректированная заявка субъекта - Количество МВт*час' 								-- 24
	
	
	
    
    -- сделать инфексирование
    -- INDEX users_phone_idx(phone), -- как выбирать индексы?
    -- INDEX users_firstname_lastname_idx(firstname, lastname)
    
    -- прописать ключи
    -- FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS report_28;
CREATE TABLE report_28 (
	id SERIAL PRIMARY KEY,
	trading_date DATE COMMENT 'Дата, пример в отчете (2019-10-13)', -- STR_TO_DATE() --https://incode.pro/mysql/rabota-s-datami-v-mysql.html
	trading_hour TINYINT COMMENT 'Торговый час (00 или 23), пример в отчете (01-02)',	-- объединить с датой в datetime -- 1
	gtp VARCHAR(8) COMMENT 'GVIE0001',
	
	-- stair DOUBLE COMMENT 'Заявка субъекта - Ступень', -- пустая колонка												 -- 2
	-- p_stair DOUBLE COMMENT 'Заявка субъекта - Цена руб/(МВт*час)', -- пустая колонка								 	 -- 3
	-- v_bid_so DOUBLE UNSIGNED COMMENT 'Заявка субъекта - Заявленный объем в АТС МВт*час',								 -- 4
	-- v_bid_so_korr DOUBLE UNSIGNED COMMENT 'Заявка субъекта - Скорректированный АТС объем заявки МВт*час',			 -- 5
	
	-- v_losses_load_prog DOUBLE COMMENT 'Объем прогнозных нагрузочных потерь в сетях, включенных в данную ГТП, МВт*час' -- 6
	
	/*ОСТАНОВИЛСЯ ТУТ1111111111111!!!!!!!!!!!!!!!!!!!!!!!!*/
	
	
	
	
	
	
	
	
	-- Рмин (СО)  МВт -- пустая колонка																					-- 7
	t_max DOUBLE UNSIGNED COMMENT 'Рмакс** МВт из колонки 8',															-- 8
	change_load_down SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - снижения',				-- 9
	change_load_up SMALLINT UNSIGNED COMMENT 'предел часового изменения нагрузки генератором - повышения',			-- 10
	
	-- v_rd -- у нас нет РД -- пустая колонка																			-- 11
	trade_graph DOUBLE UNSIGNED COMMENT 'Объем Торгового графика МВт*час',												-- 12
	p_unreg DOUBLE UNSIGNED COMMENT 'Средневзвешенная цена на продажу (по принятым поузловым объемам) руб/(МВт*час)',	-- 13
	v_sell_rsv DOUBLE UNSIGNED COMMENT 'Продажа в РСВ - Объем продажи МВт*час',											-- 14
	p_sell_rsv DOUBLE UNSIGNED COMMENT 'Продажа в РСВ - Цена руб/(МВт*час)',												-- 15
	
	-- v_buy_rsv DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение РД - Объем покупки МВт*час',								-- 16
	-- p_buy_rsv DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение РД - Цена руб/(МВт*час)',									-- 17
	
	v_buy_sdd DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Объем покупки МВт*час',						-- 18
	p_buy_sdd DOUBLE UNSIGNED COMMENT 'Покупка в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 19
	-- v_sell_sdd DOUBLE UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Объем продажи МВт*час',						-- 20
	-- p_sell_sdd DOUBLE UNSIGNED COMMENT 'Продажа в обеспечение СДД (СДЭМ) - Цена руб/(МВт*час)',							-- 21
	
	-- korr_stair UNSIGNED COMMENT 'Скорректированная заявка субъекта - Ступень'										-- 22
    -- korr_p UNSIGNED COMMENT 'Скорректированная заявка субъекта - Цена руб/(МВт*час)' 								-- 23
    korr_v DOUBLE UNSIGNED COMMENT 'Скорректированная заявка субъекта - Количество МВт*час' 								-- 24
	
	
	
    
    -- сделать инфексирование
    -- INDEX users_phone_idx(phone), -- как выбирать индексы?
    -- INDEX users_firstname_lastname_idx(firstname, lastname)
    
    -- прописать ключи
    -- FOREIGN KEY (to_user_id) REFERENCES users(id)
);

