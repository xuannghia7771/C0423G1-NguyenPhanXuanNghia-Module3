create database demo_user;
use demo_user;
create table users ( 
      id int(3) NOT NULL AUTO_INCREMENT, 
      name varchar(120) NOT NULL, 
      email varchar(220) NOT NULL, 
      country varchar(120), 
      PRIMARY KEY (id) 
);

truncate table users;

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER //
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
	 SELECT users.name, users.email, users.country
	 FROM users
	 where users.id = user_id;
 END ; //
DELIMITER ;

delimiter //
CREATE PROCEDURE insert_user (IN user_name VARCHAR(50), IN user_email VARCHAR(50), IN user_country VARCHAR(50))
BEGIN
    INSERT INTO users(`name`, email, country) VALUES (user_name, user_email, user_country);
END ; //
delimiter ;
