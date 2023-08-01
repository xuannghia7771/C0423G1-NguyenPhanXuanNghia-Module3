create database customer_management;
use customer_management;

create table customers(
	customer_id int primary key auto_increment,
	customer_name varchar(100),
    customer_email varchar(100),
    customer_address varchar(100)
);

INSERT INTO `customer_management`.`customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES ('1', 'john carter', 'johncarter@gmail.com', '123 street A');
INSERT INTO `customer_management`.`customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES ('2', 'leonel messi', 'messi@gmail.com', '456 street B');
INSERT INTO `customer_management`.`customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES ('3', 'cristinano ronaldo', 'ronaldo', '789 street C');
INSERT INTO `customer_management`.`customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES ('4', 'ronaldinho', 'ronaldinho@gmail.com', '147 street D');
INSERT INTO `customer_management`.`customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES ('5', 'wayne rooney', 'rooney@gmail.com', '258 street E');
