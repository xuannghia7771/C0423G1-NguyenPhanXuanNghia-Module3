create database student_management;
use student_management;
create table student_management_student(
	id_student int auto_increment,
    name_student varchar(45),
    age int,
    country varchar(45),
    primary key (id_student)
);
create table student_management_class(
	id_class int auto_increment,
    name_class varchar(45),
    primary key (id_class)
);
create table student_management_teacher(
	id_teacher int auto_increment,
    name_teacher varchar(45),
    age_teacher int,
    country_teacher varchar(45),
    primary key (id_teacher)
);

insert into student_management_student(name_student,age,country) 
value ("nghia",23,"Đà Nẵng"), ("nam",25,"Quảng Nam"), ("hoa",27,"Huế");

insert into student_management_teacher(name_teacher,age_teacher,country_teacher) 
value ("Cong",23,"Đà Nẵng"), ("HaiTT",25,"Quảng Nam"), ("TrungDC",27,"Huế");

select * from student_management.student_management_teacher;