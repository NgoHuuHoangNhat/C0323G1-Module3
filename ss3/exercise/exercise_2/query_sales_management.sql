use sales_management;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id,order_date,order_total_price
from order_product;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.customer_name as 'danh sách khách hàng', product.product_name as 'danh sách sản phẩm'
from customer
join order_product on order_product.customer_id = customer.customer_id 
join order_detail on order_detail.order_id = order_product.order_id
join product on product.product_id = order_detail.product_id; 

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.customer_name as 'danh sách khách hàng không mua sản phẩm'
from customer
left join order_product on order_product.customer_id = customer.customer_id 
where order_product.order_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
 
select order_product.order_id as 'mã hoá đơn', 
order_product.order_date as 'ngày bán',
sum(order_detail.order_quantity * product.product_price) as 'giá tiền của từng hoá đơn'
from order_product
join order_detail on order_detail.order_id = order_product.order_id
left join product on product.product_id = order_detail.product_id 
group by order_product.order_id;







 


