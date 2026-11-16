-- Table Creation

-- Table 1: Customer Details
CREATE TABLE Customer_Details
(
	Customer_Id INT IDENTITY(1,1),
	First_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50) NOT NULL,
	Phone VARCHAR(15),
	Email VARCHAR(100) NOT NULL,
	Password VARCHAR(255) NOT NULL,
	Created_At DATETIME2 DEFAULT SYSDATETIME(),

	CONSTRAINT PK_Customer_Details PRIMARY KEY(Customer_Id),
	CONSTRAINT UQ_Customer_Email UNIQUE (Email)
);
GO



-- Table 2: CUSTOMER ADDRESS
CREATE TABLE Customer_Address
(
    Address_Id INT IDENTITY(1,1),
    Customer_Id INT NOT NULL,
    Street VARCHAR(150) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Address_Type VARCHAR(20) DEFAULT 'Home',
    Is_Default BIT DEFAULT 0,

    CONSTRAINT PK_Customer_Address PRIMARY KEY (Address_Id),
    CONSTRAINT FK_CustomerAddress_Customer FOREIGN KEY (Customer_Id) REFERENCES Customer_Details(Customer_Id),
    CONSTRAINT UQ_CustomerAddress_Customer_Address UNIQUE (Customer_Id, Address_Id),
    CONSTRAINT CK_Customer_Address_Type CHECK (Address_Type IN ('Home', 'Office', 'Other'))

);
GO



-- TABLE 3: SUPPLIERS DETAILS
CREATE TABLE Suppliers_Details
(
    Supplier_Id INT IDENTITY(1,1),
    Supplier_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Created_At DATETIME2 DEFAULT SYSDATETIME(),
 
    CONSTRAINT PK_Suppliers_Details PRIMARY KEY (Supplier_Id),
    CONSTRAINT UQ_Supplier_Email UNIQUE (Email)
);
GO



-- TABLE 4: SUPPLIERS ADDRESS
CREATE TABLE Suppliers_Address
(
    Address_Id INT IDENTITY(1,1),
    Supplier_Id INT NOT NULL,
    Street VARCHAR(150) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pin_Code VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Address_Type VARCHAR(20) DEFAULT 'Office',

    CONSTRAINT PK_Suppliers_Address PRIMARY KEY (Address_Id),
    CONSTRAINT FK_SuppliersAddress_Supplier FOREIGN KEY (Supplier_Id) REFERENCES Suppliers_Details(Supplier_Id),
    CONSTRAINT CK_Supplier_Address_Type CHECK (Address_Type IN ('Office', 'Warehouse', 'Other'))
);
GO



-- TABLE 5: PRODUCT DETAILS
CREATE TABLE Product_Details
(
    Product_Id INT IDENTITY(1,1),
    Product_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT DEFAULT 0 NOT NULL,
    Offer_Percentage DECIMAL(5,2) DEFAULT 0 NOT NULL,
    Created_At DATETIME2 DEFAULT SYSDATETIME(),
    Is_Active BIT DEFAULT 1 NOT NULL,
 
    CONSTRAINT PK_Product_Details PRIMARY KEY (Product_Id),
    CONSTRAINT CK_Product_Price CHECK (Price > 0),
    CONSTRAINT CK_Product_Stock CHECK (Stock_Quantity >= 0),
    CONSTRAINT CK_Product_Offer CHECK (Offer_Percentage BETWEEN 0 AND 100)
);
GO



-- TABLE 6: SUPPLIER PRODUCTS
CREATE TABLE Supplier_Products
(
    Supplier_Id INT NOT NULL,
    Product_Id INT NOT NULL,
    Supplier_Price DECIMAL(10,2) NOT NULL,
    Lead_Time_Days INT DEFAULT 3 NOT NULL,

    CONSTRAINT PK_Supplier_Products PRIMARY KEY (Supplier_Id, Product_Id),
    CONSTRAINT FK_SupplierProducts_Supplier FOREIGN KEY (Supplier_Id) REFERENCES Suppliers_Details(Supplier_Id),
    CONSTRAINT FK_SupplierProducts_Product FOREIGN KEY (Product_Id) REFERENCES Product_Details(Product_Id),
    CONSTRAINT CK_Supplier_Price CHECK (Supplier_Price > 0),
    CONSTRAINT CK_Lead_Time CHECK (Lead_Time_Days >= 0)
);
GO



-- TABLE 7: ORDERS
CREATE TABLE Orders
(
    Order_Id INT IDENTITY(1,1),
    Customer_Id INT NOT NULL,
    Shipping_Address_Id INT NOT NULL,
    Order_Date DATETIME2 DEFAULT SYSDATETIME(),
    Total_Amount DECIMAL(12,2) DEFAULT 0 NOT NULL,
    Order_Status VARCHAR(20) DEFAULT 'Pending' NOT NULL,
 
    CONSTRAINT PK_Orders PRIMARY KEY (Order_Id),
    CONSTRAINT FK_Orders_Customer FOREIGN KEY (Customer_Id) REFERENCES Customer_Details(Customer_Id),
    CONSTRAINT FK_Orders_ShippingAddress FOREIGN KEY (Customer_Id, Shipping_Address_Id) REFERENCES Customer_Address(Customer_Id, Address_Id),
    CONSTRAINT CK_Order_Total CHECK (Total_Amount >= 0),
    CONSTRAINT CK_Order_Status CHECK(Order_Status IN('Pending','Processing','Shipped','Delivered','Cancelled'))
);
GO



-- TABLE 8: ORDER DETAILS
CREATE TABLE Order_Details
(
    Details_Id INT IDENTITY(1,1),
    Order_Id INT NOT NULL,
    Product_Id INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Discount_Amount DECIMAL(10,2) DEFAULT 0 NOT NULL,
 
    CONSTRAINT PK_Order_Details PRIMARY KEY (Details_Id),
    CONSTRAINT FK_OrderDetails_Order FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
    CONSTRAINT FK_OrderDetails_Product FOREIGN KEY (Product_Id) REFERENCES Product_Details(Product_Id),
    CONSTRAINT CK_OrderDetails_Quantity CHECK (Quantity > 0),
    CONSTRAINT CK_OrderDetails_UnitPrice CHECK (Unit_Price > 0),
 
    CONSTRAINT CK_OrderDetails_Discount CHECK(Discount_Amount >= 0 AND Discount_Amount <= Quantity * Unit_Price)
);
GO



-- TABLE 9: PAYMENT DETAILS
CREATE TABLE Payment_Details
(
    Payment_Id INT IDENTITY(1,1),
    Order_Id INT NOT NULL,
    Payment_Date DATETIME2 DEFAULT SYSDATETIME(),
    Payment_Mode VARCHAR(30) NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    Payment_Status VARCHAR(20) DEFAULT 'Pending' NOT NULL,
    Transaction_Reference VARCHAR(100),
 
    CONSTRAINT PK_Payment_Details PRIMARY KEY (Payment_Id),
    CONSTRAINT FK_PaymentDetails_Order FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
    CONSTRAINT CK_Payment_Amount CHECK (Amount > 0),
    CONSTRAINT CK_Payment_Mode CHECK(Payment_Mode IN('UPI','Card','Cash','NetBanking','Wallet')),
    CONSTRAINT CK_Payment_Status CHECK(Payment_Status IN('Pending','Success','Failed','Refunded'))
);
GO
 
-- Prevent duplicate non-null transaction references
CREATE UNIQUE INDEX UX_Payment_TransactionReference
ON Payment_Details(Transaction_Reference)
WHERE Transaction_Reference IS NOT NULL;
GO