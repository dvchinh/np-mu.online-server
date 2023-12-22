-- [ error ] suspect

-- sp_resetstatus tắt cờ “suspect”trên cơ sở dữ liệu
EXEC sp_resetstatus [DatabaseName]

--Đánh dấu cơ sở dữ liệu là READ_ONLY, 
--Tắt ghi Log và chỉ giới hạn quyền truy cập cho quyền xử lý hệ thống sysadmin
ALTER DATABASE [DatabaseName] SET EMERGENCY

--Kiểm tra tính logic và vật lý của tất cả các đối tượng trong cơ sở dữ liệu cần xử lý
DBCC checkdb([DatabaseName])

--Câu truy vấn này sẽ xử lý và khôi phục các giao dịch đang hoạt động trên database.
--Đưa CSDL SQL ở chế độ một người sử dụng.
ALTER DATABASE [DatabaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DBCC CheckDB ([DatabaseName], REPAIR_ALLOW_DATA_LOSS)

--Thiết lập lại CSDL cho về trạng thái ban đầu, cho phép login lại bình thường.
ALTER DATABASE [DatabaseName] SET MULTI_USER
