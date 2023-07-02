use furama_management;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select o_s.other_service_id, o_s.other_service_name
from other_service o_s
join contract_detail c_d on c_d.other_service_id = o_s.other_service_id
join contract ctr on ctr.contract_id = c_d.contract_id
join customer c on c.customer_id = ctr.customer_id
join customer_type c_t on c_t.customer_type_id = c.customer_type_id
where c_t.customer_type_name = 'Diamond'
and (c.address like '%Vinh'
or c.address like '%Quảng Ngãi')
;


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 	ctr.contract_id as 'mã hợp đồng',
		e.full_name as 'tên nhân viên',
		c.full_name as 'tên khách hàng',
        c.phone_number as 'số điện thoại khách hàng',
        s.service_name as 'tên dịch vụ',
        sum(c_d.quantity) as 'số lượng dịch vụ đi kèm',
        ctr.deposit as 'tiền đặt cọc'
from contract ctr
left join employee e on e.employee_id = ctr.employee_id
left join customer c on c.customer_id = ctr.customer_id
left join service s on s.service_id = ctr.service_id
left join contract_detail c_d on c_d.contract_id= ctr.contract_id
where (ctr.contract_start_date between '2020-10-01' and '2020-12-31')
and ctr.contract_id not in (
		select ctr.contract_id
		from contract ctr
		where year(ctr.contract_start_date) between '2021-01-01' and '2021-06-30'
)
group by ctr.contract_id;
 
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view sum_quantity as
select c_d.other_service_id, sum(c_d.quantity) as sum
from contract_detail c_d
group by c_d.other_service_id;

select	o_s.other_service_id as 'mã dịch vụ',
		o_s.other_service_name as 'tên dịch vụ đi kèm',
        s_q.sum as 'số lượng dịch vụ đi kèm'
from other_service o_s
join contract_detail c_d on c_d.other_service_id = o_s.other_service_id
join sum_quantity s_q on s_q.other_service_id = o_s.other_service_id
group by c_d.other_service_id
having s_q.sum = (
		select max(sum)
        from sum_quantity
)
;


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

create view other_service_count as
select c_d.other_service_id, count(c_d.other_service_id) as count
from contract_detail c_d
group by c_d.other_service_id
;
select 	ctr.contract_id as 'mã hợp đồng',
		t_o_s.type_of_service_name as 'loại dịch vụ',
        o_s.other_service_name as 'dịch vụ đi kèm',
        o_s_c.count as 'số lần sử dụng'
from other_service o_s
join contract_detail c_d on c_d.other_service_id = o_s.other_service_id
join contract ctr on ctr.contract_id = c_d.contract_id
join service s on s.service_id = ctr.service_id
join type_of_service t_o_s on t_o_s.type_of_service_id = s.type_of_service_id
join other_service_count o_s_c on o_s_c.other_service_id = o_s.other_service_id
where o_s_c.count = 1
;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
--  so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

create view count_booking as
select ctr.employee_id, count(ctr.employee_id) as count
from contract ctr
group by ctr.employee_id
;
select 	e.employee_id as 'mã nhân viên',
		e.full_name as 'tên nhân viên',
        e_l.employee_level_name as 'tên trình độ',
        r.role_name as 'tên bộ phận',
        e.phone_number as 'số điện thoại',
        e.address as 'địa chỉ'
from employee e
join employee_level e_l on e_l.employee_level_id = e.employee_level_id
join role r on r.role_id = e.role_id
join contract ctr on ctr.employee_id = e.employee_id
join count_booking c_b on c_b.employee_id = ctr.employee_id
where (ctr.contract_start_date between '2020-01-01' and '2021-12-31')
and c_b.count <= 3
;

