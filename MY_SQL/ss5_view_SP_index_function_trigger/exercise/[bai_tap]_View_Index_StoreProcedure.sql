create database demo;
use demo;

drop table products;
create table products(
	id int primary key,
    productCode varchar(10),
    productName varchar(45),
    productPrice double,
    productAmount int,
    productDescription varchar(50),
    productStatus varchar(20)
);

insert into products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus) values
(1, "p-01","iphone", 100, 1, "Dien thoai thong minh", "13 pro"),
(2, "p-02","iphone", 100, 3, "Dien thoai thong minh", "14 pro"),
(3, "p-03","samsung", 100, 4, "Dien thoai thong minh", "galaxy"),
(4, "p-04","samsung", 100, 5, "Dien thoai thong minh", "galaxy A"),
(5, "p-01","samsung", 100, 2, "Dien thoai thong minh", "zip");

-- bước 3
alter table products add index idx_productCode(productCode);
-- trước khi gán index duyệt qua 5 rows
-- sau khi gán index duyệt qua 1 row
explain select * from products where productCode = 'p-04';

-- bước 4
create view product_views as
select productCode, productName, productPrice, productStatus
from products;
select * from product_views; -- chạy bảng view
-- sửa đổi view
create or replace view product_views as
select productCode, productName, productPrice, productStatus
from products
where productStatus like '%pro%';
-- xóa view
drop view product_views;

-- BƯỚC 5
-- SP lấy thông tin của tất cả sản phẩm trong bảng product
delimiter //
create procedure find_product_info()
begin
	select * from products;
end //
delimiter ;
call find_product_info();

-- store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(
	in id int, 
	in productCode varchar(25), 
	in productName varchar(45), 
	in productPrice double, 
	in productAmount int, 
	in productDescription varchar(45), 
	in productStatus varchar(40)
)
begin
	insert into products values(id,productCode,productName,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;
-- khai bao biến các đối số là thuộc tính sau đó truyền vào hàm
set @id = 8;
set @productCode = 'p-17';
set @productName = 'Oppo';
set @productPrice = 120;
set @productAmount = 5;
set @productDescription = 'Dien thoai thong minh';
set @productStatus = 'reno 9';
call add_new_product(@id,@productCode,@productName,@productPrice,@productAmount,@productDescription,@productStatus);

-- SP sửa thông tin sản phẩm theo id
drop procedure edit_product_by_id;
delimiter //
create procedure edit_product_by_id(
	inout id int, 
	in productCode varchar(25), 
	in productName varchar(45), 
	in productPrice double, 
	in productAmount int, 
	in productDescription varchar(45), 
	in productStatus varchar(40)
)
begin
	set sql_safe_updates = 0;
	update products
    set productCode = productCode,
		productName = productName,
		productPrice = productPrice,
		productAmount = productAmount,
		productDescription = productDescription,
		productStatus = productStatus
	where id = id;
    set sql_safe_updates = 1;
end //
delimiter ;
set @id = 4;
set @productCode = 'p-14';
set @productName = 'xiaomi';
set @productPrice = 120;
set @productAmount = 3;
set @productDescription = 'Dien thoai thong minh';
set @productStatus = 'xiaomi 7';
call edit_product_by_id(@id,@productCode,@productName,@productPrice,@productAmount,@productDescription,@productStatus);

-- store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(
in product_id int)
begin
delete from products
where id = product_id;
end // 
delimiter ;
call delete_product_by_id(4);