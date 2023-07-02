use furama_management;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;
delete from employee 
where employee.employee_id not in (
	select *
    from(
		select e.employee_id
        from employee e
        join contract ctr on ctr.employee_id = e.employee_id
        where ctr.contract_start_date between '2019-01-01' and '2021-12-31'
) as a
);
SET sql_safe_updates = 1;


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
create view total_fee_in_2021 as
select	c.customer_id
from customer_type c_t
join customer c on c.customer_type_id = c_t.customer_type_id
join contract ctr on ctr.customer_id = c.customer_id
join contract_detail c_d on c_d.contract_id = ctr.contract_id
join other_service o_s on o_s.other_service_id = c_d.other_service_id
join service s on s.service_id = ctr.service_id
where year(ctr.contract_start_date) = 2021 
and c_t.customer_type_name = 'Platinium'
group by c.customer_id
having sum(s.rentail_fee + c_d.quantity * o_s.price) >= 10000000
;

SET sql_safe_updates = 0;
update customer c
join customer_type c_t on c.customer_type_id = c_t.customer_type_id
join contract ctr on ctr.customer_id = c.customer_id
join total_fee_in_2021 t_f on t_f.customer_id = c.customer_id
set c.customer_type_id = 1
where c.customer_id in (
	select *
    from total_fee_in_2021
);
SET sql_safe_updates = 1;


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET sql_safe_updates = 0;
SET FOREIGN_KEY_CHECKS = 0; 

delete from customer
where  customer.customer_id in (
	select *
    from(
		select customer_id
        from contract
        where year(contract.contract_start_date) < 2021
    ) as p
);

SET FOREIGN_KEY_CHECKS = 1;
SET sql_safe_updates = 1;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update other_service 
join contract_detail on contract_detail.other_service_id = other_service.other_service_id
set other_service.price = other_service.price*2
where contract_detail.quantity > 10;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 	e.employee_id as 'mã',
		e.full_name as 'tên',
        e.email as 'email',
        e.phone_number as 'số điện thoại',
        e.date_of_birth as 'ngày sinh',
        e.address as 'địa chỉ',
        'nhân viên' as 'kiểu' 
from employee e 
union all
select 	c.customer_id,
		c.full_name,
        c.email,
        c.phone_number,
        c.date_of_birth,
        c.address,
        'khách hàng'
from customer c;




