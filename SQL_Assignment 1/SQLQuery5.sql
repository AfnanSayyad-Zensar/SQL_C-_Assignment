-- Procedures


---- 1. Add a new Customer
--CREATE OR ALTER PROCEDURE sp_AddCustomer
--    @First_Name VARCHAR(50),
--    @Last_Name VARCHAR(50),
--    @Phone VARCHAR(15),
--    @Email VARCHAR(100),
--    @Password VARCHAR(255)
--AS
--BEGIN
--    INSERT INTO Customer_Details
--        (First_Name, Last_Name, Phone, Email, Password)
--    VALUES
--        (@First_Name, @Last_Name, @Phone, @Email, @Password);
 
--    PRINT 'Customer added successfully.';
 
--    SELECT SCOPE_IDENTITY() AS New_Customer_Id;
--END;
--GO
---- Test
--EXEC sp_AddCustomer
--    @First_Name = 'Karan',
--    @Last_Name = 'Patil',
--    @Phone = '9876543210',
--    @Email = 'karan@example.com',
--    @Password = 'DemoHash123';


---- 2. Update Order Status
--CREATE OR ALTER PROCEDURE sp_UpdateOrderStatus
--    @Order_Id INT,
--    @Order_Status VARCHAR(20)
--AS
--BEGIN
--    UPDATE Orders
--    SET Order_Status = @Order_Status
--    WHERE Order_Id = @Order_Id;
 
--    IF @@ROWCOUNT = 0
--        PRINT 'Order not found.';
--    ELSE
--        PRINT 'Order status updated successfully.';
--END;
--GO
---- Test
--EXEC sp_UpdateOrderStatus
--    @Order_Id = 3,
--    @Order_Status = 'Processing';


---- 3. Get orders of a customer
--CREATE OR ALTER PROCEDURE sp_GetCustomerOrders
--    @Customer_Id INT
--AS
--BEGIN
--    SELECT
--        Order_Id,
--        Order_Date,
--        Total_Amount,
--        Order_Status
--    FROM Orders
--    WHERE Customer_Id = @Customer_Id
--    ORDER BY Order_Date DESC;
--END;
--GO
---- Test
--EXEC sp_GetCustomerOrders @Customer_Id = 1;