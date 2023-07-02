use furama_management;

select 	*
from service s
left join type_of_service t_o_s on t_o_s.type_of_service_id = s.type_of_service_id
left join contract c on c.service_id = s.service_id;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select 	s.service_id as 'mã dịch vụ', 
		s.service_name as 'tên dịch vụ',
		s.area_of_facility as 'diện tích', 
        s.rentail_fee as 'chi phí thuê',
        t_o_s.type_of_service_name as 'loại dịch vụ'
from service s	
join type_of_service t_o_s on t_o_s.type_of_service_id = s.type_of_service_id
WHERE s.service_id NOT IN (
    SELECT service_id
    FROM contract 
    WHERE MONTH(contract_start_date) IN (1, 2, 3) 
    AND YEAR(contract_start_date) = 2021
);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select 	s.service_id as 'mã dịch vụ',
		s.service_name as 'tên dịch vụ',
		s.area_of_facility as 'diện tích',
        s.max_people as 'số người tối da',
        s.rentail_fee as 'chi phí thuê',
		t_o_s.type_of_service_name as 'loại dịch vụ'
from service s
join type_of_service t_o_s on t_o_s.type_of_service_id = s.type_of_service_id
join contract c on c.service_id = s.service_id 
WHERE year(c.contract_start_date) = 2020
and s.service_id not in (
select s.service_id
from service s
join type_of_service t_o_s on t_o_s.type_of_service_id = s.type_of_service_id
join contract c on c.service_id = s.service_id 
where year(c.contract_start_date) = 2021
)
group by s.service_id;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select c.full_name
from customer c
group by c.full_name
order by c.full_name;

select c.full_name
from customer_type c_t
join customer c on c_t.customer_type_id = c.customer_type_id
group by c.full_name
order by c.full_name;

select c.full_name
from contract ctr
right join customer c on ctr.customer_id = c.customer_id
group by c.full_name
order by c.full_name;


-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 	month(c.contract_start_date) as 'tháng',
		count(month(c.contract_start_date)) as 'số lượng khách hàng'
from contract c
where year(c.contract_start_date) = 2021
group by month(c.contract_start_date)
order by month(c.contract_start_date);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 	ctr.contract_id as 'mã hợp đồng',
		ctr.contract_start_date as 'ngày bắt đầu',
		ctr.contract_end_date as 'ngày kết thúc',
		ctr.deposit as 'tiền đặt cọc',
        sum(c_d.quantity) as 'số lượng dịch vụ đi kèm' 
from contract ctr
left join contract_detail c_d on c_d.contract_id = ctr.contract_id
group by ctr.contract_id;




