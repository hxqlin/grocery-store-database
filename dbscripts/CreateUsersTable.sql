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
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
    CustomerName VARCHAR(255),
    CustomerPhone VARCHAR(255),
    CustomerEmail VARCHAR(255),
    PRIMARY KEY(CustomerName, CustomerEmail)
);

CREATE TABLE Departments(
    DepartmentName VARCHAR(255),
    PRIMARY KEY(DepartmentName)
);

CREATE TABLE Suppliers(
    SupplierID INT,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierAddress VARCHAR(255),
    SupplierPhone VARCHAR(255) NOT NULL,
    PRIMARY KEY(SupplierID)
);

CREATE TABLE Employees(
    EmployeeID INT,
    EmployeeName VARCHAR(255) NOT NULL,
    DepartmentName VARCHAR(255),
    Position VARCHAR(255),
    SINumber BIGINT NOT NULL,
    EmployeeAddress VARCHAR(255),
    EmployeePhone VARCHAR(255),
    Wage INT,
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(DepartmentName) REFERENCES Department(DepartmentName)
);

CREATE TABLE Products(
    ProductID INT,
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
    FOREIGN KEY(DepartmentName) REFERENCES Department(DepartmentName)
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
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY(AisleNumber) REFERENCES Aisle(AisleNumber)
);

CREATE TABLE ProvidedBy(
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY(SupplierID, ProductID),
    FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProvidesDelivery(
    DeliveryID INT,
    SupplierID INT NOT NULL,
    PRIMARY KEY(DeliveryID),
    FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE ReceivedFrom(
    ProductID INT,
    DeliveryID INT,
    PRIMARY KEY(ProductID, DeliveryID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY(DeliveryID) REFERENCES ProvidesDelivery(DeliveryID)
);

CREATE TABLE Purchases(
    TransactionID INT,
    ProductID INT,
    Quantity INT,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    PurchaseDate VARCHAR(255),
    Total FLOAT,
    PRIMARY KEY(TransactionID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY(CustomerName, CustomerEmail) REFERENCES Customer(CustomerName, CustomerEmail)
);

-- start of customer insertion
INSERT INTO CUSTOMERS VALUES('Harry Potter', '000 731 1980', 'theboywholived@gmail.com');
INSERT INTO CUSTOMERS VALUES('Lily Potter', '000 731 1980', 'lpotter@gmail.com');
INSERT INTO CUSTOMERS VALUES('James Potter', '000 731 1980', 'jpotter@gmail.com');
INSERT INTO CUSTOMERS VALUES('Hermione Granger', '555 123 1979', 'hgranger@icloud.com');
INSERT INTO CUSTOMERS VALUES('Ron Weasley', '604 301 1979', 'roonilwazlib@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Ginny Weasley', '778 872 1928', 'ginnyw@gmail.com');
INSERT INTO CUSTOMERS VALUES('Fred Weasley', '604 976 3693', 'fweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('George Weasley', '604 976 3693', 'gweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Arthur Weasley', '604 976 3693', 'aweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Molly Weasley', '604 976 3693', 'mweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Percy Weasley', '604 976 3693', 'pweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Bill Weasley', '604 976 3693', 'bweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Charlie Weasley', '604 976 3693', 'cweasley@gmail.com');
INSERT INTO CUSTOMERS VALUES('Lord Voldemort', '778 192 3928', 'tmriddle@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Draco Malfoy', '908 392 1928', 'mini_mr_malfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES('Lucius Malfoy', '908 392 1928', 'lmalfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES('Narcissa Malfoy', '908 392 1928', 'nmalfoy@gmail.com');
INSERT INTO CUSTOMERS VALUES('Neville Longbottom', '498 192 3091', 'longbottom@live.com');
INSERT INTO CUSTOMERS VALUES('Dudley Dursley', '930 409 9380', 'ddursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Vernon Dursley', '930 409 9380', 'vdursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Petunia Dursley', '930 409 9380', 'pdursley@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Severus Snape', '928 182 0493', 'snivellus@gmail.com');
INSERT INTO CUSTOMERS VALUES('Rubeus Hagrid', '458 392 1029', 'rhagrid@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Minverva McGonagall', '893 928 0933', 'mmcgonagall@gmail.com');
INSERT INTO CUSTOMERS VALUES('Albus Dumbledore', '920 849 9145', 'adumbledore@gmail.com');
INSERT INTO CUSTOMERS VALUES('Hedwig', '839 920 1234', 'im_actually_an_owl@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Crookshanks', '555 983 0298', 'cat@icloud.com');
INSERT INTO CUSTOMERS VALUES('Sirius Black', '649 563 4723', 'sblack@gmail.com');
INSERT INTO CUSTOMERS VALUES('Lavender Brown', '604 983 6941', 'lbrown@hotmail.com');
INSERT INTO CUSTOMERS VALUES('Colin Creevey', '778 961 6435', 'ccreevey@gmail.com');

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