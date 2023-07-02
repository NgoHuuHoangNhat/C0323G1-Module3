create database sales_management;
use sales_management;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(255),
customer_age int
);

create table order_product(
order_id int primary key auto_increment,
customer_id int,
order_date date not null,
order_total_price double,
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int primary key auto_increment,
product_name varchar(255) not null,
product_price double not null
);

create table order_detail(
order_id int,
product_id int,
order_quantity bigint not null,
foreign key (order_id) references  order_product(order_id),
foreign key (product_id) references  product(product_id),
primary key(order_id,product_id)
)

