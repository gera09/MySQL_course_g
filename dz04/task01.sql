use vk;

/* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
 * 
 который больше всех общался с нашим пользователем. */


select * from users where id = 27; -- firstname 

select * from messages;

Select from_user_id, count(*) from messages where id = 27 group by from_user_id;






