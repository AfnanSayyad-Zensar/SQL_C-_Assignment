-- Triggers


---- 1. Automatically Update Order Total
--CREATE OR ALTER TRIGGER trg_UpdateOrderTotal
--ON Order_Details
--AFTER INSERT, UPDATE, DELETE
--AS
--BEGIN
--    UPDATE Orders
--    SET Total_Amount = (
--        SELECT ISNULL(SUM(
--            (OD.Quantity * OD.Unit_Price) - OD.Discount_Amount
--        ), 0)
--        FROM Order_Details OD
--        WHERE OD.Order_Id = Orders.Order_Id
--    )
--    WHERE Order_Id IN (
--        SELECT Order_Id FROM inserted
--        UNION
--        SELECT Order_Id FROM deleted
--    );
--END;
--GO


---- 2. Automatically Update Product Stock
--CREATE OR ALTER TRIGGER trg_CheckProductStock
--ON Product_Details
--AFTER UPDATE
--AS
--BEGIN
--    IF EXISTS (
--        SELECT 1
--        FROM inserted
--        WHERE Stock_Quantity < 0
--    )
--    BEGIN
--        RAISERROR('Stock quantity cannot be negative.', 16, 1);
--        ROLLBACK TRANSACTION;
--    END;
--END;
--GO

---- Test 1st Trigger
---- Add another product to Order 3
--INSERT INTO Order_Details
--    (Order_Id, Product_Id, Quantity, Unit_Price, Discount_Amount)
--VALUES
--    (3, 4, 1, 1500, 0);
 
---- Check whether the order total was updated
--SELECT Order_Id, Total_Amount
--FROM Orders
--WHERE Order_Id = 3;

--DELETE FROM Order_Details
--WHERE Order_Id = 3 AND Product_Id = 4;