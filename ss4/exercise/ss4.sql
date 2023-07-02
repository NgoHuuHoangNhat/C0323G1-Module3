use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject s
where s.credit = (
select max(s.credit)
from subject s
)
group by s.sub_id;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*, m.mark
from subject s
join mark m on m.sub_id = s.sub_id
where m.mark = (
	select max(m.mark)
    from mark m
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(m.mark)
from student s
join mark m on m.student_id = s.student_id
group by s.student_id
