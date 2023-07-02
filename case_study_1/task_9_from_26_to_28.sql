use furama_management;

-- 26 Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc 
-- hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng
-- ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu 
-- không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn 
-- ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc 
-- ghi ở console.
DELIMITER //
create trigger tr_delete_contract
before update on contract
for each row
	begin
		
	end //
DELIMITER ;



-- 27. Tạo Function thực hiện yêu cầu sau:
-- a. Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng 
-- với tổng tiền là > 2.000.000 VNĐ.
-- b. Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời 
-- gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp 
-- đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các 
-- khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không 
-- xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được 
-- truyền vào như là 1 tham số của function này.


-- 28. Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ 
-- được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 
-- đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các 
-- bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ 
-- liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những 
-- bản liên quan khác