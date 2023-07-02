create database codegym_management;
use codegym_management;

create table class(
ClassId int primary key auto_increment,
`Name` varchar(255) not null,
StartDateTime date not null,
`status` varchar(255) not null
);

create table student(
StudentId int primary key auto_increment,
`Name` varchar(255) not null,
DateOfBirth date not null,
Gender varchar(6) not null default 'Male',
Email varchar(255) not null unique,
Score bit check( score >= 0 and score <= 10),
`Account` varchar(255) not null unique,
`Password` varchar(255) not null unique,
ClassId int not null,
foreign key (ClassId) references class (ClassId) 
);

create table teacher(
TeacherId int primary key auto_increment,
`Name` varchar(255) not null,
Wage double not null
);

create table assignment(
AssignmentId int primary key auto_increment,
TeacherId int not null,
ClassId int not null,
StartDateTime date not null,
foreign key (TeacherId) references teacher (TeacherId),
foreign key (ClassId) references class (ClassId)
)



