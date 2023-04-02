/* 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' */
DELIMITER //

CREATE FUNCTION format_seconds(sec INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(100);
    
    SET days = sec DIV 86400;
    SET sec = sec MOD 86400;
    SET hours = sec DIV 3600;
    SET sec = sec MOD 3600;
    SET minutes = sec DIV 60;
    SET sec = sec MOD 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', sec, ' seconds');
    
    RETURN result;
END //

DELIMITER ;
/* 2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)*/
DELIMITER //

CREATE PROCEDURE print_even_numbers()
BEGIN
    DECLARE x INT;
    SET x = 2;
    
    WHILE x <= 10 DO
        SELECT x;
        SET x = x + 2;
    END WHILE;
END //

DELIMITER ;

/*Создать процедуру, которая решает следующую задачу
Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
а) из одного города
б) состоят в одной группе
в) друзья друзей

допустим друзья в базе есть*/
DELIMITER //
CREATE PROCEDURE get_five_users (IN user_id INT)
BEGIN
  SELECT
    u1.id AS user_id, 
    u2.id AS random_user_id,
    u2.firstname,
    u2.lastname
  FROM users u1
  LEFT JOIN users u2 ON
     (u1.id = u2.id) OR
  (u1.city = u2.city) OR
  (u2.id IN (SELECT b.user_id_2
    FROM friends a
    LEFT JOIN friends b
      ON a.user_id_1 = b.user_id_1
    WHERE a.user_id_2 = user_id)) OR
  (u2.id IN (SELECT c.user_id_2
    FROM users_communities a 
    LEFT JOIN users_communities b
      ON a.community_id = b.community_id
    LEFT JOIN users_communities c
      ON b.user_id = c.user_id
      WHERE a.user_id = user_id)) 
  WHERE u1.id = user_id 
  ORDER BY RAND()
  LIMIT 5;
END //
DELIMITER ;
/* Создать функцию, вычисляющей коэффициент популярности пользователя */
DELIMITER //
CREATE FUNCTION popularity_coefficient(IN user_id INT)
RETURNS FLOAT
BEGIN
 DECLARE likes_given INT DEFAULT 0;
 DECLARE likes_received INT DEFAULT 0;
 DECLARE result FLOAT DEFAULT 0;
 
 SELECT 
 COUNT(*) INTO likes_given
  FROM
 likes l
   LEFT JOIN media m
     ON l.media_id = m.id
   LEFT JOIN users u
     ON u.id = m.user_id
  WHERE
 u.id = user_id;
  
  SELECT 
 COUNT(*) INTO likes_received
  FROM
 likes l
   LEFT JOIN media m
     ON l.media_id = m.id
   LEFT JOIN likes l2
     ON l.media_id = l2.media_id
  WHERE
 l2.user_id = user_id;
  
  SET result = (likes_received / likes_given);
  
  RETURN result;
END;
DELIMITER;
/* Создать процедуру для добавления нового пользователя с профилем */
CREATE PROCEDURE add_new_user (IN firstname VARCHAR(50), IN lastname VARCHAR(50), IN email VARCHAR(120), IN gender CHAR(1), IN birthday DATE, IN hometown VARCHAR(100))
BEGIN
  INSERT INTO users (firstname, lastname, email) 
  VALUES (firstname, lastname, email);
  
  INSERT INTO profiles (user_id, gender, birthday, hometown) 
  VALUES (LAST_INSERT_ID(), gender, birthday, hometown);
END;