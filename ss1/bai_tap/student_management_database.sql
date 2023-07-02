create table `student_database`.`student_table`(
`id` int not null,
`name` varchar(45) not null,
`age` int not null,
`country` varchar(45) not null,
primary key(`id`)
);

create table `student_database`.`teacher_table`(
`id` int not null,
`name` varchar(45) not null,
`age` int not null,
`country` varchar(45) not null,
primary key(`id`)
);

create table `student_database`.`class_table`(
`id` int not null,
`name` varchar(45) not null,
primary key(`id`)
);
