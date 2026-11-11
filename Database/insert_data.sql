
-- =====================================================
-- PROJECT: LIBRARY MANAGEMENT SYSTEM
-- FILE: insert_data.sql
-- DESCRIPTION: Insert sample records into all tables
-- =====================================================

USE library_management;


-- 1. AUTHORS
INSERT INTO Authors (author_name, country) VALUES
('Chetan Bhagat', 'India'),
('R.K. Narayan', 'India'),
('A.P.J. Abdul Kalam', 'India'),
('J.K. Rowling', 'United Kingdom'),
('George Orwell', 'United Kingdom'),
('Paulo Coelho', 'Brazil'),
('Agatha Christie', 'United Kingdom'),
('Stephen Hawking', 'United Kingdom');


-- 2. PUBLISHERS
INSERT INTO Publishers
(publisher_name, email, phone, address) VALUES
('Rupa Publications', 'info@rupa.com', '9876543210', 'New Delhi'),
('Penguin Random House', 'info@penguin.com', '9876543211', 'Mumbai'),
('HarperCollins', 'contact@harper.com', '9876543212', 'Chennai'),
('Bloomsbury Publishing', 'info@bloomsbury.com', '9876543213', 'London'),
('S.Chand Publishing', 'info@schand.com', '9876543214', 'New Delhi');


-- 3. CATEGORIES
INSERT INTO Categories (category_name, description) VALUES
('Fiction', 'Fictional stories and novels'),
('Science', 'Science and technology books'),
('Biography', 'Life stories of famous people'),
('Fantasy', 'Fantasy and magical stories'),
('Mystery', 'Mystery and detective novels'),
('Technology', 'Computer and programming books');


-- 4. BOOKS
INSERT INTO Books
(title, isbn, author_id, publisher_id, category_id,
 publication_year, language, price) VALUES
('Five Point Someone', 'ISBN1001', 1, 1, 1, 2004, 'English', 250.00),
('Malgudi Days', 'ISBN1002', 2, 2, 1, 1943, 'English', 300.00),
('Wings of Fire', 'ISBN1003', 3, 2, 3, 1999, 'English', 350.00),
('Harry Potter', 'ISBN1004', 4, 4, 4, 1997, 'English', 500.00),
('1984', 'ISBN1005', 5, 3, 1, 1949, 'English', 280.00),
('The Alchemist', 'ISBN1006', 6, 2, 1, 1988, 'English', 320.00),
('Murder on the Orient Express', 'ISBN1007', 7, 3, 5, 1934, 'English', 400.00),
('A Brief History of Time', 'ISBN1008', 8, 5, 2, 1988, 'English', 450.00);


-- 5. BOOK_COPIES
INSERT INTO Book_Copies
(book_id, accession_number, shelf_location, status) VALUES
(1, 'LIB001', 'A-01', 'Available'),
(1, 'LIB002', 'A-01', 'Available'),
(1, 'LIB003', 'A-01', 'Available'),
(2, 'LIB004', 'A-02', 'Available'),
(2, 'LIB005', 'A-02', 'Available'),
(3, 'LIB006', 'B-01', 'Available'),
(3, 'LIB007', 'B-01', 'Available'),
(4, 'LIB008', 'B-02', 'Available'),
(4, 'LIB009', 'B-02', 'Available'),
(5, 'LIB010', 'C-01', 'Available'),
(5, 'LIB011', 'C-01', 'Available'),
(6, 'LIB012', 'C-02', 'Available'),
(7, 'LIB013', 'D-01', 'Available'),
(8, 'LIB014', 'D-02', 'Available'),
(8, 'LIB015', 'D-02', 'Available');


-- 6. STUDENTS
INSERT INTO Students
(student_name, email, phone, department, admission_date) VALUES
('Rahul Kumar', 'rahul@gmail.com', '9000000001', 'CSE', '2024-06-10'),
('Priya Sharma', 'priya@gmail.com', '9000000002', 'ECE', '2024-06-12'),
('Arjun Reddy', 'arjun@gmail.com', '9000000003', 'IT', '2023-07-15'),
('Sneha Rao', 'sneha@gmail.com', '9000000004', 'CSE', '2023-08-20'),
('Kiran Kumar', 'kiran@gmail.com', '9000000005', 'EEE', '2024-07-01'),
('Anjali Patel', 'anjali@gmail.com', '9000000006', 'IT', '2022-06-15'),
('Vikram Singh', 'vikram@gmail.com', '9000000007', 'MECH', '2023-06-18'),
('Divya Reddy', 'divya@gmail.com', '9000000008', 'CSE', '2024-06-25'),
('Manoj Kumar', 'manoj@gmail.com', '9000000009', 'ECE', '2022-07-10'),
('Pooja Sharma', 'pooja@gmail.com', '9000000010', 'CSE', '2023-08-05');


-- 7. STAFF
INSERT INTO Staff
(staff_name, email, phone, designation, joining_date) VALUES
('Ramesh Kumar', 'ramesh@library.com', '9111111111', 'Librarian', '2022-01-10'),
('Suresh Rao', 'suresh@library.com', '9111111112', 'Assistant Librarian', '2023-03-15'),
('Lakshmi Devi', 'lakshmi@library.com', '9111111113', 'Library Manager', '2021-05-20');


