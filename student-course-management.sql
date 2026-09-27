create database student_course_management_system;
use student_course_management_system;
select database();
create table departments (
    department_id int primary key,
    department_name varchar(100) not null,
    department_head varchar(100)
);
create table students (
    student_id int primary key,
    name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    department_id int,
    registration_date date,
    foreign key (department_id) references departments(department_id)
);
create table instructors (
    instructor_id int primary key,
    instructor_name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    department_id int,
    foreign key (department_id) references departments(department_id)
);
create table courses (
    course_id int primary key,
    course_name varchar(100) not null,
    credits int check (credits > 0),
    department_id int,
    instructor_id int,
    foreign key (department_id) references departments(department_id),
    foreign key (instructor_id) references instructors(instructor_id)
);
create table enrollments (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    enroll_date date,
    semester varchar(20),
    grade varchar(2),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);
show tables;
insert into departments
(department_id, department_name, department_head)
values
(1, 'computer science', 'dr. ramesh'),
(2, 'information technology', 'dr. suresh'),
(3, 'electronics', 'dr. lakshmi'),
(4, 'mechanical', 'dr. kumar'),
(5, 'civil', 'dr. priya');
select * from departments;
insert into students
(student_id, name, email, phone, department_id, registration_date)
values
(101, 'rahul', 'rahul@gmail.com', '9876543210', 1, '2023-06-15'),
(102, 'priya', 'priya@gmail.com', '9876543211', 2, '2024-01-10'),
(103, 'arjun', 'arjun@gmail.com', '9876543212', 1, '2024-02-20'),
(104, 'sneha', 'sneha@gmail.com', '9876543213', 3, '2022-07-12'),
(105, 'kiran', 'kiran@gmail.com', '9876543214', 2, '2023-08-05'),
(106, 'anjali', 'anjali@gmail.com', '9876543215', 1, '2024-03-18'),
(107, 'vikram', 'vikram@gmail.com', '9876543216', 4, '2022-06-25'),
(108, 'neha', 'neha@gmail.com', '9876543217', 2, '2024-04-11'),
(109, 'rohit', 'rohit@gmail.com', '9876543218', 5, '2023-09-01'),
(110, 'divya', 'divya@gmail.com', '9876543219', 1, '2024-05-22');
select * from students;
insert into instructors
(instructor_id, instructor_name, email, phone, department_id)
values
(201, 'dr. anil', 'anil@college.com', '9000000001', 1),
(202, 'dr. meena', 'meena@college.com', '9000000002', 2),
(203, 'dr. ravi', 'ravi@college.com', '9000000003', 1),
(204, 'dr. swathi', 'swathi@college.com', '9000000004', 3),
(205, 'dr. raj', 'raj@college.com', '9000000005', 4);
select * from instructors;
insert into courses
(course_id, course_name, credits, department_id, instructor_id)
values
(301, 'python programming', 4, 1, 201),
(302, 'sql database', 4, 2, 202),
(303, 'web development', 3, 1, 201),
(304, 'data structures', 4, 1, 203),
(305, 'machine learning', 5, 1, 203),
(306, 'computer networks', 3, 2, 202),
(307, 'digital electronics', 4, 3, 204),
(308, 'thermodynamics', 3, 4, 205),
(309, 'java programming', 4, 2, 202),
(310, 'operating systems', 4, 1, 201);
select * from courses;
insert into enrollments
(enrollment_id, student_id, course_id, enroll_date, semester, grade)
values
(401, 101, 301, '2024-01-15', 'spring 2024', 'a'),
(402, 101, 302, '2024-01-16', 'spring 2024', 'b'),
(403, 101, 304, '2024-01-17', 'spring 2024', 'a'),

(404, 102, 302, '2024-01-18', 'spring 2024', 'a'),
(405, 102, 306, '2024-01-19', 'spring 2024', 'b'),

(406, 103, 301, '2024-01-20', 'spring 2024', 'a'),
(407, 103, 305, '2024-01-21', 'spring 2024', 'a'),

(408, 104, 307, '2023-08-10', 'fall 2023', 'b'),

(409, 105, 302, '2024-01-22', 'spring 2024', 'a'),
(410, 105, 309, '2024-01-23', 'spring 2024', 'b'),

(411, 106, 304, '2024-01-24', 'spring 2024', 'a'),
(412, 106, 305, '2024-01-25', 'spring 2024', 'a'),

(413, 107, 308, '2023-08-12', 'fall 2023', 'c'),

(414, 108, 302, '2024-01-26', 'spring 2024', 'a'),
(415, 108, 306, '2024-01-27', 'spring 2024', 'b'),

(416, 109, 307, '2024-01-28', 'spring 2024', 'a'),

