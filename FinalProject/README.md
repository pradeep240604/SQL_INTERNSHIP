FINAL PROJECT - SQL Internship
Author: Sai Pradeep Kala
GitHub Username: pradeep240604
Email: saipradeep2464@gmail.com
🏬 Inventory and Warehouse Management System

This project is a comprehensive SQL-based backend solution designed for managing and tracking inventory across multiple warehouses. Built using *MySQL* and *DBeaver*, it demonstrates core concepts in relational database design, procedural SQL, and warehouse operations automation.

---

🎯 Objective

To develop a structured Inventory and Warehouse Management System that:
- Tracks product stock across multiple warehouse locations
- Associates products with suppliers
- Alerts for low-stock situations automatically
- Facilitates stock transfers between warehouses
- Generates inventory reports for decision-making

---

🛠 Tools & Technologies

- *MySQL* – Relational database engine
- *DBeaver* – SQL GUI client for development and ER modeling
- *SQL* – Used for schema creation, data manipulation, automation, and analytics

---

🧱 Database Design Overview

The system consists of four main entities:

- *Supplier*: Stores supplier information such as name and contact.
- *Product*: Contains product details, unit price, reorder levels, and supplier linkage.
- *Warehouse*: Maintains warehouse locations and identifiers.
- *Stock*: A bridge table that tracks how much of each product is available at each warehouse, enabling many-to-many relationships between products and warehouses.

This schema supports normalization and ensures scalability for real-world warehouse operations.

---

🔗 Relationships

-  One-to-Many : Each supplier can supply multiple products.
-  Many-to-Many: Each product can be stored in multiple warehouses, and each warehouse can hold multiple products (handled via the Stock table).

---

🔔 Features Implemented

 ->1. Inventory Tracking

	All inventory records are maintained per warehouse with quantities, allowing a centralized view of available products and real-time stock status.

 ->2. Low Stock Notification Trigger

	A trigger is implemented to automatically raise an alert when a newly inserted stock record is below the predefined reorder level for that product. This simulates automated low-stock notifications in real inventory systems.

 ->3. Stored Procedure for Stock Transfer

	A stored procedure enables seamless transfer of product quantities from one warehouse to another. It ensures that the source stock is reduced and the destination stock is either created or updated accordingly.

 ->4. View for Inventory Summary

	A database view is created to display a consolidated view of all product quantities across warehouses along with their reorder levels, making it easier to monitor inventory in one place.

 ->5. Inventory Reports

	Several SQL queries are written to generate reports such as:
	- Products currently below reorder levels
	- Total quantity of each product across warehouses
	- Inventory breakdown per warehouse

---

 ✅ Key Learning Outcomes

	- Practical implementation of *relational schema design*
	- Handling *many-to-many* relationships in inventory systems
	- Using *triggers* for real-time alerting
	- Developing *stored procedures* to automate stock transfers
	- Creating *views* and *aggregate queries* for business intelligence
	- Hands-on practice with *MySQL* and *DBeaver*

---

 📁 Project Components

	- *Schema Definition* – Tables for products, warehouses, suppliers, and stock
	- *Sample Data* – Insertions for testing queries and triggers
	- *Trigger Logic* – For low-stock alerts
	- *Stored Procedure* – For moving stock between warehouses
	- *Reporting Queries* – For generating insights
	- *README File* – Project documentation

---

 💼 Use Cases

	This project is an ideal fit for:
		- College mini/main projects
	- SQL/Data Engineering portfolios
	- Demonstrating backend database skills in interviews
	- Freelance or small-scale warehouse backend systems

---

 📌 Conclusion

	The Inventory and Warehouse Management System project reflects a strong grasp of SQL fundamentals and backend logic required in modern inventory applications. With proper schema planning, business rule automation, and reporting, it is ready to showcase in your job portfolio or GitHub.
