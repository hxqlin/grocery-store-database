/*  
removed some NOT NULL constraints for Product & Employee
Check that you are using correct data types and proper SQL syntax- need AND/OR clauses and semi-colons at the end of statements
Use correct departments eg. ‘Eggs and Dairy’ not ‘eggs’
Need to use straight quotation marks
Use correct data types
TODO: fill ProvidedBy, ReceivedFrom, ProvidesDelivery, and AisleContains with the rest of the products*/

DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS ReceivedFrom;
DROP TABLE IF EXISTS ProvidesDelivery;
DROP TABLE IF EXISTS ProvidedBy;
DROP TABLE IF EXISTS AisleContains;
DROP TABLE IF EXISTS Aisles;
DROP TABLE IF EXISTS Aisle;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customers(
    CustomerID SERIAL,
    CustomerName VARCHAR(255),
    CustomerPhone VARCHAR(255),
    CustomerEmail VARCHAR(255),
    PRIMARY KEY(CustomerID)
);


CREATE TABLE Departments(
    DepartmentName VARCHAR(255),
    PRIMARY KEY(DepartmentName)
);

CREATE TABLE Suppliers(
    SupplierID Serial,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierAddress VARCHAR(255),
    SupplierPhone VARCHAR(255) NOT NULL,
    PRIMARY KEY(SupplierID)
);

CREATE TABLE Employees(
    EmployeeID Serial,
    EmployeeName VARCHAR(255) NOT NULL,
    DepartmentName VARCHAR(255),
    Position VARCHAR(255),
    sinumber BIGINT NOT NULL,
    EmployeeAddress VARCHAR(255),
    EmployeePhone VARCHAR(255),
    Wage INT,
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(DepartmentName) REFERENCES Departments(DepartmentName)
);

CREATE TABLE Products(
    ProductID Serial,
    ProductName VARCHAR(255) NOT NULL,
    PricePerCostUnit FLOAT NOT NULL,
    CostUnit VARCHAR(255) NOT NULL,
    DepartmentName VARCHAR(255) NOT NULL,
    QuantityInStock INT,
    Brand VARCHAR(255),
    ProductionDate VARCHAR(255),
    BestBeforeDate VARCHAR(255),
    PLU INT,
    UPC BIGINT,
    Organic INT,
    Cut VARCHAR(255),
    Animal VARCHAR(255),
    PRIMARY KEY(ProductID),
    FOREIGN KEY(DepartmentName) REFERENCES Departments(DepartmentName)
);

CREATE TABLE Aisles(
    AisleNumber INT,
    AisleName VARCHAR(255) NOT NULL,
    PRIMARY KEY(AisleNumber)
);