(417, 110, 301, '2024-01-29', 'spring 2024', 'a'),
(418, 110, 305, '2024-01-30', 'spring 2024', 'a'),
(419, 110, 310, '2024-01-31', 'spring 2024', 'b');
select * from enrollments;
-- BASIC QUARIES
select * from courses where credits>3;
select s.student_id,s.name,d.department_name from students s join departments d on s.department_id=d.department_id where department_name='information technology';
select i.instructor_id,i.instructor_name,c.course_name from instructors i join courses c on i.instructor_id=c.instructor_id where course_name like '%programming%';
select * from students where registration_date>='2024-01-01';
-- JOINS
select s.name as student_name,c.course_name from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id;
select c.course_name,i.instructor_name from courses c join instructors i on c.instructor_id=i.instructor_id;
select e.enroll_date,s.name as student_name from enrollments e join students s on e.student_id=s.student_id;
select c.course_name,d.department_name from courses c join departments d on c.department_id=d.department_id;
select s.name as student_name,c.course_name,i.instructor_name from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id join instructors i on i.instructor_id=c.instructor_id;
-- AGGRIGATE FUNCTIONS
select count(*) as no_of_students from students;
select count(*)as total_courses from courses;
select avg(credits)from courses;
select c.course_name,count(e.student_id)as students_enrolled from courses c left join enrollments e on c.course_id=e.course_id group by c.course_name,c.course_id;
select c.course_name,count(e.student_id)as highest_enrollments from courses c left join enrollments e on c.course_id=e.course_id group by c.course_name,c.course_id order by highest_enrollments desc limit 1;
-- SUB QUERIES
select * from students where student_id not in (select student_id from enrollments);
select * from courses where course_id not in(select course_id from enrollments);
select * from students where student_id in(select student_id from enrollments group by student_id having count(student_id)>1);
select * from courses where credits>(select avg(credits) from courses);
select * from instructors where instructor_id in (select instructor_id from courses group by instructor_id having count(instructor_id)>1);
-- UPDATES & DELETES
select * from courses;
update courses set credits=5 where credits=4;
update courses set credits=4 where credits=3;
update courses set credits=3 where course_id in(303,305,307);
update instructors set department_id=2 where instructor_id=203;
select * from instructors;
update students set phone=9063859184 where student_id=101;
select * from students;
select * from courses where course_id not in(select course_id from enrollments);
delete from courses where course_id not in(select course_id from enrollments);
select * from students where student_id not in(select student_id from enrollments);
delete from students where student_id not in(select student_id from enrollments);
-- VIEWS
create view student_course as select s.name,c.course_name,e.enroll_date from students s join enrollments e on s.student_id=e.student_id join courses c on c.course_id=e.course_id;
select * from student_course; 
create view course_instructor as select c.course_name,i.instructor_name,d.department_name from courses c join instructors i on c.instructor_id=i.instructor_id join departments d on d.department_id=i.department_id;
select * from course_instructor;
create view student_with_course as select s.name,count(c.course_id)from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id group by s.name,s.student_id;
select * from student_with_course;
create view toal_student_courses as select c.course_name,count(e.student_id)from courses c left join enrollments e on c.course_id=e.course_id group by c.course_id,c.course_name;
select * from toal_student_courses;
create view student_department as select s.name,d.department_name from students s join departments d on d.department_id=s.department_id;
select *from student_department;
-- STORED PROCEDURES
delimiter //
create procedure students(in p_course_id int)
begin
select s.student_id,s.name,c.course_name,e.enroll_date from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id where c.course_id=p_course_id;
end //
delimiter ;
call students(301);

delimiter //
create procedure courses_offerd(in dept_id int)
begin
select c.course_id,c.course_name,d.department_name from courses c join departments d on d.department_id=c.department_id where d.department_id=dept_id;
end //
delimiter ;
call courses_offerd(1)

delimiter //
create procedure total_students(in dept_id int)
begin 
select d.department_name,count(s.student_id) from departments d left join students s on s.department_id=d.department_id where d.department_id=dept_id group by d.department_id,d.department_name;
end //
delimiter ;
drop procedure total_students;
call total_students(2);

delimiter //
create procedure course_details(in course_idd int)
begin
select c.course_id,c.course_name,c.credits,d.department_name,i.instructor_name from courses c join departments d on d.department_id=c.department_id join instructors i on i.instructor_id=c.instructor_id where c.course_id=course_idd;
end //
delimiter ;
call course_details(301);

-- REPORT AND ANALYSIS
select c.course_name,count(e.student_id)as total_students from courses c join enrollments e on c.course_id=e.course_id group by c.course_name,c.course_id order by total_students desc limit 5;

select d.department_name,count(s.student_id)as total_students from departments d join students s on d.department_id=s.department_id group by d.department_id,d.department_name order by total_students desc limit 1;

select i.instructor_name,count(c.course_id)as total_courses from courses c join instructors i on i.instructor_id=c.instructor_id group by i.instructor_id,i.instructor_name order by total_courses desc limit 1;

select semester,count(student_id)as total_enrollments from enrollments group by semester;

select course_name,credits from courses order by credits desc limit 5;
-- cleaned github-ready version
-- note: the original practice updates/deletes are retained above.
