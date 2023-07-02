use sales_management;

insert into customer(customer_name,customer_age)
values 
('Minh Quan',10),
  ('Ngoc Oanh',20),
  ('Hong Ha',50);
  
  
insert into order_product(customer_id,order_date,order_total_price)
values
(1,'2006-3-21',Null),
(2,'2006-3-23',Null),
(1,'2006-3-16',Null);

insert into product(product_name,product_price)
values
('May Giat',3),
  ('Tu Lanh',5),
  ('Dieu Hoa',7),
  ('Quat',1),
  ('Bep Dien',2);
  
  insert into order_detail
  values
    (1,1,3),
  (1,3,7),
  (1,4,2),
  (2,1,1),
  (3,1,8),
  (2,5,4),
  (2,3,3);
  
  
  
  
  