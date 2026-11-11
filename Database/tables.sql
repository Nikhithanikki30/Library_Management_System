
-- =====================================================
-- PROJECT: LIBRARY MANAGEMENT SYSTEM
-- FILE: tables.sql
-- DESCRIPTION: Creation of all 15 database tables
-- =====================================================

USE library_management;


-- 1. AUTHORS TABLE
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);


-- 2. PUBLISHERS TABLE
CREATE TABLE IF NOT EXISTS Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
);


-- 3. CATEGORIES TABLE
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);


-- 4. BOOKS TABLE
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    author_id INT NOT NULL,
    publisher_id INT,
    category_id INT NOT NULL,
    publication_year YEAR,
    language VARCHAR(50) DEFAULT 'English',
    price DECIMAL(10,2),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    CHECK (price IS NULL OR price >= 0)
);


-- 5. BOOK_COPIES TABLE
CREATE TABLE IF NOT EXISTS Book_Copies (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    accession_number VARCHAR(30) NOT NULL UNIQUE,
    shelf_location VARCHAR(50),
    status ENUM('Available','Issued','Reserved','Lost','Damaged')
        DEFAULT 'Available',
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- 6. STUDENTS TABLE
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(100),
    admission_date DATE
);


-- 7. STAFF TABLE
CREATE TABLE IF NOT EXISTS Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    designation VARCHAR(50),
    joining_date DATE
);


-- 8. MEMBERSHIPS TABLE
CREATE TABLE IF NOT EXISTS Memberships (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    membership_number VARCHAR(30) NOT NULL UNIQUE,
    student_id INT NOT NULL,
    start_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    status ENUM('Active','Expired','Suspended')
        DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CHECK (expiry_date >= start_date)
);


-- 9. BOOK_ISSUES TABLE
CREATE TABLE IF NOT EXISTS Book_Issues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    membership_id INT NOT NULL,
    copy_id INT NOT NULL,
    issued_by_staff_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('Issued','Returned','Overdue','Lost')
        DEFAULT 'Issued',
    FOREIGN KEY (membership_id) REFERENCES Memberships(membership_id),
    FOREIGN KEY (copy_id) REFERENCES Book_Copies(copy_id),
    FOREIGN KEY (issued_by_staff_id) REFERENCES Staff(staff_id),
    CHECK (due_date >= issue_date)
);


-- 10. BOOK_RETURNS TABLE
CREATE TABLE IF NOT EXISTS Book_Returns (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT NOT NULL UNIQUE,
    received_by_staff_id INT NOT NULL,
    return_date DATE NOT NULL,
    book_condition ENUM('Good','Damaged','Lost')
        DEFAULT 'Good',
    remarks VARCHAR(255),
    FOREIGN KEY (issue_id) REFERENCES Book_Issues(issue_id),
    FOREIGN KEY (received_by_staff_id) REFERENCES Staff(staff_id)
);


-- 11. RESERVATIONS TABLE
CREATE TABLE IF NOT EXISTS Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    expiry_date DATE,
    status ENUM('Pending','Fulfilled','Cancelled','Expired')
        DEFAULT 'Pending',
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CHECK (expiry_date IS NULL OR expiry_date >= reservation_date)
);


-- 12. FINES TABLE
CREATE TABLE IF NOT EXISTS Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT NOT NULL UNIQUE,
    fine_amount DECIMAL(10,2) NOT NULL,
    fine_reason VARCHAR(150),
    fine_date DATE NOT NULL,
    status ENUM('Unpaid','Partially_Paid','Paid','Waived')
        DEFAULT 'Unpaid',
    FOREIGN KEY (issue_id) REFERENCES Book_Issues(issue_id),
    CHECK (fine_amount >= 0)
);


-- 13. PAYMENTS TABLE
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    fine_id INT NOT NULL,
    received_by_staff_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Cash','UPI','Card','Online'),
    FOREIGN KEY (fine_id) REFERENCES Fines(fine_id),
    FOREIGN KEY (received_by_staff_id) REFERENCES Staff(staff_id),
    CHECK (amount_paid > 0)
);


-- 14. SUPPLIERS TABLE
CREATE TABLE IF NOT EXISTS Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
);


-- 15. PURCHASE_ORDERS TABLE
CREATE TABLE IF NOT EXISTS Purchase_Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NOT NULL,
    book_id INT NOT NULL,
    ordered_by_staff_id INT NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery DATE,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    status ENUM('Pending','Ordered','Received','Cancelled')
        DEFAULT 'Pending',
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (ordered_by_staff_id) REFERENCES Staff(staff_id),
    CHECK (quantity > 0),
    CHECK (unit_price >= 0),
    CHECK (expected_delivery IS NULL OR expected_delivery >= order_date)
);


-- =====================================================
-- VERIFY TABLE CREATION
-- =====================================================

SHOW TABLES;

