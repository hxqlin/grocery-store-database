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
DROP TABLE IF EXISTS Aisle;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer(
    CustomerName VARCHAR(255),
    CustomerPhone VARCHAR(255),
    CustomerEmail VARCHAR(255),
    PRIMARY KEY(CustomerName, CustomerEmail)
);

CREATE TABLE Department(
    DepartmentName VARCHAR(255),
    PRIMARY KEY(DepartmentName)
);

CREATE TABLE Supplier(
    SupplierID INT,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierAddress VARCHAR(255),
    SupplierPhone VARCHAR(255) NOT NULL,
    PRIMARY KEY(SupplierID)
);

CREATE TABLE Employee(
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

CREATE TABLE Product(
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

CREATE TABLE Aisle(
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
    SupplierID INT,
    ProductID INT,
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
INSERT INTO CUSTOMER VALUES('Harry Potter', '000 731 1980', 'theboywholived@gmail.com');
INSERT INTO CUSTOMER VALUES('Hermione Granger', '555 123 1979', 'hgranger@icloud.com');
INSERT INTO CUSTOMER VALUES('Ron Weasley', '604 301 1979', 'roonilwazlib@hotmail.com');
INSERT INTO CUSTOMER VALUES('Ginny Weasley', '778 872 1928', 'ginnyw@gmail.com');
INSERT INTO CUSTOMER VALUES('Voldemort', '778 192 3928', 'tmriddle@hotmail.com');
INSERT INTO CUSTOMER VALUES('Draco Malfoy', '908 392 1928', 'mini_mr_malfoy@gmail.com');
INSERT INTO CUSTOMER VALUES('Neville Longbottom', '498 192 3091', 'longbottom@live.com');
INSERT INTO CUSTOMER VALUES('Dudley Dursley', '930 409 9380', 'ddursley@hotmail.com');
INSERT INTO CUSTOMER VALUES('Severus Snape', '928 182 0493', 'snivellus@gmail.com');
INSERT INTO CUSTOMER VALUES('Rubeus Hagrid', '458 392 1029', 'HAGRID@hotmail.com');
INSERT INTO CUSTOMER VALUES('Minverva McGonagall', '893 928 0933', 'mmcgonagall@gmail.com');
INSERT INTO CUSTOMER VALUES('Albus Dumbledore', '920 849 9145', 'DUMBLEDORE@gmail.com');
INSERT INTO CUSTOMER VALUES('Hedwig', '839 920 1234', 'im_actually_an_owl@hotmail.com');
INSERT INTO CUSTOMER VALUES('Crookshanks', '555 983 0298', 'cat@icloud.com');

-- start of supplier insertion
INSERT INTO SUPPLIER VALUES(1, 'Saputo Dairy Products Canada', '6800 Lougheed Highway, Burnaby, BC V5A 1W2', '1 800 672 8866');
INSERT INTO SUPPLIER VALUES(2, 'Gordon Food Services', '1700 Cliveden Avenue, Delta, BC V3M 6T2', '800 663 1695');
INSERT INTO SUPPLIER VALUES(3, 'Yen Bros. Food Service', '1988 Vernon Drive, Vancouver, BC V6A 3Y6', '604 255 6522');
INSERT INTO SUPPLIER VALUES(4, 'Arctic Meat & Sausage', '1606 Kebet Way, Port Coquitlam, BC V3C 5W9', '604 472 9995');
INSERT INTO SUPPLIER VALUES(5, 'Lekker Food Distribution Ltd.', '2670 Wilfert Road, Victoria, BC V9B 5Z3', '877 788 0377');
INSERT INTO SUPPLIER VALUES(6, 'Get Sauced & Spiced Inc.', '58 Avenue, Surrey, BC V8H 4S9', '780 462 2418');
INSERT INTO SUPPLIER VALUES(7, 'Orkin Canada', '123 Missisauga Street, Vancouver, BC V7A 0E3', '800 800 6754');
INSERT INTO SUPPLIER VALUES(8, 'Grainworks Inc.', '921 Vulcan Avenue, Richmond, BC V8A 3H1', '800 563 3756');
INSERT INTO SUPPLIER VALUES(9, 'Harvest Corporation', '249 Missisauga Street, Vancouver, BC V9U 1H3', '888 925 6644');
INSERT INTO SUPPLIER VALUES(10, 'The Leaky Cauldron', '938 Diagon Alley, London, UK, EC', '800 172 4532');

-- start of department insertion
INSERT INTO DEPARTMENT VALUES('Produce');
INSERT INTO DEPARTMENT VALUES('Meat and Seafood');
INSERT INTO DEPARTMENT VALUES('Baked Goods');
INSERT INTO DEPARTMENT VALUES('Pantry Items');
INSERT INTO DEPARTMENT VALUES('Eggs and Dairy');

-- start of employee insertion
INSERT INTO EMPLOYEE VALUES(1, 'Ben Ling', 'Eggs and Dairy', 'Stocker', 948398198, '2366 Main Mall, Vancouver, BC VH3 0A2', '604 8222 3061', 0);
INSERT INTO EMPLOYEE VALUES(2, 'Daenerys Targaryen', 'Eggs and Dairy', 'Manager', 7685437775, '123 House Targaryen, Dragonstone, BC VK8 2H9', '777 777 7777', 0);
INSERT INTO EMPLOYEE VALUES(3, 'Jon Snow', 'Meat and Seafood', 'Manager', 901982091, '224 Winter Is Coming, North, BC, VA7 4K8', '783 309 1923', 0);

-- start of product insertion
-- produce
INSERT INTO PRODUCT VALUES(1, 'Apples (Ambrosia)', 1.59, 'lb', 'Produce', 25, null, '12-01-2017', '12-15-2017', 3438, null, 0, null, null);
INSERT INTO PRODUCT VALUES(2, 'Apples (Fuji)', 1.49, 'lb', 'Produce', 30, null, '12-09-2017', '12-23-2017', 4129, null, 0, null, null);
INSERT INTO PRODUCT VALUES(3, 'Apples (Gala)', 1.19, 'lb', 'Produce', 30, null, '12-07-2017', '12-21-2017', 4133, null, 0, null, null);
INSERT INTO PRODUCT VALUES(4, 'Apples (Gala)', 1.29, 'lb', 'Produce', 15, null, '12-05-2017', '12-19-2017', 94133, null, 1, null, null);
INSERT INTO PRODUCT VALUES(5, 'Apples (Granny Smith)', 1.39, 'lb', 'Produce', 15, null, '12-05-2017', '12-19-2017', 4017, null, 0, null, null);
INSERT INTO PRODUCT VALUES(6, 'Bananas', 0.79, 'lb', 'Produce', 50, null, '12-19-2017', '12-23-2017', 4011, null, 0, null, null);
INSERT INTO PRODUCT VALUES(7, 'Bananas', 0.99, 'lb', 'Produce', 50, null, '12-19-2017', '12-23-2017', 94011, null, 1, null, null);
INSERT INTO PRODUCT VALUES(8, 'Oranges (Navel)', 1.19, 'lb', 'Produce', 30, null, '12-10-2017', '12-24-2017', 4012, null, 1, null, null);
INSERT INTO PRODUCT VALUES(9, 'Oranges (Valencia)', 1.29, 'lb', 'Produce', 20, null, '12-06-2017', '12-25-2017', 4013, null, 1, null, null);
INSERT INTO PRODUCT VALUES(10, 'Strawberries', 4.99, 'lb', 'Produce', 20, null, '12-10-2017', '12-13-2017', 3355, null, 0, null, null);
INSERT INTO PRODUCT VALUES(11, 'Blueberries', 3.99, 'lb', 'Produce', 60, null, '12-10-2017', '12-13-2017', 4240, null, 0, null, null);
INSERT INTO PRODUCT VALUES(12, 'Raspberries', 3.49, 'lb', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4244, null, 0, null, null);

INSERT INTO PRODUCT VALUES(13, 'Lettuce (Iceberg)', 0.99, 'ct', 'Produce', 20, null, '12-01-2017', '12-08-2017', 4061, null, 0, null, null);
INSERT INTO PRODUCT VALUES(14, 'Lettuce (Romaine)', 1.29, 'ct', 'Produce', 20, null, '12-02-2017', '12-09-2017', 3097, null, 0, null, null);
INSERT INTO PRODUCT VALUES(15, 'Spinach', 1.59, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4090, null, 0, null, null);
INSERT INTO PRODUCT VALUES(16, 'Watercress', 1.99, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4815, null, 0, null, null);
INSERT INTO PRODUCT VALUES(17, 'Bok Choy (Baby)', 1.29, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 4545, null, 0, null, null);
INSERT INTO PRODUCT VALUES(18, 'Bok Choy (Shanghai)', 0.99, 'bunch', 'Produce', 20, null, '12-10-2017', '12-13-2017', 3163, null, 0, null, null);

INSERT INTO PRODUCT VALUES(19, 'Potatoes (Russet)', 0.99, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4072, null, 0, null, null);
INSERT INTO PRODUCT VALUES(20, 'Potatoes (Red)', 1.29, 'lb', 'Produce', 20, null, '12-02-2017', '12-31-2017', 4073, null, 0, null, null);
INSERT INTO PRODUCT VALUES(21, 'Potatoes (Sweet)', 1.49, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4726, null, 0, null, null);
INSERT INTO PRODUCT VALUES(22, 'Squash (Acorn)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 3143, null, 0, null, null);
INSERT INTO PRODUCT VALUES(23, 'Squash (Kabocha)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4769, null, 0, null, null);
INSERT INTO PRODUCT VALUES(24, 'Squash (Butternut)', 0.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4759, null, 0, null, null);
INSERT INTO PRODUCT VALUES(25, 'Carrots (Loose)', 1.29, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 4562, null, 0, null, null);
INSERT INTO PRODUCT VALUES(26, 'Carrots (Loose)', 1.49, 'lb', 'Produce', 20, null, '12-01-2017', '12-30-2017', 94562, null, 0, null, null);
INSERT INTO PRODUCT VALUES(27, 'Onions (Red)', 1.29, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4082, null, 0, null, null);
INSERT INTO PRODUCT VALUES(28, 'Onions (Yellow)', 1.29, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4093, null, 0, null, null);
INSERT INTO PRODUCT VALUES(29, 'Onions (White)', 1.19, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4663, null, 0, null, null);
INSERT INTO PRODUCT VALUES(30, 'Onions (Pearl)', 2.49, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4660, null, 0, null, null);
INSERT INTO PRODUCT VALUES(31, 'Garlic', 3.99, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 3399, null, 0, null, null);
INSERT INTO PRODUCT VALUES(32, 'Ginger', 2.49, 'lb', 'Produce', 20, null, '11-01-2017', '12-31-2017', 4612, null, 0, null, null);

-- dairy (need to fix UPC & product IDs)
INSERT INTO PRODUCT VALUES(100, 'Milk (Skim)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125003, 0, null, null);
INSERT INTO PRODUCT VALUES(101, 'Milk (1%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125004, 0, null, null);
INSERT INTO PRODUCT VALUES(102, 'Milk (2%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125005, 0, null, null);
INSERT INTO PRODUCT VALUES(103, 'Milk (Whole)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125006, 0, null, null);
INSERT INTO PRODUCT VALUES(104, 'Half and Half (10%)', 2.99, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125007, 0, null, null);
INSERT INTO PRODUCT VALUES(105, 'Milk (Skim)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125008, 1, null, null);
INSERT INTO PRODUCT VALUES(106, 'Milk (1%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125009, 1, null, null);
INSERT INTO PRODUCT VALUES(107, 'Milk (2%)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125010, 1, null, null);
INSERT INTO PRODUCT VALUES(108, 'Milk (Whole)', 2.29, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125011, 1, null, null);
INSERT INTO PRODUCT VALUES(109, 'Milk (2% Chocolate)', 2.99, 'L', 'Eggs and Dairy', 10, 'Dairyland', '12-01-2017', '12-14-2017', null, 068700125011, 1, null, null);
INSERT INTO PRODUCT VALUES(110, 'Milk (Soy)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 1, null, null);
INSERT INTO PRODUCT VALUES(111, 'Milk (Unsweetened Soy)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 1, null, null);
INSERT INTO PRODUCT VALUES(112, 'Yogurt (Vanilla, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCT VALUES(113, 'Yogurt (Vanilla, 6-pack)', 4.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 1, null, null);
INSERT INTO PRODUCT VALUES(114, 'Yogurt (Strawberry, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCT VALUES(115, 'Yogurt (Fat-free, 6-pack)', 3.97, 'ct', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCT VALUES(116, 'Butter (Salted)', 3.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCT VALUES(117, 'Butter (Unsalted)', 3.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125012, 0, null, null);
INSERT INTO PRODUCT VALUES(118, 'Cheese (Mozzarella)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCT VALUES(119, 'Cheese (Cheddar)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);
INSERT INTO PRODUCT VALUES(120, 'Cheese (Parmesan)', 2.29, 'L', 'Eggs and Dairy', 10, 'Silk', '12-01-2017', '12-20-2017', null, 068700125013, 0, null, null);

-- eggs
INSERT INTO PRODUCT VALUES(150, 'Eggs (12 count)', 3.99, 'pack', 'Eggs and Dairy', 10, 'Kirkland Signature', '12-01-2017', '12-20-2017', null, 062639410124, 0, null, null);
INSERT INTO PRODUCT VALUES(151, 'Eggs (Brown, 12 count)', 4.99, 'pack', 'Eggs and Dairy', 10, 'Golden Valley', '12-01-2017', '12-20-2017', null, 062639410125, 0, null, null);
INSERT INTO PRODUCT VALUES(152, 'Eggs (Omega-3, 12 count)', 5.99, 'pack', 'Eggs and Dairy', 10, 'Born 3 Omega-3', '12-01-2017', '12-20-2017', null, 666933900420, 0, null, null);

-- meat
INSERT INTO PRODUCT VALUES(200, 'Chicken Breast', 5.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823921, 0, null, 'Chicken');
INSERT INTO PRODUCT VALUES(201, 'Chicken Breast', 6.99, 'lb', 'Meat and Seafood', 10, 'Green Way', '12-05-2017', '12-07-2017', null, 233841823920, 1, null, 'Chicken');
INSERT INTO PRODUCT VALUES(202, 'Chicken Thighs', 4.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823919, 0, null, 'Chicken');
INSERT INTO PRODUCT VALUES(203, 'Stew Meat', 7.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-05-2017', '12-08-2017', null, 233841823910, 0, 'Chuck', 'Beef');
INSERT INTO PRODUCT VALUES(204, 'Ground Beef', 4.99, 'lb', 'Meat and Seafood', 10, 'Kirkland Signature', '12-01-2017', '12-03-2017', null, 233841823821, 0, null, 'Beef');
INSERT INTO PRODUCT VALUES(205, 'Steak', 6.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-05-2017', '12-07-2017', null, 233841823822, 0, 'Sirloin', 'Beef');
INSERT INTO PRODUCT VALUES(206, 'Steak', 7.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-01-2017', '12-03-2017', null, 233841823823, 0, 'Flank', 'Beef');
INSERT INTO PRODUCT VALUES(207, 'Steak', 7.99, 'lb', 'Meat and Seafood', 10, 'Western Canadian', '12-05-2017', '12-08-2017', null, 233841823824, 0, 'Tenderloin', 'Beef');
INSERT INTO PRODUCT VALUES(208, 'Cod Fillets', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823825, 0, 'Fillet', 'Cod');
INSERT INTO PRODUCT VALUES(209, 'Sole Fillets', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823826, 0, 'Fillet', 'Sole');
INSERT INTO PRODUCT VALUES(210, 'Tilapia (Fresh)', 6.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823827, 0, null, 'Tilapia');
INSERT INTO PRODUCT VALUES(211, 'Salmon (Fresh)', 7.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823828, 0, 'Fillet', 'Salmon');
INSERT INTO PRODUCT VALUES(212, 'Salmon (Fresh)', 8.99, 'lb', 'Meat and Seafood', 10, null, '12-05-2017', '12-08-2017', null, 233841823829, 1, 'Fillet', 'Salmon');

-- baked goods
INSERT INTO PRODUCT VALUES(300, 'Bread (White)', 2.99, 'ct', 'Baked Goods', 5, 'Villagio', '12-01-2017', '12-06-2017', null, 006872100350, 0, null, null);
INSERT INTO PRODUCT VALUES(301, 'Bread (Whole Wheat)', 3.99, 'ct', 'Baked Goods', 5, 'Pepperidge Farms', '12-01-2017', '12-06-2017', null, 014100071013, 0, null, null);
INSERT INTO PRODUCT VALUES(302, 'Everything Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Sara Lee', '12-01-2017', '12-06-2017', null, 072945610033, 0, null, null);
INSERT INTO PRODUCT VALUES(303, 'Mini Cinnamon Raisin Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Pepperidge Farms', '12-01-2017', '12-06-2017', null, 014100092599, 0, null, null);
INSERT INTO PRODUCT VALUES(304, 'Bread (Rye)', 3.99, 'ct', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 014100071013, 1, null, null);
INSERT INTO PRODUCT VALUES(305, 'Bread (Spelt)', 4.99, 'ct', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 072945610033, 1, null, null);
INSERT INTO PRODUCT VALUES(306, 'Sprouted Bagel (6 count)', 4.99, 'pack', 'Baked Goods', 5, 'Silver Hills Bakery', '12-01-2017', '12-06-2017', null, 014100092599, 1, null, null);
INSERT INTO PRODUCT VALUES(307, 'Doughnut', 0.99, 'ct', 'Baked Goods', 5, 'Bake Shop', '12-01-2017', '12-03-2017', null, null, 0, null, null);

-- pantry items
INSERT INTO PRODUCT VALUES(400, 'All-Purpose Flour (Original)', 1.19, 'lb', 'Pantry Items', 30, 'Robin Hood', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(401, 'All-Purpose Flour (Whole Wheat)', 1.29, 'lb', 'Pantry Items', 30, 'Robin Hood', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(402, 'White Sugar', 0.89, 'lb', 'Pantry Items', 30, 'Rogers', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(403, 'Brown Sugar', 0.99, 'lb', 'Pantry Items', 30, 'Rogers', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(404, 'Iodized Table Salt', 0.49, 'lb', 'Pantry Items', 30, 'Windsor', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(405, 'Black Pepper', 0.59, 'lb', 'Pantry Items', 30, 'Windsor', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(406, 'Ground Cinnamon', 3.99, 'lb', 'Pantry Items', 30, 'Club House', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(407, 'Chili Flakes', 4.59, 'lb', 'Pantry Items', 30, 'Club House', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(408, 'White Rice', 1.59, 'lb', 'Pantry Items', 30, 'Rooster', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(409, 'Scoobi Do Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(410, 'Fusili', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(411, 'Penne Rigate', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(412, 'Elbow Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(413, 'Spaghetti', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(414, 'Linguini', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(415, 'Spaghettini', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(416, 'Farfalle', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(417, 'Ditali', 0.69, 'lb', 'Pantry Items', 30, 'Italpasta', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(418, 'Fusili', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(419, 'Penne Rigate', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(420, 'Elbow Pasta', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(421, 'Spaghetti', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(422, 'Linguini', 0.69, 'lb', 'Pantry Items', 30, 'Barilla', '10-01-2017', '12-31-2017', null, null, 0, null, null);
INSERT INTO PRODUCT VALUES(423, 'Sriracha Chili Sauce', 2.99, 'ct', 'Pantry Items', 10, 'Huy Fong', '11-01-2017', '12-31-2017', null, 024463061095, 0, null, null);
INSERT INTO PRODUCT VALUES(424, 'Tomato Ketchup', 3.99, 'ct', 'Pantry Items', 10, 'Heinz', '11-01-2017', '12-31-2017', null, 013000001243, 0, null, null);
INSERT INTO PRODUCT VALUES(425, 'Soy Sauce', 3.99, 'ct', 'Pantry Items', 10, 'Kikkoman', '11-01-2017', '12-31-2017', null, 041390000829, 0, null, null);

-- aisles
INSERT INTO AISLE VALUES(1, 'Fruits');
INSERT INTO AISLE VALUES(2, 'Vegetables');
INSERT INTO AISLE VALUES(3, 'Dairy');
INSERT INTO AISLE VALUES(4, 'Eggs');
INSERT INTO AISLE VALUES(5, 'Meats');
INSERT INTO AISLE VALUES(6, 'Seafood');
INSERT INTO AISLE VALUES(7, 'Baked Goods');
INSERT INTO AISLE VALUES(8, 'Pantry Items');

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