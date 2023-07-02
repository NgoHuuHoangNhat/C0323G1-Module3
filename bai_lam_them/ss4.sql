use ss2;
select *
from class c
right join student s on c.id = s.class_id;


-- 1.Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp ( yêu cầu viết code ra giấy )
select c.name,count(*) as 'số lượng học viên mỗi lớp'
from class c
join student s on c.id = s.class_id
group by c.id;

-- 2.Tính điểm lớn nhất của mỗi các lớp ( yêu cầu viết code ra giấy )
select c.name as 'tên lớp', max(s.`point`) as 'điểm lớn nhất trong lớp'
from class c
join student s on s.class_id = c.id
group by c.id;

-- 3.Tính điểm trung bình của từng lớp ( yêu cầu viết code ra giấy )
select c.name as 'tên lớp', avg(s.`point`) as 'điểm lớn nhất trong lớp'
from class c
join student s on s.class_id = c.id
group by c.id;

-- 4.Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. ( yêu cầu viết code ra giấy )
select i.name, i.birthday, 'instructor' AS type
from instructor i
union all
select s.name, s.birthday, 'student'
from student s



-- 5.Lấy ra top 3 học viên có điểm cao nhất của trung tâm. ( yêu cầu viết code ra giấy )

-- 6.Lấy ra các học viên có điểm số là cao nhất của trung tâm. ( yêu cầu viết code ra giấy )