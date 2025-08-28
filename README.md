# 📦 E-Commerce Management System (Database Project)

Final Project - Database - Group 6 (Part One)

---

## 👥 Team Members
- **Boyan Qin** - Database Designer  
- **Gracia (Junzhu) Zhang** - Project Manager (Organizing Part One Doc)  
- **Jonathan Hernandez** - Documenter (Presentation)  
- **Lili Zheng** - Security Specialist  
- **Suraj Bashyal** - SQL Developer  

---

## 📖 Project Overview
The project is an **E-commerce Management System** designed to handle products, orders, and customer records efficiently.  

### Purpose
- Provide a reliable and scalable solution for sellers to manage inventory, track orders, and maintain customer information.  
- Improve operational efficiency, ensure data consistency, and enhance customer experience.  

### Users
- **Sellers** → Manage product catalogs, track orders, analyze customer data.  
- **Admin Staff** → Update products, manage orders, support customers.  

### Key Functionalities
- **Catalog Management**: Organize, update, and manage product details.  
- **Order Tracking**: Monitor and update order statuses in real-time.  
- **Customer Records**: Store customer profiles and purchase history.  
- **Data Security**: Protect and verify customer/seller data.  
- **Scalability**: Handle growing business needs reliably.  

---

## 🗂 Database Design

### Entities & Attributes
- **Users**: UserID, FullName, RegDate, BirthDate, Address, PhoneNumber, Status, etc.  
- **Items**: ItemID, CategoryID, CategoryName, ItemName.  
- **Listings**: ListingID, ListingDate, Status, SellerID, Price, Quantity, etc.  
- **Transactions**: TransID, ListingID, ItemID, BuyerID, PaymentID, ShippingID, Price, Tax.  
- **Payments**: PaymentID, Type, CreatedDate, Status.  
- **Shipping**: ShippingID, Address, City, State, Country, TrackingNumber, Status.  

### ER Diagram  

---

## 🔄 Normalization

The schema is normalized up to **3rd Normal Form (3NF)**:

- **1NF** → Removed repeating groups.  
- **2NF** → Separated items and categories.  
- **3NF** → Eliminated transitive dependencies.  

---

## 🛠 SQL Implementation

The project includes:

- **DDL (Data Definition Language):** Creating tables with keys and constraints.  
- **DML (Data Manipulation Language):** Inserting sample data into each table.  
- **Queries:** Basic retrieval, joins, aggregations, subqueries.  
- **Data Manipulation:** Insert, update, delete operations.

## 🔐 Database Integrity & Security

We enforce data consistency and protection using:

**Integrity:**

- **Primary Keys:** Guarantee unique identifiers.  
- **Foreign Keys:** Maintain relationships between tables.  
- **Unique Constraints:** Prevent duplicate entries.  
- **Check Constraints:** Restrict values to valid ranges.  

**Role-Based Access Control (RBAC):**

- `Group6_user` → Limited permissions (SELECT, INSERT, UPDATE).  
- `Group6_admin` → Full privileges (CREATE, DELETE, etc.).  

**Data Security:**

- **AES Encryption:** Encrypts sensitive user data (e.g., phone numbers).  
- Secure retrieval and decryption with `AES_DECRYPT()`.  

---

## 📌 Future Enhancements

- ✅ Add triggers for automated inventory updates.  
- ✅ Create stored procedures for order processing.  
- ✅ Integrate with a front-end application.

For more details, please read the [project documentation PDF] (./docs/Final Project-Database.pdf)
  
## 📊 Relational Schema
Each table is created with **primary keys**, **foreign keys**, and **constraints** for data integrity.  

Example:  
```sql
CREATE TABLE Users (
  UserID VARCHAR(50) PRIMARY KEY,
  FullName VARCHAR(50),
  RegDate TIMESTAMP,
  BirthDate DATE,
  PhoneNumber VARCHAR(50),
  Address VARCHAR(300),
  IDVerificationStatus BOOLEAN,
  UserStatus VARCHAR(50),
  IsCompanySeller BOOLEAN,
  CompanyName VARCHAR(100)
);


-- Select all users
SELECT * FROM Users;

-- Select names and phone numbers only
SELECT FullName, PhoneNumber FROM Users;

-- Retrieve all transactions of Buyer 'U002'
SELECT * FROM Transactions WHERE BuyerID = 'U002'; 



-- Get listing details with item names
SELECT Listings.ListingID, Listings.ListingPrice, Items.ItemName
FROM Listings
INNER JOIN Items ON Listings.ItemID = Items.ItemID;

-- Get buyers and their purchases
SELECT Transactions.TransID, Users.FullName, Items.ItemName,
       Transactions.FinalSalesPrice
FROM Transactions
JOIN Users ON Transactions.BuyerID = Users.UserID
JOIN Items ON Transactions.ItemID = Items.ItemID; 


