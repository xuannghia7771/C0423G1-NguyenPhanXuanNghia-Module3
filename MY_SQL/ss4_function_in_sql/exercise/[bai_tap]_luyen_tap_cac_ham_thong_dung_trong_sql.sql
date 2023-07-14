use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from `subject`
group by SubId
having Credit >= All (select Credit from `subject`);

#Hiển thị các thông tin môn học có điểm thi lớn nhất.
select S.SubId,S.SubName,S.Credit, S.`Status`, max(Mark) Max
from `subject` S
join mark M on S.SubId = M.SubId
group by S.SubId
having Max >= All (select mark from mark);

#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select S.StudentId, S.StudentName, AVG(M.mark) as AveragePoint
from student S
join mark M on S.StudentId = M.StudentId
group by S.StudentId
order by AVG(M.mark);