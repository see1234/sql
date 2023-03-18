/*Задание #1*/
create database db_products;
use db_products;
CREATE TABLE `db_products`.`sales` (id INT NOT NULL AUTO_INCREMENT, order_date DATE NOT NULL, count_product INT NOT NULL, PRIMARY KEY (id));

INSERT INTO sales (order_date, count_product) VALUES  ("2022-01-01",156), ("2022-01-02",180),  ("2022-01-03",21), ("2022-01-04",124),("2022-01-05",341);

/*Задание #2*/
SELECT id, CASE TRUE WHEN count_product < 100 THEN 'Маленький заказ' WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний заказ' ELSE 'Большой заказ' END AS order_size FROM sales;

/*Задание #3*/
CREATE TABLE orders (id INT NOT NULL AUTO_INCREMENT,employee_id VARCHAR(5) NOT NULL,amount DECIMAL(20, 2) NOT NULL,order_status VARCHAR(45) NOT NULL,PRIMARY KEY (id));
INSERT INTO orders (employee_id, amount, order_status) VALUES ("e03",15.00,"OPEN"),("e01",25.50,"OPEN"),("e05",100.70,"CLOSED"), ("e02",22.18,"OPEN"), ("e04",9.50,"CANCELLED");
SELECT order_status, CASE order_status WHEN "OPEN" THEN 'Order is in open state.' WHEN "CLOSED" THEN 'Order is closed.' WHEN "CANCELLED" THEN 'Order is cancelled.' ELSE 'ERROR.' END AS order_summary FROM orders;

/*Задание #4*/
/*вы сами говорили что все понятно)*/


/*Дополнительное задание к первым 2 урокам:*/
/*слегка не понял, но подумал что над коннект к mysql через яп, и сделать read, update, select, delete*/

  private void db() {
	  try {
	      Class.forName("com.mysql.jdbc.Driver");
		  Connection connection = DriverManager.getConnection("jdbc:mysql://" + host + ":3306/" + dbname + "?useUnicode=true&characterEncoding=utf-8&dontTrackOpenResources=true&autoReconnect=true&useSSL=false", user, password);
		  update(connection, "CREATE DATABASE info;");
		  update(connection, "CREATE TABLE info.table_name (name, marks);");
		  update(connection, "Create table info.student(name Varchar(30) NOT NULL, marks Integer);");
		  update(connection, "select * from info.student;");
		  update(connection, "Alter table student modify name varchar(50) not null;");
		  update(connection, "delete from student where marks = 100;");

	  } catch (Exception e) {
		  throw new RuntimeException(e);
	  }

  }
 public void update(Connection connection, String query) {
	
			try {
				PreparedStatement statement = connection.prepareStatement(query) ;
				statement.executeUpdate();
				if (statement != null) {
					try {
						statement.close();
					} catch (SQLException ex) {
						String msg = "...";

					}
					statement = null;
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		
/*Файл со скриптом прикреплен к материалам(interview.sql):*/
/*Файла не было... Но допустим типа есть*/
/*1 Задание */

ALTER TABLE my_table ADD FOREIGN KEY (my_id) REFERENCES my_table2(my_id);

/*Остальные задачи не получаются без файла */
 