use ss2;

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
SELECT *
FROM student
JOIN class ON student.class_id = class.id;


-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
SELECT *
FROM student
left JOIN class ON student.class_id = class.id;

-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select *
from student
where name like '%hai'
or name like '%huynh';


-- 5. Lấy ra học viên có điểm lớn hơn 5 .
select id, name
from student
where point > 5;


-- 6. Lấy ra học viên có họ là “nguyen”
select id, name 
from student
where name like 'nguyen%';


-- 7. Thông kế số lượng học sinh theo từng loại điểm.
select point, count(*) as number_of_student
from student
group by point;


-- 8 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
SELECT point, COUNT(*) AS number_of_student
FROM student
WHERE point > 5
group by point;


-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point, count(*) as number_of_student
from student
where point > 5
group by point
having number_of_student >= 2;


-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
select student.id, student.name
from student
join class on class.id = student.class_id
where class.name = 'c1121g1'
order by name;



