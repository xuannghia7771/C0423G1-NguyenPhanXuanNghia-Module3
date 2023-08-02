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

-- SP hiển thị danh sách users
delimiter //
CREATE PROCEDURE display_user ()
BEGIN
    select * from users;
END ; //
delimiter ;

-- SP sửa thông tin users
-- update users set name = ?,email= ?, country =? where id = ?;
delimiter //
CREATE PROCEDURE update_user (IN user_name varchar(100), IN user_email varchar(100), IN user_country varchar(100), IN user_id int)
BEGIN
    update users set `name` = user_name, email = user_email, country = user_country where id = user_id;
END ; //
delimiter ;

-- SP xóa user
-- delete from users where id = ?;
delimiter //
CREATE PROCEDURE delete_user (IN user_id int)
BEGIN
    delete from users where id = user_id;
END ; //
delimiter ;
