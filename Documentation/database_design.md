# Library Management System – Database Design

## Database Name
library_management

## Tables

The database contains 15 tables.

| No. | Table Name | Purpose |
|---|---|---|
| 1 | Authors | Stores author information |
| 2 | Publishers | Stores publisher details |
| 3 | Categories | Stores book categories |
| 4 | Books | Stores book information |
| 5 | Book_Copies | Maintains individual book copies |
| 6 | Students | Stores student details |
| 7 | Staff | Stores library staff details |
| 8 | Memberships | Maintains student memberships |
| 9 | Book_Issues | Records issued books |
| 10 | Book_Returns | Records returned books |
| 11 | Reservations | Manages book reservations |
| 12 | Fines | Stores fine information |
| 13 | Payments | Records fine payments |
| 14 | Suppliers | Stores supplier details |
| 15 | Purchase_Orders | Maintains book purchase orders |

## Main Relationships

- Authors are connected to Books.
- Publishers are connected to Books.
- Categories are connected to Books.
- Books are connected to Book_Copies.
- Students are connected to Memberships.
- Memberships are connected to Book_Issues.
- Book_Copies are connected to Book_Issues.
- Staff are connected to Book_Issues and Book_Returns.
- Book_Issues are connected to Book_Returns and Fines.
- Fines are connected to Payments.
- Students and Books are connected to Reservations.
- Suppliers are connected to Purchase_Orders.
- Books and Staff are connected to Purchase_Orders.

## Database Features

- Primary key and foreign key relationships.
- Data validation using constraints.
- SQL queries for data retrieval.
- Views for frequently used reports.
- Stored procedures for reusable operations.
- Window functions for data analysis.