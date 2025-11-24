create database LibraryManagement;
use LibraryManagement;

-- Phần 1
-- Tạo bảng Books
Create table Books (
    BookId varchar(10) primary key,
    Title varchar(100) null,
    Author varchar (100),
    Price decimal(10,2),
    Quantity int
);

-- Tạo bảng Readers
Create table Readers (
    ReaderId varchar(10) primary key,
    ReaderName varchar(100) null,
    PhoneNumber varchar(15) unique,
    Address varchar(255)
);

-- Tạo bảng BorrowRecords
Create table BorrowRecords (
	ReaderId varchar(10),
    foreign key (ReaderId) references Readers(ReaderId),
    BookId varchar(10),
    foreign key (BookId) references Books(BookId),
    BorrowDate date,
    ReturnDate date,
    BorrowedQuantity int null
    );
    
-- Phần 2
-- Chèn dữ liệu mẫu vào bảng Books
Insert into Books (BookId, Title, Author, Price, Quantity) values
     ('S001', 'Dac Nhan Tam', 'Dale Carnegie', 80000, 20),
	 ('S002', 'Nha Gia Kim', 'Paulo Coelho', 75000, 15),
     ('S003', 'De Men Phieu Luu Ky', 'To Hoai', 50000, 30);

-- Chèn dữ liệu mẫu vào bảng Readers
Insert into Readers (ReaderId, ReaderName, PhoneNumber, Address) values
      ('DG01', 'Nguyen Thi Hue', '0987654321', 'Ha Noi'),
	  ('DG02', 'Tran Van Nam', '0981122334', 'Hai Duong'),
      ('DG03', 'Le Thi Lan', '0989988776', 'Ha Noi'),
      ('DG04', 'Pham Minh Khoi', '0912345678', 'Da Nang'),
      ('DG05', 'Hoang Van Dat', '0905123456', 'Ha Noi');

-- Chèn dữ liệu mẫu vào bảng BorrowRecords
Insert into BorrowRecords (ReaderId, BookId, BorrowDate, ReturnDate, BorrowedQuantity) values
      ('DG01', 'S001', '2023-11-01', '2023-11-08', 1),
      ('DG01', 'S002', '2023-11-05', '2023-11-12', 2),
      ('DG02', 'S001', '2023-11-10', NULL, 1) ,
      ('DG03', 'S003', '2023-11-15', '2023-11-20', 3),
      ('DG04', 'S002', '2023-11-15', NULL, 1),
      ('DG04', 'S003', '2023-11-18', NULL, 2),
      ('DG05', 'S001', '2023-11-20', '2023-11-25', 1);

-- Cập nhật giá tiền (Price) của sách 'S001' thành 90000
update Books
  Set Price = 90000
  where 'S001';

-- Cập nhật ngày trả (ReturnDate) cho độc giả  'DG02' mượn sách 'S001' thành '2023-11-17'.
update BorrowRecords
  Set ReturnDate = '2023-11-17'
  Where BookId = 'S001'
;

-- Xóa thông tin mượn sách của độc giả 'DG05' với sách 'S001'.
Delete borrowrecords
  From BookId S001
  where DG05;


-- Phần 3

-- Lấy ra danh sách các sách (BookId, Title, Author) của tác giả 'To Hoai'.
SELECT BookId, Title, Author
  FROM books
  Where Author = 'To Hoai';

-- Lấy ra danh sách các độc giả (ReaderId, ReaderName) có địa chỉ tại 'Ha Noi'.
Select ReaderId, ReaderName
  From readers
  Where Address = 'Ha Noi';

-- Lấy ra danh sách mượn sách (ReaderId, BookId, BorrowDate) mà chưa có ngày trả.
Select ReaderId, BookId, BorrowDate
  From BorrowRecords
  Where ReturnDate IS Null;

-- Tìm các sách có tên (Title) chứa từ "Nhan".
Select *
   From Books
   Where title like '%Nhan%';
   
   
-- Lấy ra danh sách mượn sách, sắp xếp theo Số lượng sách mượn (BorrowedQuantity) giảm dần.
SELECT *
FROM BorrowRecords
ORDER BY BorrowedQuantity DESC;

-- Lấy ra thông tin của 1 cuốn sách có giá tiền cao nhất.
SELECT *
FROM Books
ORDER BY Price DESC LIMIT 1;



    
 




































  
