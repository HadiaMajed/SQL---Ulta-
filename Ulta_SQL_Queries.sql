/*Create Tables for all Tables*/

/*Customer Create Table*/
CREATE TABLE Customer (
    Customer_ID     int NOT NULL PRIMARY KEY,
    CustomerName    varchar(255) NOT NULL,
    CustomerContact int,
    CustomerAddress text,
);
select * from Customer;

/*Categories Create Table*/
CREATE TABLE Categories (
    Category_ID   int NOT NULL PRIMARY KEY,
    Category_Name varchar(255) NOT NULL,
    Category_Type varchar(255) NOT NULL,
);
select * from Categories;

/*Shopping_Order Create Table*/
CREATE TABLE Shopping_Order (
    Order_ID    int NOT NULL PRIMARY KEY,
	Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	DateOfOrder Date
);
select * from Shopping_Order;

/*Deliveries Create Table*/
CREATE TABLE Deliveries (
    Delivery_ID int NOT NULL PRIMARY KEY,
    Order_ID	int FOREIGN KEY REFERENCES Shopping_Order(Order_ID),
    Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Product_ID  int FOREIGN KEY REFERENCES Products(Product_ID),
	DateOfDelivery Date
);
select * from Deliveries;

/*Products Create Table*/
CREATE TABLE Products (
    Product_ID int NOT NULL PRIMARY KEY,
    Category_ID int FOREIGN KEY REFERENCES Categories(Category_ID),
    Product_Name varchar(255)NOT NULL,
);
select * from Products;

/*Seller Create Table*/
CREATE TABLE Seller (
    Seller_ID int NOT NULL PRIMARY KEY,
	Product_ID int FOREIGN KEY REFERENCES Products(Product_ID),
    Seller_Name varchar(255) NOT NULL,
    Seller_PhoneNumber int,
);
select * from Seller;

/*Payments Create Table*/
CREATE TABLE Payments (
    Payment_ID int NOT NULL PRIMARY KEY,
    Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
    DateOfPayment Date
);
select * from Payments;

/* Transaction_Reports Create Table*/
CREATE TABLE Transaction_Reports (
    Reports_ID int NOT NULL PRIMARY KEY,
	Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
    Order_ID	int FOREIGN KEY REFERENCES Shopping_Order(Order_ID),
	Product_ID  int FOREIGN KEY REFERENCES Products(Product_ID),
	Payment_ID  int FOREIGN KEY REFERENCES Payments(Payment_ID),
	DateOfTransaction Date
);
select * from Transaction_Reports;

select * from Customer;
select * from Categories;
select * from Shopping_Order;
select * from Deliveries
select * from Products;
select * from Seller;
select * from Payments;
select * from Transaction_Reports;

/*****************************************************************************************************************************************/
/*Insert Tables for all Tables*/

select * from Customer;
INSERT INTO Customer (Customer_ID, CustomerName, CustomerContact, CustomerAddress)
VALUES (1, 'Jessica Ho', '546-443-7897', '33 Zoom Lane, Farmingdale NY, 11735'),
	   (2, 'Park Min-young', '532-791-3099', '25 Meenoi Lane, Levittown NY, 11756 '),
	   (3, 'Jamie Park', '520-446-9872', '25 Numbers Lane, Hicksville NY, 11801'),
	   (4, 'Park Chae-ryeong', '574-309-0211', '24 Horizon Lane , Oyster Bay NY, 11732'),
	   (5, 'Kim Hyun-jung', '587-500-9419', '32 Sunshine Lane , Bethpage NY, 11714'),
	   (6, 'Jeon Jiwoo', '558-200-8623', ' 26 Kard Lane, Hempstead NY, 11549');

ALTER TABLE Customer 
ALTER COLUMN CustomerContact text;
	   

select * from Categories;
INSERT INTO Categories(Category_ID, Category_Name, Category_Type)
VALUES (1, 'Makeup Gifts', 'Makeup'),
	   (2, 'Skin Gifts', 'Skincare'),
	   (3, 'Bath and Body Gifts', 'Bath'),
	   (4, 'Fragrance Gifts', 'Fragrance'),
	   (5, 'Hair Gifts', 'Haircare'),
	   (6, 'Tool and Brush Gifts', 'Tools and Brushes'),
	   (7, 'Mens Gifts', 'Men'),
	   (8, 'Nail Gifts', 'Nail'),
	   (9, 'Ulta Beauty Gifts', 'Ulta Beauty Collection');

	   
select * from Shopping_Order; 
INSERT INTO Shopping_Order(Order_ID, Customer_ID, DateOfOrder)
VALUES (1, 4, '2022-11-20'),
	   (2, 6, '2022-09-15'),
	   (3, 1, '2022-05-10'),
	   (4, 3, '2022-10-15'),
	   (5, 5, '2022-11-25'),
	   (6, 2, '2022-03-12'),
	   (7, 1, '2022-02-11'),
	   (8, 4, '2022-10-13'),
	   (9, 3, '2022-09-10');

	   
select * from Deliveries;  
INSERT INTO Deliveries(Delivery_ID, Order_ID, Customer_ID, Product_ID, DateOfDelivery)
VALUES (101,1, 4, 2536254, '2022-11-26'),
	   (202,2, 6, 2310188, '2022-09-20'),
	   (303,3, 1, 2598035, '2022-05-16'), 
	   (404,4, 3, 2602615, '2022-10-23'), 
	   (505,5, 5, 2600413, '2022-11-30'), 
	   (606,6, 2, 2598330, '2022-03-17'),
	   (707,7, 1, 2602082, '2022-02-21'), 
       (808,8, 4, 2598310, '2022-10-24'), 
	   (909,9, 3, 2602357, '2022-09-19'); 


