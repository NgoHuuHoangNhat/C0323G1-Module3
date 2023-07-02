use furama_managemnt;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from employee
where char_length(employee.full_name) <= 15 
and (substring_index(employee.full_name,' ',-1) like 'H%'
or substring_index(employee.full_name,' ',-1) like 'T%'
or substring_index(employee.full_name,' ',-1) like 'K%'
);

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from customer c
where (c.address like '%Đà Nẵng' or c.address like '%Quảng Trị') 
and (date_of_birth between date_sub(now(), interval 50 year) and date_sub(now(), interval 18 year))
;
 
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select full_name, count(*) as 'số lần đặt'
from contract ctr
join customer c on c.customer_id = ctr.customer_id 
join customer_type ct on ct.customer_type_id = c.customer_type_id
where ct.customer_type_name = 'diamond'
group by c.customer_id
order by count(*) asc; 

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select  c.customer_id,
		c.full_name,
		c_t.customer_type_name,
        ctr.contract_id,
        s.service_name,
        ctr.contract_start_date,
        ctr.contract_end_date,
        s.rentail_fee + c_d.quantity * o_s.price  as 'total'
from customer c
left join customer_type c_t on c.customer_type_id = c_t.customer_type_id
left join contract ctr on ctr.customer_id = c.customer_id
left join service s on s.service_id = ctr.service_id
left join contract_detail c_d on c_d.contract_id = ctr.contract_id
left join other_service o_s on o_s.other_service_id = c_d.other_service_id
;
