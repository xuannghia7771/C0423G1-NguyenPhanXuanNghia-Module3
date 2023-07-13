use sale_management;
/*-----------[Bài tập] Thao tác với CSDL Quản lý bán hàng----------*/
-- thêm dữ liệu cho các bảng
INSERT INTO `sale_management`.`customers` (`cID`, `cName`, `cAge`) VALUES ('1', 'Minh Quan', '10');
INSERT INTO `sale_management`.`customers` (`cID`, `cName`, `cAge`) VALUES ('2', 'Ngoc Oanh', '20');
INSERT INTO `sale_management`.`customers` (`cID`, `cName`, `cAge`) VALUES ('3', 'Hong Ha', '50');

INSERT INTO `sale_management`.`products` (`pID`, `pName`, `pPrice`) VALUES ('1', 'May Giat', '3');
INSERT INTO `sale_management`.`products` (`pID`, `pName`, `pPrice`) VALUES ('2', 'Tu Lanh', '5');
INSERT INTO `sale_management`.`products` (`pID`, `pName`, `pPrice`) VALUES ('3', 'Dieu Hoa', '7');
INSERT INTO `sale_management`.`products` (`pID`, `pName`, `pPrice`) VALUES ('4', 'Quat', '1');
INSERT INTO `sale_management`.`products` (`pID`, `pName`, `pPrice`) VALUES ('5', 'Bep Dien', '2');

INSERT INTO `sale_management`.`orders` (oDate, cID) VALUES ("2006-03-21", 1);
INSERT INTO `sale_management`.`orders` (oDate, cID) VALUES ("2006-03-23", 2);
INSERT INTO `sale_management`.`orders` (oDate, cID) VALUES ("2006-03-16", 1);

INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('1', '1', '3');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('1', '3', '7');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('1', '4', '2');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('2', '1', '1');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('3', '1', '8');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('2', '5', '4');
INSERT INTO `sale_management`.`order_details` (`oID`, `pID`, `odQTY`) VALUES ('2', '3', '3');

-- truy vấn dữ liệu
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice from orders;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select distinct C.cName, P.pName
from customers C
join orders O on C.cId = O.cId
join order_details OD on OD.oID = O.oID
join products P on P.pID = OD.pID;

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.cName, C.cID
from customers C
left join orders O on C.cID = O.cID
where O.cID is null;

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select O.oID, O.oDate, SUM(OD.odQTY*P.pPrice) as total_cost_by_order
from orders O
join order_details OD on O.oID = OD.oID
join products P on P.pID = OD.pID
group by O.oID, O.oDate;