select * from Products; 
INSERT INTO Products(Product_ID, Category_ID, Product_Name)
VALUES (2536254, 4, 'Ariana Grande - Cloud Eau de Parfum'),
       (2598035, 1, 'Cliniques Greatest Hits Set'),
	   (2602357, 7, 'Azzaro - The Most Wanted Gift Set'),
	   (2602615, 3, 'The Body Shop - Share Love & Joy Ultimate Advent Calendar'), 
	   (2598310, 9, 'Ulta Beauty Collection - 12 Days of Beauty Set'), 
	   (2600413, 5, 'Olaplex - Hair Repair Treatment Kit'),
	   (2310188, 6, 'Bio Ionic - 10X Pro Straightening & Styling Iron'),
	   (2598330, 2, 'Drunk Elephant - Trunk 6.0'),
	   (2602082, 8, 'Sally Hansen - Insta-Dri Merry & Bright Gift Set');
	   

select * from Seller;
INSERT INTO Seller(Seller_ID, Product_ID, Seller_Name, Seller_PhoneNumber)
VALUES (100, 2536254, 'Ulta', '578-266-0000'),
       (200, 2598035, 'Ulta', '509-223-1234'),
	   (300, 2602357, 'Ulta', '566-123-4321'),
	   (400, 2602615, 'Ulta', '599-543-7653'), 
	   (500, 2598310, 'Ulta', '511-984-9876'), 
	   (600, 2600413, 'Ulta', '555-098-9999'),
	   (700, 2310188, 'Ulta', '544-999-3355'),
	   (800, 2598330, 'Ulta', '577-880-8888'),
	   (900, 2602082, 'Ulta', '505-995-1110');

ALTER TABLE Seller
ALTER COLUMN Seller_PhoneNumber text;


select * from Payments; 
INSERT INTO Payments(Payment_ID, Customer_ID, DateOfPayment)
VALUES (111, 4,  '2022-11-22'),
	   (222, 6,  '2022-09-17'),
	   (333, 1,  '2022-05-13'), 
	   (444, 3,  '2022-10-18'), 
	   (555, 5,  '2022-11-28'), 
	   (666, 2,  '2022-03-15'),
	   (777, 1,  '2022-02-14'), 
       (888, 4,  '2022-10-16'), 
	   (999, 3,  '2022-09-13'); 

	   


select * from Transaction_Reports; 
INSERT INTO Transaction_Reports(Reports_ID, Customer_ID, Order_ID, Product_ID, Payment_ID, DateOfTransaction)
VALUES (1001, 4, 1, 2536254, 111, '2022-11-23'),
	   (2002, 6, 2, 2310188, 222, '2022-09-18'),
	   (3003, 1, 3, 2598035, 333, '2022-05-14'), 
	   (4004, 3, 4, 2602615, 444, '2022-10-19'), 
	   (5005, 5, 5, 2600413, 555, '2022-11-29'), 
	   (6006, 2, 6, 2598330, 666, '2022-03-16'),
	   (7007, 1, 7, 2602082, 777, '2022-02-15'), 
       (8008, 4, 8, 2598310, 888, '2022-10-17'), 
	   (9009, 3, 9, 2602357, 999, '2022-09-14');

/*****************************************************************************************************************************************/
/*Test Cases: Functions, Views, Triggers*/

/*Functions*/
/*Write a SELECT statement that returns 
. The DateofOrder column 
. A column that returns the four-digit year that’s stored in the DateofOrder column  
. A column that returns only the day of the month that’s stored in the DateofOrder column.
. A column that returns the result from adding thirty days to the DateofOrder column. */ 

select DateofOrder,
year(DateofOrder) as Year,
day(DateofOrder) as Day,
dateadd(day, 30, DateofOrder) as DateAdd
from Shopping_Order


/*Functions*/
/*Write a SELECT statement that returns 
. The Delivery_ID column 
. The DateOfDelivery column 
. A column named ApproxDeliveryDate that is calculated by adding 2 days to the DateOfDelivery column
. When you have this working, add a WHERE clause that retrieves just the delivery dates for November 2022.*/

SELECT Deliveries.Delivery_ID, DateOfDelivery,
dateadd(day, 2, DateOfDelivery) as ApproxDeliveryDate
FROM Deliveries
WHERE month(DateOfDelivery) = 11
AND year(DateOfDelivery) = 2022


/*Views*/
/*Create a view named vCustomerInfo that returns these columns:
a. Customer Name,Customer Contact, Date of Delivery, Delivery ID */
select * from Customer; select * from Deliveries; select * from Products;

CREATE VIEW vCustomerInfo
AS
SELECT C.CustomerName, C.CustomerContact, D.DateOfDelivery, D.Delivery_ID
FROM Customer AS C
JOIN Deliveries AS D ON  C.Customer_ID = D.Customer_ID
JOIN Products   AS P ON  D.Product_ID = P.Product_ID;

select * from vCustomerInfo;


/*Triggers*/ 
select * from Customer;

CREATE TRIGGER cCustomerAddress ON Customer
FOR UPDATE 
NOT FOR REPLICATION 
AS
BEGIN
  INSERT INTO CustomerAddress
  SELECT Customer_ID,CustomerContact
  FROM inserted
END


	   
	   
	   
        




