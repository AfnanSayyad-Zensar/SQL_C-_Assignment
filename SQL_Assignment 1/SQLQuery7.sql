---- GROUP BY, JOIN, SUBQUERIES

---- 1. Display all customers from a particular city
--SELECT *
--FROM Customer_Details
--WHERE Customer_Id IN (
--    SELECT Customer_Id
--    FROM Customer_Address
--    WHERE City = 'Pune'
--);


---- 2. Display all products in descending order of price
--SELECT Product_Name, Price, Stock_Quantity
--FROM Product_Details
--ORDER BY Price DESC;


---- 3. Display customer names along with their order details (inner join)
--SELECT
--    C.First_Name,
--    C.Last_Name,
--    O.Order_Id,
--    O.Order_Date,
--    O.Total_Amount
--FROM Customer_Details C
--INNER JOIN Orders O
--    ON C.Customer_Id = O.Customer_Id;


---- 4. Display Products included in each order (multi join)
--SELECT
--    O.Order_Id,
--    P.Product_Name,
--    OD.Quantity,
--    OD.Unit_Price
--FROM Orders O
--JOIN Order_Details OD
--    ON O.Order_Id = OD.Order_Id
--JOIN Product_Details P
--    ON OD.Product_Id = P.Product_Id;


---- 5. Calculate total number of customers, products and orders (aggregate functions)
--SELECT COUNT(*) AS Total_Customers
--FROM Customer_Details;
 
--SELECT COUNT(*) AS Total_Products
--FROM Product_Details;
 
--SELECT COUNT(*) AS Total_Orders
--FROM Orders;



---- 6. Calculate the total number of orders placed by each customer (group by)
--SELECT
--    C.First_Name,
--    C.Last_Name,
--    COUNT(O.Order_Id) AS Total_Orders
--FROM Customer_Details C
--LEFT JOIN Orders O
--    ON C.Customer_Id = O.Customer_Id
--GROUP BY C.First_Name, C.Last_Name;



---- 7. Dsiplay products whose prices are greater than the average product price (subquery)
--SELECT Product_Name, Price
--FROM Product_Details
--WHERE Price > (
--    SELECT AVG(Price)
--    FROM Product_Details
--);



---- 8. Customers who have not placed any orders (left join)
--SELECT
--    C.Customer_Id,
--    C.First_Name,
--    C.Last_Name
--FROM Customer_Details C
--LEFT JOIN Orders O
--    ON C.Customer_Id = O.Customer_Id
--WHERE O.Order_Id IS NULL;


---- 9. Calculate the total sales amount for each order status (sum and group by)
--SELECT
--    Order_Status,
--    COUNT(*) AS Number_Of_Orders,
--    SUM(Total_Amount) AS Total_Sales
--FROM Orders
--GROUP BY Order_Status;