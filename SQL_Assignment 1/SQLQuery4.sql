-- INDEXES

----1. Search orders using Customer_Id
--CREATE INDEX IX_Orders_CustomerId
--ON Orders(Customer_Id);
 
---- 2. Search orders by Order_Date
--CREATE INDEX IX_Orders_OrderDate
--ON Orders(Order_Date);
 
---- 3. Find order details using Order_Id
--CREATE INDEX IX_OrderDetails_OrderId
--ON Order_Details(Order_Id);
 
---- 4. Find payments using Order_Id
--CREATE INDEX IX_PaymentDetails_OrderId
--ON Payment_Details(Order_Id);
 
---- 5. Search products using Product_Name
--CREATE INDEX IX_ProductDetails_ProductName
--ON Product_Details(Product_Name);



---- VIEWS

-- 1. Customer Order Details View (displays customer information along with their orders)
--CREATE VIEW vw_CustomerOrders AS
--SELECT
--    O.Order_Id,
--    C.Customer_Id,
--    C.First_Name + ' ' + C.Last_Name AS Customer_Name,
--    O.Order_Date,
--    O.Total_Amount,
--    O.Order_Status
--FROM Orders O
--JOIN Customer_Details C
--    ON O.Customer_Id = C.Customer_Id;


-- 2. Order Product Details View (displays the products included in each order)
--CREATE VIEW vw_OrderProducts AS
--SELECT
--    OD.Details_Id,
--    OD.Order_Id,
--    P.Product_Name,
--    OD.Quantity,
--    OD.Unit_Price,
--    OD.Discount_Amount,
--    (OD.Quantity * OD.Unit_Price) - OD.Discount_Amount AS Line_Total
--FROM Order_Details OD
--JOIN Product_Details P
--    ON OD.Product_Id = P.Product_Id;


-- 3. Supplier Product Details View (displays which suppliers provide which products)
--CREATE VIEW vw_SupplierProducts AS
--SELECT
--    S.Supplier_Name,
--    P.Product_Name,
--    SP.Supplier_Price,
--    SP.Lead_Time_Days
--FROM Supplier_Products SP
--JOIN Suppliers_Details S
--    ON SP.Supplier_Id = S.Supplier_Id
--JOIN Product_Details P
--    ON SP.Product_Id = P.Product_Id;


---- Test the views
--SELECT * FROM vw_CustomerOrders;
 
--SELECT * FROM vw_OrderProducts;
 
--SELECT * FROM vw_SupplierProducts;