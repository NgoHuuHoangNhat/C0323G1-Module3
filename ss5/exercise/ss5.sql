-- Tạo cơ sở dữ liệu demo
create database demo;

-- Tạo bảng Products
create table products(
id int primary key auto_increment,
product_code int not null,
product_name varchar(255),
product_price double,
product_amount int,
product_description varchar(255),
product_status varchar(255)
);

-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values 	(1,'bánh',15000,50,'bánh kem','ngon lắm'),
		(2,'kẹo',5000,50,'kẹo mút','ngon lắm'),
        (3,'xe đua',100000,50,'xe đồ chơi','chạy nhanh lắm')
;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index products_code_index on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index products_composite_index on products(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select *
from products
where product_name = 'bánh';

-- So sánh câu truy vấn trước và sau khi tạo index
explain select *
from products
where product_amount = 50;

create index products_amount_index on products(product_amount);
explain select *
from products
where product_amount = 50;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_info as
select 	product_code,
		product_name,
        product_price,
        product_status
from products;

-- Tiến hành sửa đổi view
alter view products_info as
select 	product_code,
		product_name,
        product_price,
        product_description
from products;

-- Tiến hành xoá view
drop view products_info;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure get_all()
	begin
		select *
		from products;
    end//
DELIMITER ;

call get_all();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure add_new_product(	in new_product_code int,
							in new_product_name varchar(255),
							in new_product_price double,
							in new_product_amount int,
							in new_product_description varchar(255),
							in new_product_status varchar(255) )
	begin
		insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
		values (new_product_code,new_product_name,new_product_price,new_product_amount,new_product_description,new_product_status);
    end//
DELIMITER ;
call add_new_product(4,'bia',10000,510,'bia huda','say');

-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //
create procedure edit_product( in check_id int,
							in new_product_code int,
							in new_product_name varchar(255),
							in new_product_price double,
							in new_product_amount int,
							in new_product_description varchar(255),
							in new_product_status varchar(255) )
	begin
		set SQL_SAFE_UPDATES = 0;
		update products
        set product_code = new_product_code,
         product_name = new_product_name,
         product_price = new_product_price,
         product_amount = new_product_amount,
         product_description = new_product_description,
         product_status = new_product_status
         where id = check_id;
         set SQL_SAFE_UPDATES = 1;
    end//
DELIMITER ;
call edit_product(4, 4, 'bia riệu', 1000000, 521, 'bia sài gòn', 'say lắm');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure remove_product(in check_id int)
	begin
		delete from products
        where id = check_id;
    end//
DELIMITER ;

call remove_product(4);






