﻿## HOMEWORK SQL
 
**1.	Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ**

create database hm1;

use hm1;

create table mobile_phones (Id INT NOT NULL AUTO_INCREMENT, ProductName VARCHAR(32), Manufacturer VARCHAR(16), ProductCount INT(16), PRICE INT(64), PRIMARY KEY(id));

INSERT INTO mobile_phones (ProductName, Manufacturer, ProductCount, PRICE) VALUES('Iphone X', 'Apple', 3, 76000);

INSERT INTO mobile_phones (ProductName, Manufacturer, ProductCount, PRICE) VALUES('Iphone 8', 'Apple', 2, 51000);

INSERT INTO mobile_phones (ProductName, Manufacturer, ProductCount, PRICE) VALUES('Galaxy S9', 'Samsung', 2, 56000);

INSERT INTO mobile_phones (ProductName, Manufacturer, ProductCount, PRICE) VALUES('Galaxy S8', 'Samsung', 1, 41000);

INSERT INTO mobile_phones (ProductName, Manufacturer, ProductCount, PRICE) VALUES('P20 Pro', 'Huawei', 5, 36000); 

SELECT * FROM mobile_phones;

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_1.png)

**Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)**

SELECT Manufacturer, Price FROM mobile_phones WHERE ProductCount > 2;

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_2.png)

**Выведите весь ассортимент товаров марки “Samsung”**

SELECT * FROM mobile_phones WHERE Manufacturer='Samsung';

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_3.png)

**Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT * FROM mobile_phones WHERE PRICE * ProductCount > 100000 and PRICE * ProductCount < 145000; 

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_4.png)

**4.1. Товары, в которых есть упоминание "Iphone"**

SELECT * FROM mobile_phones WHERE CONCAT(ProductName, Manufacturer) LIKE '%Iphone%';

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_5.png)

**4.2. "Galaxy"**

SELECT * FROM mobile_phones WHERE CONCAT(ProductName, Manufacturer) LIKE '%Galaxy%';

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_6.png)

**4.3.  Товары, в которых есть ЦИФРЫ**

SELECT * FROM mobile_phones WHERE CONCAT(ProductName, Manufacturer) REGEXP '[0-9]';

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_7.png)

**4.4.  Товары, в которых есть ЦИФРА "8"**

SELECT * FROM mobile_phones WHERE CONCAT(ProductName, Manufacturer) LIKE '%8%';

![me](https://github.com/see1234/sql/blob/main/hm1/Screenshot_8.png)
