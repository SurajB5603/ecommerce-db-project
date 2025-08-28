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
*(Include your ER diagram image here once uploaded to the repo)*  

---

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
