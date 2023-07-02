create database furama_management;
use furama_management;

create table role(
role_id int primary key auto_increment,
role_name varchar(45) unique
);

create table employee_level(
employee_level_id int primary key auto_increment,
employee_level_name varchar(45) unique
);

create table department(
department_id int primary key auto_increment,
department_name varchar(45) 
);

create table employee(
employee_id int primary key auto_increment,
full_name varchar(45) not null,
date_of_birth date not null,
passport varchar(45) not null unique,
salary double not null,
phone_number varchar(45) not null unique,
email varchar(45) unique,
address varchar(45),
role_id int not null,
employee_level_id int not null,
department_id int not null,
foreign key (role_id) references role(role_id),
foreign key (employee_level_id) references employee_level(employee_level_id),
foreign key (department_id) references department(department_id)
);

create table customer_type(
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);

create table customer(
customer_id int primary key auto_increment,
customer_type_id int not null,
full_name varchar(45) not null,
date_of_birth date not null,
gender bit(1) not null,
passport varchar(45) not null unique,
phone_number varchar(45) not null unique,
email varchar(45) unique,
address varchar(45),
foreign key (customer_type_id) references customer_type(customer_type_id)
);

create table rentail_type(
rentail_type_id int primary key auto_increment,
rentail_type_name varchar(45)
);

create table type_of_service(
type_of_service_id int primary key auto_increment,
type_of_service_name varchar(45)
);

create table service(
service_id int primary key auto_increment,
service_name varchar(45) not null,
area_of_facility int,
rentail_fee double not null,
max_people int,
rentail_type_id int not null,
type_of_service_id int not null,
standard varchar(45),
info varchar(45),
area_of_swimming_pool double,
number_of_floor int,
foreign key (rentail_type_id) references rentail_type(rentail_type_id),
foreign key (type_of_service_id) references type_of_service(type_of_service_id)
);

create table contract(
contract_id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
deposit double not null,
employee_id int not null,
customer_id int not null,
service_id int not null,
foreign key (employee_id) references employee(employee_id),
foreign key (customer_id) references customer(customer_id),
foreign key (service_id) references service(service_id)
);

create table other_service(
other_service_id int primary key auto_increment,
other_service_name varchar(45) not null,
price double not null,
unit varchar(10) not null,
status varchar(45)
);

create table contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int not null,
other_service_id int not null,
quantity int not null,
foreign key (contract_id) references contract(contract_id),
foreign key (other_service_id) references other_service(other_service_id)
);

















































