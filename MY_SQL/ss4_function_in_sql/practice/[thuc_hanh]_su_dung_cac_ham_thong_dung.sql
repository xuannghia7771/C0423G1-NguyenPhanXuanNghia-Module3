use quanlysinhvien;

/*-----------------------------Hiển thị số lượng sinh viên ở từng nơi-------------------------------------*/
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

/*-----------------------------Tính điểm trung bình các môn học của mỗi học viên--------------------------*/
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

/*-----------------------------Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15------*/
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên
-- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15;

/*-----------------------------Hiển thị thông tin các học viên có điểm trung bình lớn nhất.---------------*/
-- Hiển thị danh sách điểm trung bình của các học viên
-- Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

