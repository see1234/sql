/*1. Создание представления, в которое попадут автомобили стоимостью до 25 000 долларов:*/
 
CREATE VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost < 25000;
 

/*2. Изменение в существующем представлении порога для стоимости до 30 000 долларов (используя оператор ALTER VIEW):*/
 
ALTER VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost < 30000;
 

/*3. Создание представления, в котором будут только автомобили марки “Шкода” и “Ауди”:*/
 
CREATE VIEW skoda_and_audi_cars AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');
 
/* 4 Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее. */
SELECT train_id, station, station_time
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;

/* доп задания */
/*1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA:*/

SELECT MARK, COLOR, COUNT(*) AS CNT
FROM AUTO
WHERE MARK IN ('BMW', 'LADA')
GROUP BY MARK, COLOR;

/*2. Вывести на экран марку авто и количество AUTO не этой марки:*/

SELECT a.MARK, COUNT(*) AS CNT
FROM AUTO a
JOIN AUTO b ON a.MARK != b.MARK
GROUP BY a.MARK;

/*3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT:*/

SELECT a.*
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;