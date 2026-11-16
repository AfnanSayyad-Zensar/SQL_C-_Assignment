-- Data Insertion



-- 1. INSERT CUSTOMER DETAILS
 
--USE OrderProcessingDB;
--GO

--INSERT INTO Customer_Details(First_Name,Last_Name,Phone,Email,Password)
--VALUES
--('Rahul', 'Patil', '9876543210','rahul@gmail.com', 'DEMO_HASH_001'),
--('Priya', 'Sharma', '9876543211','priya@gmail.com', 'DEMO_HASH_002'),
--('Amit', 'Kumar', '9876543212','amit@gmail.com', 'DEMO_HASH_003'),
--('Sneha', 'Deshmukh', '9876543213','sneha@gmail.com', 'DEMO_HASH_004'),
--('Rohan', 'Joshi', '9876543214','rohan@gmail.com', 'DEMO_HASH_005');
--GO
 
--SELECT * FROM Customer_Details;


-- 2. INSERT CUSTOMER ADDRESSES
 
--INSERT INTO Customer_Address(Customer_Id,Street,City,State,Pincode,Country,Address_Type,Is_Default)
--VALUES
--(1, 'Sanjaynagar Road', 'Sangli', 'Maharashtra','416416', 'India', 'Home', 1), 
--(1, 'Kharadi IT Park Road', 'Pune', 'Maharashtra','411057', 'India', 'Office', 0),
--(2, 'Station Road', 'Pune', 'Maharashtra','411001', 'India', 'Home', 1),
--(3, 'MG Road', 'Mumbai', 'Maharashtra','400001', 'India', 'Home', 1),
--(4, 'College Road', 'Nashik', 'Maharashtra','422005', 'India', 'Home', 1),
--(5, 'Market Road', 'Kolhapur', 'Maharashtra','416003', 'India', 'Home', 1);
--GO
 
--SELECT * FROM Customer_Address;



-- 3. INSERT SUPPLIER DETAILS
 
--INSERT INTO Suppliers_Details(Supplier_Name,Email,Phone)
--VALUES
--('TechWorld Distributors','techworld@gmail.com', '9811111111'),
--('Global Electronics','global@gmail.com', '9822222222'),
--('Fashion Hub','fashionhub@gmail.com', '9833333333');
--GO
 
--SELECT * FROM Suppliers_Details;



-- 4. INSERT SUPPLIER ADDRESSES
 
--INSERT INTO Suppliers_Address (Supplier_Id,Street,City,State,Pin_Code,Country,Address_Type)
--VALUES
--(1, 'MIDC Industrial Area', 'Pune','Maharashtra', '411019', 'India', 'Warehouse'),
--(1, 'FC Road', 'Pune','Maharashtra', '411004', 'India', 'Office'),
--(2, 'Andheri Industrial Estate', 'Mumbai','Maharashtra', '400093', 'India', 'Warehouse'),
--(3, 'Textile Market', 'Surat','Gujarat', '395002', 'India', 'Office');
--GO
 
--SELECT * FROM Suppliers_Address;



-- 5. INSERT PRODUCT DETAILS
 
--INSERT INTO Product_Details (Product_Name,Description,Price,Stock_Quantity,Offer_Percentage,Is_Active)
--VALUES
--('Laptop', 'Dell Inspiron Laptop',55000, 10, 5, 1),
--('Smartphone', 'Samsung Galaxy Smartphone',25000, 20, 10, 1),
--('T-Shirt', 'Cotton Casual T-Shirt',799, 50, 15, 1),
--('Headphones', 'Wireless Bluetooth Headphones',1500, 30, 5, 1),
--('Office Chair', 'Ergonomic Office Chair',4500, 15, 0, 1),
--('Keyboard', 'Mechanical Gaming Keyboard',1200, 25, 10, 1),
--('Wireless Mouse', 'Optical Wireless Mouse',700, 40, 0, 1);
--GO
 
--SELECT * FROM Product_Details;


-- 6. INSERT SUPPLIER PRODUCTS

--INSERT INTO Supplier_Products(Supplier_Id,Product_Id,Supplier_Price,Lead_Time_Days)
--VALUES
--(1, 1, 50000, 4),
--(1, 2, 22000, 3),
--(1, 4, 1200, 2),
--(1, 6, 900, 2),
--(2, 1, 49000, 5),
--(2, 2, 21500, 4),
--(2, 7, 500, 2),
--(3, 3, 500, 3),
--(3, 5, 3500, 5);
--GO
 
--SELECT * FROM Supplier_Products;


-- 7. INSERT ORDERS

--INSERT INTO Orders(Customer_Id,Shipping_Address_Id,Order_Date,Total_Amount,Order_Status)
--VALUES
--(1, 1, DATEADD(DAY, -10, SYSDATETIME()),58000, 'Delivered'),
--(2, 3, DATEADD(DAY, -5, SYSDATETIME()),26200, 'Processing'),
--(3, 4, DATEADD(DAY, -2, SYSDATETIME()),2397, 'Pending'),
--(1, 2, DATEADD(DAY, -1, SYSDATETIME()),4500, 'Shipped'),
--(4, 5, SYSDATETIME(),55700, 'Delivered');
--GO
 
--SELECT * FROM Orders;


-- 8. INSERT ORDER DETAILS

--INSERT INTO Order_Details(Order_Id,Product_Id,Quantity,Unit_Price,Discount_Amount)
--VALUES
--(1, 1, 1, 55000, 0),
--(1, 4, 2, 1500, 0),
--(2, 2, 1, 25000, 0),
--(2, 6, 1, 1200, 0),
--(3, 3, 3, 799, 0),
--(4, 5, 1, 4500, 0),
--(5, 1, 1, 55000, 0),
--(5, 7, 1, 700, 0);
--GO
 
--SELECT * FROM Order_Details;


-- 9. INSERT PAYMENT DETAILS

--INSERT INTO Payment_Details(Order_Id,Payment_Date,Payment_Mode,Amount,Payment_Status,Transaction_Reference)
--VALUES
--(1, DATEADD(DAY, -10, SYSDATETIME()),'UPI', 58000, 'Success', 'TXN10001'),
--(2, DATEADD(DAY, -5, SYSDATETIME()),'Card', 26200, 'Success', 'TXN10002'),
--(3, DATEADD(DAY, -2, SYSDATETIME()),'Cash', 1000, 'Pending', NULL),
--(4, DATEADD(DAY, -1, SYSDATETIME()),'UPI', 4500, 'Success', 'TXN10004'),
--(5, SYSDATETIME(),'Card', 55700, 'Success', 'TXN10005');
--GO
 
--SELECT * FROM Payment_Details;