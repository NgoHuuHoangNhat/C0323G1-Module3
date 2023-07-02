use furama_management;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_employee as
select e.*
from employee e
join contract ctr on ctr.employee_id = e.employee_id
where ctr.contract_start_date = '2019-12-12'
and e.address like '%Hải Châu'
group by ctr.employee_id
having count(ctr.employee_id) >0;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET sql_safe_updates = 0;
update employee
join v_employee v_e on v_e.employee_id = employee.employee_id 
set employee.address = replace(employee.address, 'Hải Châu', 'Liên Chiểu')
where employee.employee_id in (
		select v_employee.employee_id
		from v_employee
);
SET sql_safe_updates = 1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
create procedure delete_customer(in customer_id int)
	begin
		SET FOREIGN_KEY_CHECKS = 0;
		
        delete from customer
        where customer.customer_id = customer_id;
        SET sql_safe_updates = 0;
        
        SET FOREIGN_KEY_CHECKS = 1;
	end //
DELIMITER ;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
create procedure add_new_contract(	in contract_start_date datetime, 
									in contract_end_date datetime,
                                    in deposit double,
                                    in employee_id int,
                                    in customer_id int,
                                    in service_id int
                                    )
	begin
		
		IF NOT EXISTS (	SELECT * FROM employee e 
							WHERE e.id_employee = id_employee) 
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nhân viên không tồn tại.';
		
        ELSEIF NOT EXISTS (	SELECT * 
							FROM customer ct 
                            WHERE ct.id_customer = id_customer) 
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khách hàng không tồn tại.';
		
        ELSEIF NOT EXISTS (	SELECT * 
							FROM service s 
                            WHERE s.id_service = id_service) 
			THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dịch vụ không tồn tại.';
		
        ELSE
			SET FOREIGN_KEY_CHECKS = 0;
			insert into contract(contract_start_date,contract_end_date,deposit,employee_id,customer_id,service_id)
			values (contract_start_date,contract_end_date,deposit,employee_id,customer_id,service_id);
			SET FOREIGN_KEY_CHECKS = 1;
        END IF;
        
	end //
DELIMITER ;

	-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
	-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
	-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
DELIMITER //
create trigger tr_delete_contract
after delete on contract
for each row
	begin
		declare count int;
        declare message varchar(255);
        select count(ctr.contract_id) into count
		from contract ctr;
        set message = concat('total number of contracts remaining ', count);
		signal sqlstate '45000' 
        set message_text =  message;
	end //
DELIMITER ;

drop trigger tr_delete_contract;
SET FOREIGN_KEY_CHECKS = 0;
delete from contract
where contract.contract_id = 12;
SET FOREIGN_KEY_CHECKS = 1;




