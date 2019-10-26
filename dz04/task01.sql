use vk;

/* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
 * 
 который больше всех общался с нашим пользователем. */

-- ПРЕДИСЛОВИЕ: на решение этого упражнения я потратил около 8 часов и 15 кг нервов, поэтому дико хочется знать лаконичное и верное решение. 
-- Спасибо за понимание!!!

-- найдем id пользователя по количеству написанных собщений юзеру с id=27:
Select from_user_id, to_user_id, count(*) as countX from messages  where (to_user_id = 27 )  group by from_user_id ORDER by countX desc limit 1; -- id = 3

-- решение для сообщений в одну сторону:
select id, firstname, lastname from users where id = (
Select from_user_id from messages  where (to_user_id = 27 )  group by from_user_id ORDER by count(from_user_id) desc limit 1); -- id = 3

Select from_user_id, count(from_user_id) from messages  where (to_user_id = 27 )  group by from_user_id ORDER by count(from_user_id) desc limit 1

-- сообщения в обратную сторону
Select from_user_id, to_user_id, count(*) as countX from messages  where (to_user_id = 27 or from_user_id = 27 )  
group by to_user_id ORDER by count(from_user_id) desc limit 10;



-- в обе стороны
Select from_user_id, to_user_id, count(*) as countX,  from messages  where (to_user_id = 27 or from_user_id = 27)  
group by from_user_id, to_user_id ORDER by countX desc limit 500;


-- жалкая попытка объединить
select 
 if fromX.from_user_id=toX.to_user_id then (Select from_user_id, to_user_id, count(*) as countX from messages  
 where (to_user_id = 27 )  group by from_user_id ORDER by countX desc limit 10) as fromX +
(Select from_user_id, to_user_id, count(*) as countX from messages  where (from_user_id = 27 ) as toX 
group by to_user_id ORDER by countX desc limit 10) as total from messages;


-- ВОПРОС: чувствую, что мое решение дико сложное, есть более простое?

/* ВОПРОС: можно ли создать запрос с выборкой максимального количества сообщений между ползователями в обе стороны 
   (т.е. посчитать максимум из двух полей неуникальных значений сразу to_user_id и from_user_id, когда они писали друг другу)??? */







/*• - Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
*/

-- это я решил за полчаса, но все равно хочу решения!!!
select * from likes

-- select count(created_at) from likes where created_at < date_sub(now(), interval 10 year) -- зато я знаю как выбрать количество сообщений младше 10 лет ))

select user_id from profiles where 10 > (DATEDIFF(curdate(), birthday) div 365) -- список id малолеток (17 штук)


select * from likes where user_id IN  (select user_id from profiles where 10 > (DATEDIFF(curdate(), birthday) div 365)); -- список лайков

-- итоговое решение:
select count(user_id) from likes where user_id IN  (select user_id from profiles where 10 > (DATEDIFF(curdate(), birthday) div 365)); -- вроде верно


-- Это шикарно! Пользователь который родился не более 10 лет назад получил лайк в 1977 году )))




/*• - Определить кто больше поставил лайков (всего) - мужчины или женщины?
 * */

select count(user_id), gender from profiles where gender = 'm' -- 42

select count(user_id), gender from profiles where gender = 'f' -- 58


select user_id, gender from profiles where gender = 'm' -- список id m

select user_id, gender from profiles where gender = 'f' -- список id f

select user_id, gender from profiles where user_id in (9, 14, 47)


select count(*) from likes where user_id IN (select user_id from profiles where gender = 'm') -- лайков от m - 44  - верно

select count(*) from likes where user_id IN (select user_id from profiles where gender = 'f') -- лайков от f - 56  - верно

select IF((select count(*) from likes where user_id IN (select user_id from profiles where gender = 'm')) >
		  (select count(*) from likes where user_id IN (select user_id from profiles where gender = 'f')), 
		'больше m', 'больше f') as REZULT;

	
-- ВОПРОС: как задать переменные для вывода красивого и информативног сообщения типа: "56 > 44 и это женщины!!!" ?






