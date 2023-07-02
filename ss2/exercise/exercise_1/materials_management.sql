create database materials_management;
use materials_management;

create table material(
material_id int primary key auto_increment,
material_name varchar(255) not null unique
);

create table delivery_form(
delivery_formId int primary key auto_increment,
date_of_delivery_form date not null
);

create table purchase_order(
purchase_order_id int primary key auto_increment,
date_of_purchase_order date not null
);

create table supplier(
supplier_id int primary key auto_increment,
supplier_name varchar(255) not null,
address varchar(255) not null
);

create table number_phone_supplier(
number_phone varchar(10) primary key,
supplier_id int,
foreign key (supplier_id) REFERENCES supplier(supplier_id)
);

create table order_form(
order_form_id int primary key auto_increment,
supplier_id int,
date_of_order_form date not null,
FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);


create table details_of_delivery_note(
material_id int,
delivery_form_id int,
primary key(material_id,delivery_form_id),
price_of_material double not null,
quantity_of_material int not null,
FOREIGN KEY (material_id) REFERENCES material(material_id),
FOREIGN KEY (delivery_form_id) REFERENCES delivery_form_id(delivery_form_id)
);

create table details_of_purchase_order(
material_id int,
purchase_order_id int,
primary key(material_id,purchase_order_id),
price_of_material double not null,
quantity_of_material int not null,
FOREIGN KEY (material_id) REFERENCES material(material_id),
FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(purchase_order_id)
);

create table detailsOfOrderForm(
orderFormId int,
materialId int,
primary key(orderFormId,materialId),
FOREIGN KEY (materialId) REFERENCES material(materialId),
FOREIGN KEY (orderFormId) REFERENCES orderForm(orderFormId)
);

