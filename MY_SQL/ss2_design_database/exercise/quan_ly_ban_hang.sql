create database sale_management;

use sale_management;

create table customers(
	cID int auto_increment primary key,
    cName varchar(45),
    cAge int
);

create table orders(
	oID int auto_increment primary key,
    oDate date,
    oTotalPrice int,
    cID int,
    foreign key (cID) references customers(cID)
);

create table products(
	pID int auto_increment primary key,
    pName varchar(45),
    pPrice double
);

create table order_details(
	oID int,
    pID int,
    primary key(oID, pID),
    foreign key (oID) references orders(oID),
    foreign key (pID) references products(pID)
);