-- 8. MEMBERSHIPS
INSERT INTO Memberships
(membership_number, student_id, start_date, expiry_date, status) VALUES
('MEM001', 1, '2026-01-01', '2027-01-01', 'Active'),
('MEM002', 2, '2026-01-01', '2027-01-01', 'Active'),
('MEM003', 3, '2026-01-01', '2027-01-01', 'Active'),
('MEM004', 4, '2026-01-01', '2027-01-01', 'Active'),
('MEM005', 5, '2026-01-01', '2027-01-01', 'Active'),
('MEM006', 6, '2025-01-01', '2026-01-01', 'Expired'),
('MEM007', 7, '2026-01-01', '2027-01-01', 'Active'),
('MEM008', 8, '2026-01-01', '2027-01-01', 'Active'),
('MEM009', 9, '2026-01-01', '2027-01-01', 'Active'),
('MEM010', 10, '2026-01-01', '2027-01-01', 'Active');


-- 9. BOOK_ISSUES
INSERT INTO Book_Issues
(membership_id, copy_id, issued_by_staff_id,
 issue_date, due_date, status) VALUES
(1, 1, 1, '2026-10-20', '2026-11-03', 'Issued'),
(2, 4, 1, '2026-10-15', '2026-10-29', 'Issued'),
(3, 6, 2, '2026-10-01', '2026-10-15', 'Returned'),
(4, 8, 2, '2026-10-25', '2026-11-08', 'Issued'),
(5, 10, 1, '2026-10-10', '2026-10-24', 'Overdue'),
(7, 12, 2, '2026-10-28', '2026-11-11', 'Issued'),
(8, 13, 1, '2026-09-20', '2026-10-04', 'Returned'),
(9, 14, 2, '2026-10-30', '2026-11-13', 'Issued'),
(1, 2, 1, '2026-09-01', '2026-09-15', 'Returned'),
(3, 7, 2, '2026-09-05', '2026-09-19', 'Returned'),
(2, 5, 1, '2026-10-31', '2026-11-14', 'Issued'),
(4, 9, 2, '2026-10-31', '2026-11-14', 'Issued');


-- 10. BOOK_RETURNS
INSERT INTO Book_Returns
(issue_id, received_by_staff_id, return_date,
 book_condition, remarks) VALUES
(3, 1, '2026-10-12', 'Good', 'Returned in good condition'),
(7, 2, '2026-10-02', 'Good', 'Returned before due date'),
(9, 1, '2026-09-14', 'Good', 'Returned on time'),
(10, 2, '2026-09-18', 'Good', 'Returned before due date');


-- 11. RESERVATIONS
INSERT INTO Reservations
(student_id, book_id, reservation_date, expiry_date, status) VALUES
(1, 4, '2026-10-25', '2026-11-05', 'Pending'),
(2, 1, '2026-10-20', '2026-10-30', 'Fulfilled'),
(3, 7, '2026-10-22', '2026-11-02', 'Pending'),
(4, 8, '2026-10-26', '2026-11-06', 'Pending'),
(5, 3, '2026-10-15', '2026-10-25', 'Cancelled');


-- 12. FINES
INSERT INTO Fines
(issue_id, fine_amount, fine_reason, fine_date, status) VALUES
(5, 60.00, 'Late book return', '2026-10-30', 'Unpaid'),
(7, 20.00, 'Late book return', '2026-10-05', 'Paid');


-- 13. PAYMENTS
INSERT INTO Payments
(fine_id, received_by_staff_id, payment_date,
 amount_paid, payment_method) VALUES
(2, 1, '2026-10-10', 20.00, 'UPI');


-- 14. SUPPLIERS
INSERT INTO Suppliers
(supplier_name, contact_person, email, phone, address) VALUES
('ABC Book Distributors', 'Amit Sharma', 'abc@gmail.com', '9222222221', 'Hyderabad'),
('National Book House', 'Raj Kumar', 'national@gmail.com', '9222222222', 'Vijayawada'),
('Global Publishers Supply', 'John Mathew', 'global@gmail.com', '9222222223', 'Chennai');


-- 15. PURCHASE_ORDERS
INSERT INTO Purchase_Orders
(supplier_id, book_id, ordered_by_staff_id,
 order_date, expected_delivery, quantity, unit_price, status) VALUES
(1, 1, 1, '2026-10-20', '2026-11-10', 10, 200.00, 'Ordered'),
(2, 3, 2, '2026-10-22', '2026-11-12', 5, 300.00, 'Pending'),
(3, 8, 3, '2026-10-25', '2026-11-15', 8, 400.00, 'Ordered');


-- =====================================================
-- VERIFY INSERTED DATA
-- =====================================================

SELECT * FROM Authors;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Book_Copies;
SELECT * FROM Students;
SELECT * FROM Staff;
SELECT * FROM Memberships;
SELECT * FROM Book_Issues;
SELECT * FROM Book_Returns;
SELECT * FROM Reservations;
SELECT * FROM Fines;
SELECT * FROM Payments;
SELECT * FROM Suppliers;
SELECT * FROM Purchase_Orders;


-- SELECT COUNT(*) AS total_authors FROM Authors;

-- SELECT COUNT(*) AS total_books FROM Books;

-- SELECT COUNT(*) AS total_students FROM Students;

-- SELECT COUNT(*) AS total_issues FROM Book_Issues;