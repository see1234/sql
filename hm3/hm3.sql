CREATE DATABASE hw3;
use hw3;

create table staff (
	id int primary key auto_increment,
    firstname varchar (20) not null,
    lastname varchar (20) not null,
    post varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert staff( firstname, lastname, post, seniority, salary, age)
values
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

select * from staff;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

select * from staff order by salary asc;
select * from staff order by salary desc;

-- 2. Выведите 5 максимальных заработных плат (salary)

select * from staff order by salary desc limit 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (post)

select post, sum(salary) from staff group by post;

-- 4. Найдите кол-во сотрудников с специальностью (post) <<Рабочий>> в возрасте от 24 до 49 лет включительно.

select count(*) from staff where post='Рабочий' and age between 24 and 49;

-- 5. Найдите количество специальностей

select count(*) from (select distinct post from staff) as temp;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

select post from staff group by post having avg(age)<30;