CREATE TABLE AisleContains(
    AisleNumber INT,
    ProductID INT,
    PRIMARY KEY(AisleNumber, ProductID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY(AisleNumber) REFERENCES Aisles(AisleNumber)
);

CREATE TABLE ProvidedBy(
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY(SupplierID, ProductID),
    FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProvidesDelivery(
    DeliveryID Serial,
    SupplierID INT NOT NULL,
    PRIMARY KEY(DeliveryID),
    FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ReceivedFrom(
    ProductID INT,
    DeliveryID INT,
    PRIMARY KEY(ProductID, DeliveryID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY(DeliveryID) REFERENCES ProvidesDelivery(DeliveryID)
);

CREATE TABLE Purchases(
    TransactionID Serial,
    ProductID INT,
    Quantity INT,
    CustomerID INT,
    PurchaseDate VARCHAR(255),
    Total FLOAT,
    PRIMARY KEY(TransactionID, ProductID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

ALTER SEQUENCE Customers_CustomerID_seq restart with 1000;
ALTER SEQUENCE Suppliers_SupplierID_seq restart with 1000;
ALTER SEQUENCE Employees_EmployeeID_seq restart with 1000;
ALTER SEQUENCE Products_ProductID_seq restart with 1000;
ALTER SEQUENCE ProvidesDelivery_DeliveryID_seq restart with 1000;
ALTER SEQUENCE Purchases_TransactionID_seq restart with 1000;


-- start of customer insertion
INSERT INTO CUSTOMERS VALUES(1, 'Harry Potter', '000 731 1980', 'theboywholived@gmail.com');
INSERT INTO CUSTOMERS VALUES(2, 'Lily Potter', '000 731 1980', 'lpotter@gmail.com');
INSERT INTO CUSTOMERS VALUES(3, 'James Potter', '000 731 1980', 'jpotter@gmail.com');
INSERT INTO CUSTOMERS VALUES(4, 'Hermione Granger', '555 123 1979', 'hgranger@icloud.com');
INSERT INTO CUSTOMERS VALUES(5, 'Ron Weasley', '604 301 1979', 'roonilwazlib@hotmail.com');
INSERT INTO CUSTOMERS VALUES(6, 'Ginny Weasley', '778 872 1928', 'ginnyw@gmail.com');
INSERT INTO CUSTOMERS VALUES(7, 'Fred Weasley', '604 976 3693', 'fweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(8, 'George Weasley', '604 976 3693', 'gweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(9, 'Arthur Weasley', '604 976 3693', 'aweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(10, 'Molly Weasley', '604 976 3693', 'mweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(11, 'Percy Weasley', '604 976 3693', 'pweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(12, 'Bill Weasley', '604 976 3693', 'bweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(13, 'Charlie Weasley', '604 976 3693', 'cweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES(14, 'Lord Voldemort', '778 192 3928', 'tmriddle@hotmail.com');
INSERT INTO CUSTOMERS VALUES(15, 'Draco Malfoy', '908 392 1928', 'mini_mr_malfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES(16, 'Lucius Malfoy', '908 392 1928', 'lmalfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES(17, 'Narcissa Malfoy', '908 392 1928', 'nmalfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES(18, 'Neville Longbottom', '498 192 3091', 'longbottom@live.com');
INSERT INTO CUSTOMERS VALUES(19, 'Dudley Dursley', '930 409 9380', 'ddursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES(20, 'Vernon Dursley', '930 409 9380', 'vdursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES(21, 'Petunia Dursley', '930 409 9380', 'pdursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES(22, 'Severus Snape', '928 182 0493', 'snivellus@gmail.com');
INSERT INTO CUSTOMERS VALUES(23, 'Rubeus Hagrid', '458 392 1029', 'rhagrid@hotmail.com');
INSERT INTO CUSTOMERS VALUES(24, 'Minverva McGonagall', '893 928 0933', 'mmcgonagall@gmail.com');
INSERT INTO CUSTOMERS VALUES(25, 'Albus Dumbledore', '920 849 9145', 'adumbledore@gmail.com');
INSERT INTO CUSTOMERS VALUES(26, 'Hedwig', '839 920 1234', 'im_actually_an_owl@hotmail.com');
INSERT INTO CUSTOMERS VALUES(27, 'Crookshanks', '555 983 0298', 'cat@icloud.com');
INSERT INTO CUSTOMERS VALUES(28, 'Sirius Black', '649 563 4723', 'sblack@gmail.com');
INSERT INTO CUSTOMERS VALUES(29, 'Lavender Brown', '604 983 6941', 'lbrown@hotmail.com');
INSERT INTO CUSTOMERS VALUES(30, 'Colin Creevey', '778 961 6435', 'ccreevey@gmail.com');

-- start of supplier insertion
INSERT INTO SUPPLIERS VALUES(1, 'Saputo Dairy Products Canada', '6800 Lougheed Highway, Burnaby, BC V5A 1W2', '1 800 672 8866');
INSERT INTO SUPPLIERS VALUES(2, 'Gordon Food Services', '1700 Cliveden Avenue, Delta, BC V3M 6T2', '800 663 1695');
INSERT INTO SUPPLIERS VALUES(3, 'Yen Bros. Food Service', '1988 Vernon Drive, Vancouver, BC V6A 3Y6', '604 255 6522');
INSERT INTO SUPPLIERS VALUES(4, 'Arctic Meat & Sausage', '1606 Kebet Way, Port Coquitlam, BC V3C 5W9', '604 472 9995');
INSERT INTO SUPPLIERS VALUES(5, 'Lekker Food Distribution Ltd.', '2670 Wilfert Road, Victoria, BC V9B 5Z3', '877 788 0377');
INSERT INTO SUPPLIERS VALUES(6, 'Get Sauced & Spiced Inc.', '58 Avenue, Surrey, BC V8H 4S9', '780 462 2418');
INSERT INTO SUPPLIERS VALUES(7, 'Orkin Canada', '123 Missisauga Street, Vancouver, BC V7A 0E3', '800 800 6754');
INSERT INTO SUPPLIERS VALUES(8, 'Grainworks Inc.', '921 Vulcan Avenue, Richmond, BC V8A 3H1', '800 563 3756');
INSERT INTO SUPPLIERS VALUES(9, 'Harvest Corporation', '249 Missisauga Street, Vancouver, BC V9U 1H3', '888 925 6644');
INSERT INTO SUPPLIERS VALUES(10, 'The Leaky Cauldron', '938 Diagon Alley, London, UK, EC', '800 172 4532');
INSERT INTO SUPPLIERS VALUES(11, 'Bondi Produce', '188 New Toronto St, Etobicoke, ON M8V 2E8', '416 252-7799');
INSERT INTO SUPPLIERS VALUES(12, 'Augusta Fruit Market Ltd', '65 Nassau St, Toronto, ON M5T 1M3', '416 593-9754');
INSERT INTO SUPPLIERS VALUES(13, 'Castle Fruit Retail & Wholesale Produce', '80 Kensington Ave, Toronto, ON M5T 2K1', '416 593-9262');
INSERT INTO SUPPLIERS VALUES(14, 'Venerica Meat', '3348 Dundas St W, Toronto, ON M6P 2A4', '416 623-7878');
INSERT INTO SUPPLIERS VALUES(15, 'Avalon Dairy', '7985 N Fraser Way, Burnaby, BC V5J 4Z5', '604 456-0550');
INSERT INTO SUPPLIERS VALUES(16, 'Smokey Bay Seafood Company Ltd', '896 Cambie St, Vancouver, BC V6B 2P4', '604 568-4310');
INSERT INTO SUPPLIERS VALUES(17, 'Oceanfood Sales', '1909 E Hastings St, Vancouver, BC V5L 1T5', '604 255-1414');
INSERT INTO SUPPLIERS VALUES(18, 'Deluxe Seafood Vancouver Ltd', '#106-366 East Kent Ave, South Vancouver, BC V5X 4N6', '604 662-7999');
INSERT INTO SUPPLIERS VALUES(19, 'Winning Seafood Co', '1568 Venables St, Vancouver, BC V5L 2G9', '604 251-3121');
INSERT INTO SUPPLIERS VALUES(20, 'Blundell Seafoods Ltd', '11351 River Rd, Richmond, BC V6X 1Z6', '604 270-3300');

-- start of department insertion
INSERT INTO DEPARTMENTS VALUES('Produce');
INSERT INTO DEPARTMENTS VALUES('Meat and Seafood');
INSERT INTO DEPARTMENTS VALUES('Baked Goods');
INSERT INTO DEPARTMENTS VALUES('Pantry Items');
INSERT INTO DEPARTMENTS VALUES('Eggs and Dairy');

-- start of employee insertion
INSERT INTO EMPLOYEES VALUES(1, 'Ben Ling', 'Eggs and Dairy', 'Stocker', 948398198, '2366 Main Mall, Vancouver, BC VH3 0A2', '604 822 3061', 0);
INSERT INTO EMPLOYEES VALUES(2, 'Daenerys Targaryen', 'Eggs and Dairy', 'Manager', 7685437775, '123 House Targaryen, Dragonstone, BC VK8 2H9', '777 777 7777', 0);
INSERT INTO EMPLOYEES VALUES(3, 'Jon Snow', 'Meat and Seafood', 'Manager', 901982091, '224 Winter Is Coming, North, BC, VA7 4K8', '783 309 1923', 0);
INSERT INTO EMPLOYEES VALUES(4, 'Samwell Tarly', 'Meat and Seafood', 'Stocker', 971361789, '3366 Main Mall, Vancouver, BC V1M 3A0', '604 699 6993', 10);
INSERT INTO EMPLOYEES VALUES(5, 'Eddard Stark', 'Produce', 'Stocker', 993156678, '9899 East Mall, Vancouver, BC V0A 9L6', '778 896 3644', 10);
INSERT INTO EMPLOYEES VALUES(6, 'Sansa Stark', 'Pantry Items', 'Manager', 935986412, '9899 East Mall, Vancouver, BC V0A 9L6', '778 896 3644', 20);
INSERT INTO EMPLOYEES VALUES(7, 'Arya Stark', 'Eggs and Dairy', 'Manager', 964799315, '9899 East Mall, Vancouver, BC V0A 9L6', '778 896 3644', 20);
INSERT INTO EMPLOYEES VALUES(8, 'Bran Stark', 'Produce', 'Stocker', 911364899, '9899 East Mall, Vancouver, BC V0A 9L6', '778 896 3644', 10);
INSERT INTO EMPLOYEES VALUES(9, 'Robb Stark', 'Pantry Items', 'Stocker', 944651997, '9899 East Mall, Vancouver, BC V0A 9L6', '778 896 3644', 10);
INSERT INTO EMPLOYEES VALUES(10, 'Margaery Tyrell', 'Baked Goods', 'Manager', 961694366, '226 Main Street, Highgarden, BC, V7L 3H7', '778 962 2264', 20);
INSERT INTO EMPLOYEES VALUES(11, 'Khal Drogo', 'Eggs and Dairy', 'Stocker', 943116456, '6324 West Mall, Vancouver, BC, V7A 5M5', '604 443 6187', 10);
INSERT INTO EMPLOYEES VALUES(12, 'Yuchen Lin', 'Pantry Items', 'Stocker', 986456189, '999 Brilliant Boy Ave, Vancouver, BC, V8P 9L1', '976 359 1659', 10);
INSERT INTO EMPLOYEES VALUES(13, 'Hannah Lin', 'Produce', 'Manager', 933641391, '1616 East Mall, Vancouver, BC, V0L 3M1', '604 919 3136', 20);
INSERT INTO EMPLOYEES VALUES(14, 'Jordan De Mello', 'Baked Goods', 'Manager', 976131971, '2525 West Mall, Vancouver, BC, V0L 3A3', '778 689 1369', 20);
INSERT INTO EMPLOYEES VALUES(15, 'Ed Knorr', 'Produce', 'Stocker', 931236761, '988 Database Drive, Vancouver, BC, V0L 9A3', '604 977 2163', 10);

-- start of product insertion
-- produce
INSERT INTO PRODUCTS VALUES(1, 'Apples (Ambrosia)', 1.59, 'lb', 'Produce', 25, null, '12-01-2017', '12-15-2017', 3438, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(2, 'Apples (Fuji)', 1.49, 'lb', 'Produce', 30, null, '12-09-2017', '12-23-2017', 4129, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(3, 'Apples (Gala)', 1.19, 'lb', 'Produce', 30, null, '12-07-2017', '12-21-2017', 4133, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(4, 'Apples (Gala)', 1.29, 'lb', 'Produce', 15, null, '12-05-2017', '12-19-2017', 94133, null, 1, null, null);
INSERT INTO PRODUCTS VALUES(5, 'Apples (Granny Smith)', 1.39, 'lb', 'Produce', 15, null, '12-05-2017', '12-19-2017', 4017, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(6, 'Bananas', 0.79, 'lb', 'Produce', 50, null, '12-19-2017', '12-23-2017', 4011, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(7, 'Bananas', 0.99, 'lb', 'Produce', 50, null, '12-19-2017', '12-23-2017', 94011, null, 1, null, null);
INSERT INTO PRODUCTS VALUES(8, 'Oranges (Navel)', 1.19, 'lb', 'Produce', 30, null, '12-10-2017', '12-24-2017', 4012, null, 1, null, null);
INSERT INTO PRODUCTS VALUES(9, 'Oranges (Valencia)', 1.29, 'lb', 'Produce', 20, null, '12-06-2017', '12-25-2017', 4013, null, 1, null, null);
INSERT INTO PRODUCTS VALUES(10, 'Strawberries', 4.99, 'lb', 'Produce', 20, null, '12-10-2017', '12-13-2017', 3355, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(11, 'Blueberries', 3.99, 'lb', 'Produce', 60, null, '12-10-2017', '12-13-2017', 4240, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(12, 'Raspberries', 3.49, 'lb', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4244, null, 0, null, null);

INSERT INTO PRODUCTS VALUES(13, 'Lettuce (Iceberg)', 0.99, 'ct', 'Produce', 20, null, '12-01-2017', '12-08-2017', 4061, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(14, 'Lettuce (Romaine)', 1.29, 'ct', 'Produce', 20, null, '12-02-2017', '12-09-2017', 3097, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(15, 'Spinach', 1.59, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4090, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(16, 'Watercress', 1.99, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4815, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(17, 'Bok Choy (Baby)', 1.29, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4545, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(18, 'Bok Choy (Shanghai)', 0.99, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 3163, null, 0, null, null);

INSERT INTO PRODUCTS VALUES(19, 'Potatoes (Russet)', 0.99, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4072, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(20, 'Potatoes (Red)', 1.29, 'lb', 'Produce', 20, null, '12-02-2017', '12-31-2017', 4073, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(21, 'Potatoes (Sweet)', 1.49, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4726, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(22, 'Squash (Acorn)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 3143, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(23, 'Squash (Kabocha)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4769, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(24, 'Squash (Butternut)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4759, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(25, 'Carrots (Loose)', 1.29, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4562, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(26, 'Carrots (Loose)', 1.49, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 94562, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(27, 'Onions (Red)', 1.29, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4082, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(28, 'Onions (Yellow)', 1.29, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4093, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(29, 'Onions (White)', 1.19, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4663, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(30, 'Onions (Pearl)', 2.49, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4660, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(31, 'Garlic', 3.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 3399, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(32, 'Ginger', 2.49, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4612, null, 0, null, null);

-- dairy (need to fix UPC & PRODUCTS IDs)
INSERT INTO PRODUCTS VALUES(100, 'Milk (Skim)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125003, 0, null, null);
INSERT INTO PRODUCTS VALUES(101, 'Milk (1%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125004, 0, null, null);
INSERT INTO PRODUCTS VALUES(102, 'Milk (2%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125005, 0, null, null);
INSERT INTO PRODUCTS VALUES(103, 'Milk (Whole)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125006, 0, null, null);
INSERT INTO PRODUCTS VALUES(104, 'Half and Half (10%)', 2.99, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125007, 0, null, null);
INSERT INTO PRODUCTS VALUES(105, 'Milk (Skim)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125008, 1, null, null);
INSERT INTO PRODUCTS VALUES(106, 'Milk (1%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125009, 1, null, null);
INSERT INTO PRODUCTS VALUES(107, 'Milk (2%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125010, 1, null, null);
INSERT INTO PRODUCTS VALUES(108, 'Milk (Whole)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125011, 1, null, null);
INSERT INTO PRODUCTS VALUES(109, 'Milk (2% Chocolate)', 2.99, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125011, 1, null, null);
INSERT INTO PRODUCTS VALUES(110, 'Milk (Soy)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 1, null, null);
INSERT INTO PRODUCTS VALUES(111, 'Milk (Unsweetened Soy)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 1, null, null);
INSERT INTO PRODUCTS VALUES(112, 'Yogurt (Vanilla, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCTS VALUES(113, 'Yogurt (Vanilla, 6-pack)', 4.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 1, null, null);
INSERT INTO PRODUCTS VALUES(114, 'Yogurt (Strawberry, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCTS VALUES(115, 'Yogurt (Fat-free, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCTS VALUES(116, 'Butter (Salted)', 3.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCTS VALUES(117, 'Butter (Unsalted)', 3.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCTS VALUES(118, 'Cheese (Mozzarella)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCTS VALUES(119, 'Cheese (Cheddar)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCTS VALUES(120, 'Cheese (Parmesan)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);

-- eggs
INSERT INTO PRODUCTS VALUES(150, 'Eggs (12 count)', 3.99, 'pack', 'Eggs and Dairy', 10, 'Kirkland Signature', '12-01-2017', '12-20-2017', null, 062639410124, 0, null, null);
INSERT INTO PRODUCTS VALUES(151, 'Eggs (Brown, 12 count)', 4.99, 'pack', 'Eggs and Dairy', 10, 'Golden Valley', '12-01-2017', '12-20-2017', null, 062639410125, 0, null, null);
INSERT INTO PRODUCTS VALUES(152, 'Eggs (Omega-3, 12 count)', 5.99, 'pack', 'Eggs and Dairy', 10, 'Born 3 Omega-3', '12-01-2017', '12-20-2017', null, 666933900420, 0, null, null);

-- meat
INSERT INTO PRODUCTS VALUES(200, 'Chicken Breast', 5.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823921, 0, null, 'Chicken');
INSERT INTO PRODUCTS VALUES(201, 'Chicken Breast', 6.99, 'lb', 'Meat and Seafood', 10, 'Green Way', '12-05-2017', '12-07-2017', null, 233841823920, 1, null, 'Chicken');
INSERT INTO PRODUCTS VALUES(202, 'Chicken Thighs', 4.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823919, 0, null, 'Chicken');
INSERT INTO PRODUCTS VALUES(203, 'Stew Meat', 7.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-05-2017', '12-08-2017', null, 233841823910, 0, 'Chuck', 'Beef');
INSERT INTO PRODUCTS VALUES(204, 'Ground Beef', 4.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823821, 0, null, 'Beef');
INSERT INTO PRODUCTS VALUES(205, 'Steak', 6.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-05-2017', '12-07-2017', null, 233841823822, 0, 'Sirloin', 'Beef');
INSERT INTO PRODUCTS VALUES(206, 'Steak', 7.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-01-2017', '12-03-2017', null, 233841823823, 0, 'Flank', 'Beef');
INSERT INTO PRODUCTS VALUES(207, 'Steak', 7.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-05-2017', '12-08-2017', null, 233841823824, 0, 'Tenderloin', 'Beef');
INSERT INTO PRODUCTS VALUES(208, 'Cod Fillets', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823825, 0, 'Fillet', 'Cod');
INSERT INTO PRODUCTS VALUES(209, 'Sole Fillets', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823826, 0, 'Fillet', 'Sole');
INSERT INTO PRODUCTS VALUES(210, 'Tilapia (Fresh)', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823827, 0, null, 'Tilapia');
INSERT INTO PRODUCTS VALUES(211, 'Salmon (Fresh)', 7.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823828, 0, 'Fillet', 'Salmon');
INSERT INTO PRODUCTS VALUES(212, 'Salmon (Fresh)', 8.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823829, 1, 'Fillet', 'Salmon');

-- baked goods
INSERT INTO PRODUCTS VALUES(300, 'Bread (White)', 2.99, 'ct', 'Baked Goods', 5, 'Villagio', '12-01-2017', '12-06-2017', null, 006872100350, 0, null, null);
INSERT INTO PRODUCTS VALUES(301, 'Bread (Whole Wheat)', 3.99, 'ct', 'Baked Goods', 5, 'Pepperidge Farms', '12-01-2017', '12-06-2017', null, 014100071013, 0, null, null);
INSERT INTO PRODUCTS VALUES(302, 'Everything Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Sara Lee', '12-01-2017', '12-06-2017', null, 072945610033, 0, null, null);
INSERT INTO PRODUCTS VALUES(303, 'Mini Cinnamon Raisin Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Pepperidge Farms', '12-01-2017', '12-06-2017', null, 014100092599, 0, null, null);
INSERT INTO PRODUCTS VALUES(304, 'Bread (Rye)', 3.99, 'ct', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 014100071013, 1, null, null);
INSERT INTO PRODUCTS VALUES(305, 'Bread (Spelt)', 4.99, 'ct', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 072945610033, 1, null, null);
INSERT INTO PRODUCTS VALUES(306, 'Sprouted Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 014100092599, 1, null, null);
INSERT INTO PRODUCTS VALUES(307, 'Doughnut', 0.99, 'ct', 'Baked Goods', 5, 'Bake Shop', '12-01-2017', '12-03-2017', null, null, 0, null, null);

-- pantry items
INSERT INTO PRODUCTS VALUES(400, 'All-Purpose Flour (Original)', 1.19, 'lb', 'Pantry Items', 30, 'Robin Hood', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(401, 'All-Purpose Flour (Whole Wheat)', 1.29, 'lb', 'Pantry Items', 30, 'Robin Hood', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(402, 'White Sugar', 0.89, 'lb', 'Pantry Items', 30, 'Rogers', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(403, 'Brown Sugar', 0.99, 'lb', 'Pantry Items', 30, 'Rogers', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(404, 'Iodized Table Salt', 0.49, 'lb', 'Pantry Items', 30, 'Windsor', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(405, 'Black Pepper', 0.59, 'lb', 'Pantry Items', 30, 'Windsor', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(406, 'Ground Cinnamon', 3.99, 'lb', 'Pantry Items', 30, 'Club House', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(407, 'Chili Flakes', 4.59, 'lb', 'Pantry Items', 30, 'Club House', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(408, 'White Rice', 1.59, 'lb', 'Pantry Items', 30, 'Rooster', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(409, 'Scoobi Do Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(410, 'Fusili', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(411, 'Penne Rigate', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(412, 'Elbow Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(413, 'Spaghetti', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(414, 'Linguini', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(415, 'Spaghettini', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(416, 'Farfalle', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(417, 'Ditali', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(418, 'Fusili', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(419, 'Penne Rigate', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(420, 'Elbow Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(421, 'Spaghetti', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(422, 'Linguini', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCTS VALUES(423, 'Sriracha Chili Sauce', 2.99, 'ct', 'Pantry Items', 10, 'Huy Fong', '11-01-2017', '12-31-2017', null, 024463061095, 0, null, null);
INSERT INTO PRODUCTS VALUES(424, 'Tomato Ketchup', 3.99, 'ct', 'Pantry Items', 10, 'Heinz', '11-01-2017', '12-31-2017', null, 013000001243, 0, null, null);
INSERT INTO PRODUCTS VALUES(425, 'Soy Sauce', 3.99, 'ct', 'Pantry Items', 10, 'Kikkoman', '11-01-2017', '12-31-2017', null, 041390000829, 0, null, null);

-- aisles
INSERT INTO AISLES VALUES(1, 'Fruits');
INSERT INTO AISLES VALUES(2, 'Vegetables');
INSERT INTO AISLES VALUES(3, 'Dairy');
INSERT INTO AISLES VALUES(4, 'Eggs');
INSERT INTO AISLES VALUES(5, 'Meats');
INSERT INTO AISLES VALUES(6, 'Seafood');
INSERT INTO AISLES VALUES(7, 'Baked Goods');
INSERT INTO AISLES VALUES(8, 'Pantry Items');

INSERT INTO AISLECONTAINS VALUES(1, 1);
INSERT INTO AISLECONTAINS VALUES(1, 2);
INSERT INTO AISLECONTAINS VALUES(1, 3);
INSERT INTO AISLECONTAINS VALUES(1, 4);
INSERT INTO AISLECONTAINS VALUES(1, 5);
INSERT INTO AISLECONTAINS VALUES(1, 6);
INSERT INTO AISLECONTAINS VALUES(1, 7);
INSERT INTO AISLECONTAINS VALUES(1, 8);
INSERT INTO AISLECONTAINS VALUES(1, 9);
INSERT INTO AISLECONTAINS VALUES(1, 10);
INSERT INTO AISLECONTAINS VALUES(1, 11);
INSERT INTO AISLECONTAINS VALUES(1, 12);
INSERT INTO AISLECONTAINS VALUES(2, 13);
INSERT INTO AISLECONTAINS VALUES(2, 14);
INSERT INTO AISLECONTAINS VALUES(2, 15);
INSERT INTO AISLECONTAINS VALUES(2, 16);
INSERT INTO AISLECONTAINS VALUES(2, 17);
INSERT INTO AISLECONTAINS VALUES(2, 18);
INSERT INTO AISLECONTAINS VALUES(2, 19);
INSERT INTO AISLECONTAINS VALUES(2, 20);
INSERT INTO AISLECONTAINS VALUES(2, 21);
INSERT INTO AISLECONTAINS VALUES(2, 22);
INSERT INTO AISLECONTAINS VALUES(2, 23);
INSERT INTO AISLECONTAINS VALUES(2, 24);
INSERT INTO AISLECONTAINS VALUES(2, 25);
INSERT INTO AISLECONTAINS VALUES(2, 26);
INSERT INTO AISLECONTAINS VALUES(2, 27);
INSERT INTO AISLECONTAINS VALUES(2, 28);
INSERT INTO AISLECONTAINS VALUES(2, 29);
INSERT INTO AISLECONTAINS VALUES(2, 30);
INSERT INTO AISLECONTAINS VALUES(2, 31);
INSERT INTO AISLECONTAINS VALUES(2, 32);
INSERT INTO AISLECONTAINS VALUES(3, 100);
INSERT INTO AISLECONTAINS VALUES(3, 101);
INSERT INTO AISLECONTAINS VALUES(3, 102);
INSERT INTO AISLECONTAINS VALUES(3, 103);
INSERT INTO AISLECONTAINS VALUES(3, 104);
INSERT INTO AISLECONTAINS VALUES(3, 105);
INSERT INTO AISLECONTAINS VALUES(3, 106);
INSERT INTO AISLECONTAINS VALUES(3, 107);
INSERT INTO AISLECONTAINS VALUES(3, 108);
INSERT INTO AISLECONTAINS VALUES(3, 109);
INSERT INTO AISLECONTAINS VALUES(3, 110);
INSERT INTO AISLECONTAINS VALUES(3, 111);
INSERT INTO AISLECONTAINS VALUES(3, 112);
INSERT INTO AISLECONTAINS VALUES(3, 113);
INSERT INTO AISLECONTAINS VALUES(3, 114);
INSERT INTO AISLECONTAINS VALUES(3, 115);
INSERT INTO AISLECONTAINS VALUES(3, 116);
INSERT INTO AISLECONTAINS VALUES(3, 117);
INSERT INTO AISLECONTAINS VALUES(3, 118);
INSERT INTO AISLECONTAINS VALUES(3, 119);
INSERT INTO AISLECONTAINS VALUES(3, 120);
INSERT INTO AISLECONTAINS VALUES(4, 150);
INSERT INTO AISLECONTAINS VALUES(4, 151);
INSERT INTO AISLECONTAINS VALUES(4, 152);
INSERT INTO AISLECONTAINS VALUES(5, 200);
INSERT INTO AISLECONTAINS VALUES(5, 201);
INSERT INTO AISLECONTAINS VALUES(5, 202);
INSERT INTO AISLECONTAINS VALUES(5, 203);
INSERT INTO AISLECONTAINS VALUES(5, 204);
INSERT INTO AISLECONTAINS VALUES(5, 205);
INSERT INTO AISLECONTAINS VALUES(5, 206);
INSERT INTO AISLECONTAINS VALUES(5, 207);
INSERT INTO AISLECONTAINS VALUES(6, 208);
INSERT INTO AISLECONTAINS VALUES(6, 209);
INSERT INTO AISLECONTAINS VALUES(6, 210);
INSERT INTO AISLECONTAINS VALUES(6, 211);
INSERT INTO AISLECONTAINS VALUES(6, 212);
INSERT INTO AISLECONTAINS VALUES(7, 300);
INSERT INTO AISLECONTAINS VALUES(7, 301);
INSERT INTO AISLECONTAINS VALUES(7, 302);
INSERT INTO AISLECONTAINS VALUES(7, 303);
INSERT INTO AISLECONTAINS VALUES(7, 304);
INSERT INTO AISLECONTAINS VALUES(7, 305);
INSERT INTO AISLECONTAINS VALUES(7, 306);
INSERT INTO AISLECONTAINS VALUES(7, 307);
INSERT INTO AISLECONTAINS VALUES(8, 400);
INSERT INTO AISLECONTAINS VALUES(8, 401);
INSERT INTO AISLECONTAINS VALUES(8, 402);
INSERT INTO AISLECONTAINS VALUES(8, 403);
INSERT INTO AISLECONTAINS VALUES(8, 404);
INSERT INTO AISLECONTAINS VALUES(8, 405);
INSERT INTO AISLECONTAINS VALUES(8, 406);
INSERT INTO AISLECONTAINS VALUES(8, 407);
INSERT INTO AISLECONTAINS VALUES(8, 408);
INSERT INTO AISLECONTAINS VALUES(8, 409);
INSERT INTO AISLECONTAINS VALUES(8, 410);
INSERT INTO AISLECONTAINS VALUES(8, 411);
INSERT INTO AISLECONTAINS VALUES(8, 412);
INSERT INTO AISLECONTAINS VALUES(8, 413);
INSERT INTO AISLECONTAINS VALUES(8, 414);
INSERT INTO AISLECONTAINS VALUES(8, 415);
INSERT INTO AISLECONTAINS VALUES(8, 416);
INSERT INTO AISLECONTAINS VALUES(8, 417);
INSERT INTO AISLECONTAINS VALUES(8, 418);
INSERT INTO AISLECONTAINS VALUES(8, 419);
INSERT INTO AISLECONTAINS VALUES(8, 420);
INSERT INTO AISLECONTAINS VALUES(8, 421);
INSERT INTO AISLECONTAINS VALUES(8, 422);
INSERT INTO AISLECONTAINS VALUES(8, 423);
INSERT INTO AISLECONTAINS VALUES(8, 424);
INSERT INTO AISLECONTAINS VALUES(8, 425);



-- ProvidedBy
INSERT INTO PROVIDEDBY VALUES(1,9);
INSERT INTO PROVIDEDBY VALUES(2,9);
INSERT INTO PROVIDEDBY VALUES(3,11);
INSERT INTO PROVIDEDBY VALUES(4,12);
INSERT INTO PROVIDEDBY VALUES(5,12);
INSERT INTO PROVIDEDBY VALUES(6,12);
INSERT INTO PROVIDEDBY VALUES(7,9);
INSERT INTO PROVIDEDBY VALUES(8,11);
INSERT INTO PROVIDEDBY VALUES(9,12);
INSERT INTO PROVIDEDBY VALUES(10,12);
INSERT INTO PROVIDEDBY VALUES(11,9);
INSERT INTO PROVIDEDBY VALUES(12,11);
INSERT INTO PROVIDEDBY VALUES(13,11);
INSERT INTO PROVIDEDBY VALUES(14,9);
INSERT INTO PROVIDEDBY VALUES(15,11);
INSERT INTO PROVIDEDBY VALUES(16,9);
INSERT INTO PROVIDEDBY VALUES(17,11);
INSERT INTO PROVIDEDBY VALUES(18,9);
INSERT INTO PROVIDEDBY VALUES(19,9);
INSERT INTO PROVIDEDBY VALUES(20,11);
INSERT INTO PROVIDEDBY VALUES(21,11);
INSERT INTO PROVIDEDBY VALUES(22,11);
INSERT INTO PROVIDEDBY VALUES(23,11);
INSERT INTO PROVIDEDBY VALUES(24,9);
INSERT INTO PROVIDEDBY VALUES(25,9);
INSERT INTO PROVIDEDBY VALUES(26,11);
INSERT INTO PROVIDEDBY VALUES(27,11);
INSERT INTO PROVIDEDBY VALUES(28,9);
INSERT INTO PROVIDEDBY VALUES(29,11);
INSERT INTO PROVIDEDBY VALUES(30,11);
INSERT INTO PROVIDEDBY VALUES(31,11);
INSERT INTO PROVIDEDBY VALUES(32,11);
INSERT INTO PROVIDEDBY VALUES(100,1);
INSERT INTO PROVIDEDBY VALUES(101,15);
INSERT INTO PROVIDEDBY VALUES(102,15);
INSERT INTO PROVIDEDBY VALUES(103,1);
INSERT INTO PROVIDEDBY VALUES(104,15);
INSERT INTO PROVIDEDBY VALUES(105,1);
INSERT INTO PROVIDEDBY VALUES(106,1);
INSERT INTO PROVIDEDBY VALUES(107,15);
INSERT INTO PROVIDEDBY VALUES(108,15);
INSERT INTO PROVIDEDBY VALUES(109,1);
INSERT INTO PROVIDEDBY VALUES(110,15);
INSERT INTO PROVIDEDBY VALUES(111,1);
INSERT INTO PROVIDEDBY VALUES(112,15);
INSERT INTO PROVIDEDBY VALUES(113,1);
INSERT INTO PROVIDEDBY VALUES(114,15);
INSERT INTO PROVIDEDBY VALUES(115,15);
INSERT INTO PROVIDEDBY VALUES(116,1);
INSERT INTO PROVIDEDBY VALUES(117,15);
INSERT INTO PROVIDEDBY VALUES(118,1);
INSERT INTO PROVIDEDBY VALUES(119,1);
INSERT INTO PROVIDEDBY VALUES(120,15);
INSERT INTO PROVIDEDBY VALUES(150,15);
INSERT INTO PROVIDEDBY VALUES(151,15);
INSERT INTO PROVIDEDBY VALUES(152,15);
INSERT INTO PROVIDEDBY VALUES(200,4);
INSERT INTO PROVIDEDBY VALUES(201,14);
INSERT INTO PROVIDEDBY VALUES(202,4);
INSERT INTO PROVIDEDBY VALUES(203,4);
INSERT INTO PROVIDEDBY VALUES(204,14);
INSERT INTO PROVIDEDBY VALUES(205,4);
INSERT INTO PROVIDEDBY VALUES(206,4);
INSERT INTO PROVIDEDBY VALUES(207,14);
INSERT INTO PROVIDEDBY VALUES(208,16);
INSERT INTO PROVIDEDBY VALUES(209,17);
INSERT INTO PROVIDEDBY VALUES(210,18);
INSERT INTO PROVIDEDBY VALUES(211,19);
INSERT INTO PROVIDEDBY VALUES(212,20);
INSERT INTO PROVIDEDBY VALUES(400,5);
INSERT INTO PROVIDEDBY VALUES(401,7);
INSERT INTO PROVIDEDBY VALUES(402,10);
INSERT INTO PROVIDEDBY VALUES(403,5);
INSERT INTO PROVIDEDBY VALUES(404,10);
INSERT INTO PROVIDEDBY VALUES(405,7);
INSERT INTO PROVIDEDBY VALUES(406,5);
INSERT INTO PROVIDEDBY VALUES(407,5);
INSERT INTO PROVIDEDBY VALUES(408,7);
INSERT INTO PROVIDEDBY VALUES(409,10);
INSERT INTO PROVIDEDBY VALUES(410,5);
INSERT INTO PROVIDEDBY VALUES(411,7);
INSERT INTO PROVIDEDBY VALUES(412,5);
INSERT INTO PROVIDEDBY VALUES(413,10);
INSERT INTO PROVIDEDBY VALUES(414,10);
INSERT INTO PROVIDEDBY VALUES(415,7);
INSERT INTO PROVIDEDBY VALUES(416,10);
INSERT INTO PROVIDEDBY VALUES(417,5);
INSERT INTO PROVIDEDBY VALUES(418,10);
INSERT INTO PROVIDEDBY VALUES(419,5);
INSERT INTO PROVIDEDBY VALUES(420,7);
INSERT INTO PROVIDEDBY VALUES(421,5);
INSERT INTO PROVIDEDBY VALUES(422,10);
INSERT INTO PROVIDEDBY VALUES(423,5);
INSERT INTO PROVIDEDBY VALUES(424,10);
INSERT INTO PROVIDEDBY VALUES(425,7);

-- Purchases
INSERT INTO PURCHASES VALUES(1, 1, 1, 1, '11-01-2017', 1.59);
INSERT INTO PURCHASES VALUES(2, 3, 3, 1, '11-07-2017', 3.57);
INSERT INTO PURCHASES VALUES(3, 5, 2, 2, '12-01-2017', 2.78);
INSERT INTO PURCHASES VALUES(4, 7, 9, 2, '11-03-2017', 8.91);
INSERT INTO PURCHASES VALUES(5, 9, 6, 3, '12-17-2017', 7.74);
INSERT INTO PURCHASES VALUES(6, 11, 4, 3, '12-21-2017', 15.96);
INSERT INTO PURCHASES VALUES(7, 13, 2, 4, '11-19-2017', 1.98);
INSERT INTO PURCHASES VALUES(8, 15, 1, 4, '11-11-2017', 1.59);
INSERT INTO PURCHASES VALUES(9, 17, 8, 5, '11-21-2017', 10.32);
INSERT INTO PURCHASES VALUES(10, 19, 6, 5, '12-25-2017', 5.94);
INSERT INTO PURCHASES VALUES(11, 21, 3, 6, '11-02-2017', 4.47);
INSERT INTO PURCHASES VALUES(12, 23, 10, 6, '12-07-2017', 9.90);
INSERT INTO PURCHASES VALUES(13, 25, 1, 7, '12-15-2017', 1.29);
INSERT INTO PURCHASES VALUES(14, 27, 7, 7, '11-09-2017', 9.03);
INSERT INTO PURCHASES VALUES(15, 29, 6, 8, '11-10-2017', 7.14);
INSERT INTO PURCHASES VALUES(16, 31, 2, 8, '12-11-2017', 7.98);
INSERT INTO PURCHASES VALUES(17, 101, 3, 9, '12-14-2017', 6.87);
INSERT INTO PURCHASES VALUES(18, 103, 5, 9, '11-16-2017', 11.45);
INSERT INTO PURCHASES VALUES(19, 105, 6, 10, '12-16-2017', 13.74);
INSERT INTO PURCHASES VALUES(20, 107, 3, 10, '11-08-2017', 6.87);
INSERT INTO PURCHASES VALUES(21, 109, 1, 11, '12-04-2017', 2.99);
INSERT INTO PURCHASES VALUES(22, 111, 8, 11, '11-03-2017', 18.32);
INSERT INTO PURCHASES VALUES(23, 113, 4, 12, '12-19-2017', 19.88);
INSERT INTO PURCHASES VALUES(24, 115, 2, 12, '12-18-2017', 7.94);
INSERT INTO PURCHASES VALUES(25, 117, 3, 13, '11-18-2017', 9.87);
INSERT INTO PURCHASES VALUES(26, 119, 9, 13, '12-16-2017', 20.61);
INSERT INTO PURCHASES VALUES(27, 150, 1, 14, '11-30-2017', 3.99);
INSERT INTO PURCHASES VALUES(28, 152, 7, 14, '12-31-2017', 41.93);
INSERT INTO PURCHASES VALUES(29, 201, 1, 15, '11-30-2017', 6.99);
INSERT INTO PURCHASES VALUES(30, 203, 3, 15, '12-01-2017', 23.97);
INSERT INTO PURCHASES VALUES(31, 205, 13, 16, '11-12-2017', 90.87);
INSERT INTO PURCHASES VALUES(32, 207, 7, 16, '12-15-2017', 55.93);
INSERT INTO PURCHASES VALUES(33, 209, 1, 17, '12-03-2017', 6.99);
INSERT INTO PURCHASES VALUES(34, 211, 2, 17, '11-17-2017', 15.98);
INSERT INTO PURCHASES VALUES(35, 301, 6, 18, '12-13-2017', 23.94);
INSERT INTO PURCHASES VALUES(36, 303, 4, 18, '12-22-2017', 19.96);
INSERT INTO PURCHASES VALUES(37, 305, 2, 19, '11-22-2017', 9.98);
INSERT INTO PURCHASES VALUES(38, 307, 8, 19, '11-29-2017', 7.92);
INSERT INTO PURCHASES VALUES(39, 401, 4, 20, '11-01-2017', 5.16);
INSERT INTO PURCHASES VALUES(40, 403, 6, 20, '12-27-2017', 5.94);
INSERT INTO PURCHASES VALUES(41, 405, 9, 21, '12-18-2017', 5.31);
INSERT INTO PURCHASES VALUES(42, 407, 2, 21, '11-16-2017', 9.18);
INSERT INTO PURCHASES VALUES(43, 409, 1, 22, '11-13-2017', 0.69);
INSERT INTO PURCHASES VALUES(44, 411, 10, 22, '12-02-2017', 6.90);
INSERT INTO PURCHASES VALUES(45, 413, 7, 23, '11-03-2017', 4.83);
INSERT INTO PURCHASES VALUES(46, 415, 6, 23, '12-07-2017', 4.14);
INSERT INTO PURCHASES VALUES(47, 417, 1, 24, '11-11-2017', 0.69);
INSERT INTO PURCHASES VALUES(48, 419, 2, 24, '12-16-2017', 1.38);
INSERT INTO PURCHASES VALUES(49, 421, 7, 25, '12-22-2017', 4.83);
INSERT INTO PURCHASES VALUES(50, 423, 3, 25, '12-21-2017', 8.97);
INSERT INTO PURCHASES VALUES(51, 425, 4, 26, '11-26-2017', 15.96);
INSERT INTO PURCHASES VALUES(52, 400, 1, 26, '12-18-2017', 1.19);
INSERT INTO PURCHASES VALUES(53, 402, 6, 27, '11-16-2017', 5.34);
INSERT INTO PURCHASES VALUES(54, 404, 13, 27, '12-13-2017', 6.37);
INSERT INTO PURCHASES VALUES(55, 406, 2, 28, '11-17-2017', 7.98);
INSERT INTO PURCHASES VALUES(56, 408, 9, 28, '12-01-2017', 14.31);
INSERT INTO PURCHASES VALUES(57, 410, 12, 29, '12-04-2017', 8.28);
INSERT INTO PURCHASES VALUES(58, 412, 1, 29, '11-14-2017', 0.69);
INSERT INTO PURCHASES VALUES(59, 414, 14, 30, '12-24-2017', 9.66);
INSERT INTO PURCHASES VALUES(60, 416, 5, 30, '11-24-2017', 3.45);


-- ProvidesDelivery
INSERT INTO PROVIDESDELIVERY VALUES(1, 1);
INSERT INTO PROVIDESDELIVERY VALUES(2, 1);
INSERT INTO PROVIDESDELIVERY VALUES(3, 1);
INSERT INTO PROVIDESDELIVERY VALUES(4, 2);
INSERT INTO PROVIDESDELIVERY VALUES(5, 2);
INSERT INTO PROVIDESDELIVERY VALUES(6, 2);
INSERT INTO PROVIDESDELIVERY VALUES(7, 3);
INSERT INTO PROVIDESDELIVERY VALUES(8, 3);
INSERT INTO PROVIDESDELIVERY VALUES(9, 3);
INSERT INTO PROVIDESDELIVERY VALUES(10, 4);
INSERT INTO PROVIDESDELIVERY VALUES(11, 4);
INSERT INTO PROVIDESDELIVERY VALUES(12, 4);
INSERT INTO PROVIDESDELIVERY VALUES(13, 5);
INSERT INTO PROVIDESDELIVERY VALUES(14, 5);
INSERT INTO PROVIDESDELIVERY VALUES(15, 5);
INSERT INTO PROVIDESDELIVERY VALUES(16, 6);
INSERT INTO PROVIDESDELIVERY VALUES(17, 6);
INSERT INTO PROVIDESDELIVERY VALUES(18, 6);
INSERT INTO PROVIDESDELIVERY VALUES(19, 7);
INSERT INTO PROVIDESDELIVERY VALUES(20, 7);
INSERT INTO PROVIDESDELIVERY VALUES(21, 7);
INSERT INTO PROVIDESDELIVERY VALUES(22, 8);
INSERT INTO PROVIDESDELIVERY VALUES(23, 8);
INSERT INTO PROVIDESDELIVERY VALUES(24, 8);
INSERT INTO PROVIDESDELIVERY VALUES(25, 9);
INSERT INTO PROVIDESDELIVERY VALUES(26, 9);
INSERT INTO PROVIDESDELIVERY VALUES(27, 9);
INSERT INTO PROVIDESDELIVERY VALUES(28, 10);
INSERT INTO PROVIDESDELIVERY VALUES(29, 10);
INSERT INTO PROVIDESDELIVERY VALUES(30, 10);
INSERT INTO PROVIDESDELIVERY VALUES(31, 11);
INSERT INTO PROVIDESDELIVERY VALUES(32, 11);
INSERT INTO PROVIDESDELIVERY VALUES(33, 11);
INSERT INTO PROVIDESDELIVERY VALUES(34, 12);
INSERT INTO PROVIDESDELIVERY VALUES(35, 12);
INSERT INTO PROVIDESDELIVERY VALUES(36, 12);
INSERT INTO PROVIDESDELIVERY VALUES(37, 13);
INSERT INTO PROVIDESDELIVERY VALUES(38, 13);
INSERT INTO PROVIDESDELIVERY VALUES(39, 13);
INSERT INTO PROVIDESDELIVERY VALUES(40, 14);
INSERT INTO PROVIDESDELIVERY VALUES(41, 14);
INSERT INTO PROVIDESDELIVERY VALUES(42, 14);
INSERT INTO PROVIDESDELIVERY VALUES(43, 15);
INSERT INTO PROVIDESDELIVERY VALUES(44, 15);
INSERT INTO PROVIDESDELIVERY VALUES(45, 15);
INSERT INTO PROVIDESDELIVERY VALUES(46, 16);
INSERT INTO PROVIDESDELIVERY VALUES(47, 16);
INSERT INTO PROVIDESDELIVERY VALUES(48, 16);
INSERT INTO PROVIDESDELIVERY VALUES(49, 17);
INSERT INTO PROVIDESDELIVERY VALUES(50, 17);
INSERT INTO PROVIDESDELIVERY VALUES(51, 17);
INSERT INTO PROVIDESDELIVERY VALUES(52, 18);
INSERT INTO PROVIDESDELIVERY VALUES(53, 18);
INSERT INTO PROVIDESDELIVERY VALUES(54, 18);
INSERT INTO PROVIDESDELIVERY VALUES(55, 19);
INSERT INTO PROVIDESDELIVERY VALUES(56, 19);
INSERT INTO PROVIDESDELIVERY VALUES(57, 19);
INSERT INTO PROVIDESDELIVERY VALUES(58, 20);
INSERT INTO PROVIDESDELIVERY VALUES(59, 20);
INSERT INTO PROVIDESDELIVERY VALUES(60, 20);

-- ReceivedFrom
INSERT INTO RECEIVEDFROM VALUES(1,25);
INSERT INTO RECEIVEDFROM VALUES(2,26);
INSERT INTO RECEIVEDFROM VALUES(3,31);
INSERT INTO RECEIVEDFROM VALUES(4,34);
INSERT INTO RECEIVEDFROM VALUES(5,35);
INSERT INTO RECEIVEDFROM VALUES(6,36);
INSERT INTO RECEIVEDFROM VALUES(7,27);
INSERT INTO RECEIVEDFROM VALUES(8,32);
INSERT INTO RECEIVEDFROM VALUES(9,34);
INSERT INTO RECEIVEDFROM VALUES(10,35);
INSERT INTO RECEIVEDFROM VALUES(11,25);
INSERT INTO RECEIVEDFROM VALUES(12,33);
INSERT INTO RECEIVEDFROM VALUES(13,31);
INSERT INTO RECEIVEDFROM VALUES(14,26);
INSERT INTO RECEIVEDFROM VALUES(15,32);
INSERT INTO RECEIVEDFROM VALUES(16,27);
INSERT INTO RECEIVEDFROM VALUES(17,33);
INSERT INTO RECEIVEDFROM VALUES(18,25);
INSERT INTO RECEIVEDFROM VALUES(19,26);
INSERT INTO RECEIVEDFROM VALUES(20,31);
INSERT INTO RECEIVEDFROM VALUES(21,32);
INSERT INTO RECEIVEDFROM VALUES(22,33);
INSERT INTO RECEIVEDFROM VALUES(23,31);
INSERT INTO RECEIVEDFROM VALUES(24,27);
INSERT INTO RECEIVEDFROM VALUES(25,25);
INSERT INTO RECEIVEDFROM VALUES(26,32);
INSERT INTO RECEIVEDFROM VALUES(27,33);
INSERT INTO RECEIVEDFROM VALUES(28,26);
INSERT INTO RECEIVEDFROM VALUES(29,31);
INSERT INTO RECEIVEDFROM VALUES(30,32);
INSERT INTO RECEIVEDFROM VALUES(31,33);
INSERT INTO RECEIVEDFROM VALUES(32,31);
INSERT INTO RECEIVEDFROM VALUES(100,1);
INSERT INTO RECEIVEDFROM VALUES(101,43);
INSERT INTO RECEIVEDFROM VALUES(102,44);
INSERT INTO RECEIVEDFROM VALUES(103,2);
INSERT INTO RECEIVEDFROM VALUES(104,45);
INSERT INTO RECEIVEDFROM VALUES(105,3);
INSERT INTO RECEIVEDFROM VALUES(106,1);
INSERT INTO RECEIVEDFROM VALUES(107,43);
INSERT INTO RECEIVEDFROM VALUES(108,44);
INSERT INTO RECEIVEDFROM VALUES(109,2);
INSERT INTO RECEIVEDFROM VALUES(110,45);
INSERT INTO RECEIVEDFROM VALUES(111,3);
INSERT INTO RECEIVEDFROM VALUES(112,43);
INSERT INTO RECEIVEDFROM VALUES(113,1);
INSERT INTO RECEIVEDFROM VALUES(114,44);
INSERT INTO RECEIVEDFROM VALUES(115,45);
INSERT INTO RECEIVEDFROM VALUES(116,2);
INSERT INTO RECEIVEDFROM VALUES(117,43);
INSERT INTO RECEIVEDFROM VALUES(118,3);
INSERT INTO RECEIVEDFROM VALUES(119,1);
INSERT INTO RECEIVEDFROM VALUES(120,44);
INSERT INTO RECEIVEDFROM VALUES(150,45);
INSERT INTO RECEIVEDFROM VALUES(151,43);
INSERT INTO RECEIVEDFROM VALUES(152,44);
INSERT INTO RECEIVEDFROM VALUES(200,10);
INSERT INTO RECEIVEDFROM VALUES(201,40);
INSERT INTO RECEIVEDFROM VALUES(202,11);
INSERT INTO RECEIVEDFROM VALUES(203,12);
INSERT INTO RECEIVEDFROM VALUES(204,41);
INSERT INTO RECEIVEDFROM VALUES(205,10);
INSERT INTO RECEIVEDFROM VALUES(206,11);
INSERT INTO RECEIVEDFROM VALUES(207,42);
INSERT INTO RECEIVEDFROM VALUES(208,46);
INSERT INTO RECEIVEDFROM VALUES(209,50);
INSERT INTO RECEIVEDFROM VALUES(210,53);
INSERT INTO RECEIVEDFROM VALUES(211,56);
INSERT INTO RECEIVEDFROM VALUES(212,59);
INSERT INTO RECEIVEDFROM VALUES(400,13);
INSERT INTO RECEIVEDFROM VALUES(401,19);
INSERT INTO RECEIVEDFROM VALUES(402,28);
INSERT INTO RECEIVEDFROM VALUES(403,14);
INSERT INTO RECEIVEDFROM VALUES(404,29);
INSERT INTO RECEIVEDFROM VALUES(405,20);
INSERT INTO RECEIVEDFROM VALUES(406,15);
INSERT INTO RECEIVEDFROM VALUES(407,13);
INSERT INTO RECEIVEDFROM VALUES(408,21);
INSERT INTO RECEIVEDFROM VALUES(409,30);
INSERT INTO RECEIVEDFROM VALUES(410,14);
INSERT INTO RECEIVEDFROM VALUES(411,19);
INSERT INTO RECEIVEDFROM VALUES(412,15);
INSERT INTO RECEIVEDFROM VALUES(413,28);
INSERT INTO RECEIVEDFROM VALUES(414,29);
INSERT INTO RECEIVEDFROM VALUES(415,20);
INSERT INTO RECEIVEDFROM VALUES(416,30);
INSERT INTO RECEIVEDFROM VALUES(417,13);
INSERT INTO RECEIVEDFROM VALUES(418,28);
INSERT INTO RECEIVEDFROM VALUES(419,14);
INSERT INTO RECEIVEDFROM VALUES(420,21);
INSERT INTO RECEIVEDFROM VALUES(421,15);
INSERT INTO RECEIVEDFROM VALUES(422,29);
INSERT INTO RECEIVEDFROM VALUES(423,13);
INSERT INTO RECEIVEDFROM VALUES(424,30);
INSERT INTO RECEIVEDFROM VALUES(425,19);