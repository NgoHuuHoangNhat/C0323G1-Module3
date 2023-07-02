use quanlysinhvien;

insert into class
values 
(1,	'A1',	'2008-12-20',	1),
(2,	'A2',	'2008-12-22',	1),
(3,	'B3',	current_date(),	0);

insert into student
values 
(1,		'Hung',		'Ha noi',	'0912113113',	1,	1),
(2,		'Hoa',		'Hai phong',null,			1,	2),
(3,		'Manh',		'HCM',		'0123123123',	0,	2);

insert into Subject(SubName,Credit,Status)
values 
('CF',5,1),
('C',6,1),
('HDJ',5,1),
('RDBMS',10,1);

insert into Mark(SubId,StudentId,Mark,ExamTimes)
values 
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

