CREATE TABLE Users (
    UserID VARCHAR(50) PRIMARY KEY, -- Unique ID for each user
    FullName VARCHAR(50), -- User full name
    RegDate TIMESTAMP, -- User registration date
    SellerDocSignedDate TIMESTAMP, -- Timestamp the seller agreement was signed
    BirthDate DATE, -- The user's birth date
    PhoneNumber VARCHAR(50), -- User's contact number
    Address VARCHAR(300), -- User's physical address
    IDVerificationStatus BOOLEAN, -- Whether the user has verified their ID
    UserStatus VARCHAR(50), -- Status of the user
    IsCompanySeller BOOLEAN, -- Whether the user is a company seller
    CompanyName VARCHAR(100) -- The name of the company
);
CREATE TABLE Items (
    ItemID VARCHAR(50) PRIMARY KEY, -- Unique ID for each type of item
    CategoryID VARCHAR(50), -- Unique ID for each category
    CategoryName VARCHAR(100), -- Name of the category
    ItemName VARCHAR(100) -- Name of the item
);
CREATE TABLE Listings (
    ListingID VARCHAR(50) PRIMARY KEY, -- Unique ID for each listing
    ListingDate TIMESTAMP, -- Timestamp the listing was created
    ListingStatus VARCHAR(50), -- Current status of the listing
    SellerID VARCHAR(50), -- Used to connect to the Users table
    ListingPrice DECIMAL(10, 2), -- Price of the listed item
    ListingQuantity INTEGER, -- Quantity of the item listed
    ItemDescription VARCHAR(100), -- Detailed description of the item
    ItemID VARCHAR(50), -- Connects to the Items table
    ItemName VARCHAR(100), -- Name of the item
    FOREIGN KEY (SellerID) REFERENCES Users(UserID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);
CREATE TABLE Payments (
    PaymentID VARCHAR(50) PRIMARY KEY, -- Unique ID for each payment
    PaymentType VARCHAR(50), -- Type of payment method
    CreatedDate TIMESTAMP, -- Timestamp the payment was created
    Status VARCHAR(50) -- Current status of the payment
);
CREATE TABLE Shipping (
    ShippingID VARCHAR(50) PRIMARY KEY, -- Unique ID for each shipping
    ShippingAddr1 VARCHAR(200), -- Address line 1 of shipping
    ShippingAddr2 VARCHAR(200), -- Address line 2 of shipping
    ShippingCity VARCHAR(50), -- City shipped to
    ShippingState VARCHAR(50), -- State shipped to
    ShippingZipcode VARCHAR(50), -- Postal code for delivery
    ShippingCountry VARCHAR(50), -- Country for delivery
    ShippingStatus VARCHAR(50), -- Current status of the shipping
    TrackingNumber VARCHAR(100) -- Tracking number of the shipping
);
CREATE TABLE Transactions (
    TransID VARCHAR(50) PRIMARY KEY, -- Unique ID for each transaction
    ListingID VARCHAR(50), -- Connects to the Listing table
    ItemID VARCHAR(50), -- Connects to the Item table
    CreateDate TIMESTAMP, -- Timestamp the transaction was created
    BuyerID VARCHAR(50), -- Connects to the Users table
    PaymentID VARCHAR(50), -- Connects to the Payment table
    CheckoutStatus VARCHAR(50), -- Status of the transaction
    FinalSalesPrice DECIMAL(10, 2), -- Final sales price
    Tax DECIMAL(10, 2), -- Tax paid by the buyer
    ShippingID VARCHAR(50), -- Connects to the Shipping table
    Quantity INTEGER, -- Quantity of the item checked out
    FOREIGN KEY (ListingID) REFERENCES Listing(ListingID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
    FOREIGN KEY (BuyerID) REFERENCES Users(UserID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
    FOREIGN KEY (ShippingID) REFERENCES Shipping(ShippingID)
);
INSERT INTO Users (UserID, FullName, RegDate, SellerDocSignedDate, BirthDate, PhoneNumber, Address, IDVerificationStatus, UserStatus, IsCompanySeller, CompanyName)
VALUES
('U001', 'Alice Seller', '2023-01-01', '2023-01-02', '1990-05-01', '1234567890', '123 Main St, Springfield, IL', 1, 'Active', 1, 'Alice Inc.'),
('U002', 'Bob Buyer', '2023-02-01', NULL, '1985-10-15', '9876543210', '456 Market St, San Francisco, CA', 0, 'Active', 0, NULL),
('U003', 'Charlie Seller', '2023-03-10', '2023-03-12', '1980-07-20', '5551234567', '789 Oak St, Boston, MA', 1, 'Active', 1, 'Charlie Electronics'),
('U004', 'David Buyer', '2023-04-01', NULL, '1992-11-25', '6789101112', '101 Maple St, Los Angeles, CA', 1, 'Active', 0, NULL),
('U005', 'Eve Seller', '2023-05-15', '2023-05-16', '1995-02-10', '1122334455', '202 Pine St, Miami, FL', 0, 'Inactive', 1, 'Eve Fashion');
INSERT INTO Items (ItemID, ItemName, CategoryID, CategoryName)
VALUES
('I001', 'Smartphone', 'C001', 'Electronics'),
('I002', 'T-shirt', 'C002', 'Clothing'),
('I003', 'Coffee Maker', 'C003', 'Appliances'),
('I004', 'Laptop', 'C001', 'Electronics'),
('I005', 'Blender', 'C003', 'Appliances');
INSERT INTO Payments (PaymentID, PaymentType, CreatedDate, Status)
VALUES
('P001', 'Credit Card', '2023-06-01', 'Completed'),
('P002', 'PayPal', '2023-06-05', 'Completed'),
('P003', 'Bank Transfer', '2023-06-10', 'Pending'),
('P004', 'Credit Card', '2023-06-12', 'Completed'),
('P005', 'PayPal', '2023-06-15', 'Cancelled');
INSERT INTO Listings (ListingID, ListingDate, ListingStatus, SellerID, ListingPrice, ListingQuantity, ItemDescription, ItemID, ItemName)
VALUES
('L001', '2023-05-01', 'Active', 'U001', 699.99, 10, 'Brand new smartphone with high-end features', 'I001', 'Smartphone'),
('L002', '2023-05-05', 'Active', 'U003', 19.99, 50, 'Cotton t-shirt in various sizes', 'I002', 'T-shirt'),
('L003', '2023-05-10', 'Inactive', 'U004', 129.99, 5, 'High-quality coffee maker with stainless steel body', 'I003', 'Coffee Maker'),
('L004', '2023-05-12', 'Active', 'U002', 899.99, 3, 'Laptop with fast processor and high storage', 'I004', 'Laptop'),
('L005', '2023-05-15', 'Active', 'U005', 49.99, 20, 'Blender with multiple speed settings', 'I005', 'Blender');
INSERT INTO Shipping (ShippingID, ShippingAddr1, ShippingAddr2, ShippingCity, ShippingState, ShippingZipcode, ShippingCountry, ShippingStatus, TrackingNumber)
VALUES
('S001', '123 Main St', 'Apt 1', 'Springfield', 'IL', '62701', 'USA', 'Shipped', '1Z999AA10123456784'),
('S002', '456 Market St', 'Suite 200', 'San Francisco', 'CA', '94105', 'USA', 'Delivered', '1Z999AA10123456785'),
('S003', '789 Oak St', 'Unit 4B', 'Boston', 'MA', '02118', 'USA', 'In Transit', '1Z999AA10123456786'),
('S004', '101 Maple St', 'Floor 2', 'Los Angeles', 'CA', '90001', 'USA', 'Shipped', '1Z999AA10123456787'),
('S005', '202 Pine St', 'Apt 9', 'Miami', 'FL', '33101', 'USA', 'Returned', '1Z999AA10123456788');

INSERT INTO Transactions (TransID, ListingID, ItemID, CreateDate, BuyerID, PaymentID, CheckoutStatus, FinalSalesPrice, Tax, ShippingID, Quantity)
VALUES
('T001', 'L001', 'I001', '2023-06-01', 'U002', 'P001', 'Completed', 699.99, 20.99, 'S001', 1),
('T002', 'L002', 'I002', '2023-06-05', 'U004', 'P002', 'Completed', 19.99, 2.00, 'S002', 2),
('T003', 'L003', 'I003', '2023-06-10', 'U005', 'P003', 'Pending', 129.99, 7.50, 'S003', 1),
('T004', 'L004', 'I004', '2023-06-12', 'U001', 'P004', 'Completed', 899.99, 30.00, 'S004', 1),
('T005', 'L005', 'I005', '2023-06-15', 'U003', 'P005', 'Cancelled', 49.99, 3.00, 'S005', 1);

ALTER TABLE Transactions ADD CONSTRAINT fk_listing FOREIGN KEY (ListingID) REFERENCES Listings(ListingID);
ALTER TABLE Transactions ADD CONSTRAINT fk_item FOREIGN KEY (ItemID) REFERENCES Items(ItemID);
ALTER TABLE Transactions ADD CONSTRAINT fk_user FOREIGN KEY (BuyerID) REFERENCES Users(UserID);
ALTER TABLE Transactions ADD CONSTRAINT fk_payment FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);
ALTER TABLE Transactions ADD CONSTRAINT fk_shipping FOREIGN KEY (ShippingID) REFERENCES Shipping(ShippingID);

ALTER TABLE Listings ADD CONSTRAINT fk_item_listing FOREIGN KEY (ItemID) REFERENCES Items(ItemID);
ALTER TABLE Listings ADD CONSTRAINT fk_user_listing FOREIGN KEY (SellerID) REFERENCES Users(UserID);

-- Select all data from the Users table
-- This will give you every piece of information available for all users
SELECT * FROM Users;

-- Select just the FullName and PhoneNumber of all users
-- If you only need contact details for users, this query will pull that specific data
SELECT FullName, PhoneNumber FROM Users;

-- Retrieve all transactions where the BuyerID is 'U002'
-- This can help us see what 'U002' bought, when, and for how much
SELECT * FROM Transactions WHERE BuyerID = 'U002';

-- Get all active listings where the seller's ID is 'U001'
-- This will show you which items Seller 'U001' has listed and their prices
SELECT * FROM Listings WHERE ListingStatus = 'Active' AND SellerID = 'U001';

-- Fetch all items, but this time order them by ItemName
-- Useful if you want to see the list sorted alphabetically by item name
SELECT * FROM Items ORDER BY ItemName;

-- Only show the first 3 rows from the Payments table
-- This is a quick way to get a sneak peek of the payment records
SELECT * FROM Payments LIMIT 3;

-- Joining Tables

-- Get listing details along with the item name by joining Listings and Items tables on ItemID
-- This will let you see which items belong to each listing
SELECT Listings.ListingID, Listings.ListingPrice, Items.ItemName
FROM Listings
INNER JOIN Items ON Listings.ItemID = Items.ItemID;

-- Get a list of users and their listings, even if they have no listings
-- This is a left join, meaning we show all users even if they don't have items listed
SELECT Users.UserID, Listings.ListingID, Listings.ListingPrice
FROM Users
LEFT JOIN Listings ON Users.UserID = Listings.SellerID;

-- Fetch transaction details, buyer names, and item names
-- This gives a complete view of who bought what, and at what price, from the transactions
SELECT Transactions.TransID, Users.FullName, Items.ItemName, Transactions.FinalSalesPrice
FROM Transactions
JOIN Users ON Transactions.BuyerID = Users.UserID
JOIN Items ON Transactions.ItemID = Items.ItemID;

-- Using INSERT, UPDATE, and DELETE Commands

-- Add a new user to the Users table
-- This is how you'd create a new user in the system, for example a new buyer
INSERT INTO Users (UserID, FullName, RegDate, SellerDocSignedDate, BirthDate, PhoneNumber, Address, IDVerificationStatus, UserStatus, IsCompanySeller, CompanyName)
VALUES ('U006', 'Frank Buyer', '2023-06-25', NULL, '1993-03-12', '1239874560', '500 Broadway St, New York, NY', 0, 'Active', 0, NULL);

-- Update a user's phone number
-- This query will change the contact info of 'U002' in the system
UPDATE Users
SET PhoneNumber = '5551234567'
WHERE UserID = 'U002';

-- Delete a user from the Users table
-- If you need to remove 'U006' from the system, this is the command you'd use
DELETE FROM Users WHERE UserID = 'U006';

-- More Advanced Queries

-- Count how many listings are currently active
-- This is useful if you want to see the number of products available for sale right now
SELECT COUNT(*) AS ActiveListings FROM Listings WHERE ListingStatus = 'Active';

-- Calculate total sales for each item
-- This query totals up the sales for every item, helping to track how much each item has sold for
SELECT ItemID, SUM(FinalSalesPrice) AS TotalSales
FROM Transactions
GROUP BY ItemID;

-- Show the total sales for each seller, but only those who have made over $1000 in sales
-- A great way to identify top-performing sellers
SELECT SellerID, SUM(FinalSalesPrice) AS TotalSales
FROM Transactions
GROUP BY SellerID
HAVING SUM(FinalSalesPrice) > 1000;

-- Subqueries

-- Find users who bought items worth more than $100
-- This query first finds all the transactions over $100, then fetches the buyer information for those
SELECT FullName
FROM Users
WHERE UserID IN (SELECT BuyerID FROM Transactions WHERE FinalSalesPrice > 100);

-- Find listings priced higher than the average price in the Listings table
-- This query compares the price of each listing to the average price of all listings
SELECT * 
FROM Listings
WHERE ListingPrice > (SELECT AVG(ListingPrice) FROM Listings);
