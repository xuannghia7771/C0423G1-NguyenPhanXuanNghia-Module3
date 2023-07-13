-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
use quanlysinhvien;

#Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select StudentId as "Mã học viên" , StudentName as "Tên học viên" from student where StudentName like 'h%';

#Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where  month(StartDate) = '12';

#Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject` where Credit between 3 and 5;

#Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student
set ClassID = 2
where StudentName = 'Hung';
set sql_safe_updates = 1;
select * from student;

#Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.StudentName, J.SubName, M.Mark
from (student as S
join mark as M
on S.StudentId = M.StudentId)
join `subject` as J
on J.SubId = M.SubId
order by M.Mark desc, S.StudentName asc;