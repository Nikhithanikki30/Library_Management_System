
USE library_management;

-- 1. View displaying complete book details
CREATE OR REPLACE VIEW view_book_details AS
SELECT
    b.book_id,
    b.title,
    a.author_name,
    p.publisher_name,
    c.category_name,
    b.price
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id
LEFT JOIN Publishers p
ON b.publisher_id = p.publisher_id
INNER JOIN Categories c
ON b.category_id = c.category_id;


-- 2. View displaying available books
CREATE OR REPLACE VIEW view_available_books AS
SELECT
    b.title,
    bc.accession_number,
    bc.shelf_location,
    bc.status
FROM Books b
INNER JOIN Book_Copies bc
ON b.book_id = bc.book_id
WHERE bc.status = 'Available';


-- 3. View displaying active memberships
CREATE OR REPLACE VIEW view_active_memberships AS
SELECT
    s.student_name,
    s.department,
    m.membership_number,
    m.start_date,
    m.expiry_date
FROM Students s
INNER JOIN Memberships m
ON s.student_id = m.student_id
WHERE m.status = 'Active';


-- 4. View displaying issued book details
CREATE OR REPLACE VIEW view_issued_books AS
SELECT
    s.student_name,
    b.title,
    i.issue_date,
    i.due_date,
    i.status
FROM Book_Issues i
INNER JOIN Memberships m
ON i.membership_id = m.membership_id
INNER JOIN Students s
ON m.student_id = s.student_id
INNER JOIN Book_Copies bc
ON i.copy_id = bc.copy_id
INNER JOIN Books b
ON bc.book_id = b.book_id;


-- 5. View displaying unpaid fines
CREATE OR REPLACE VIEW view_unpaid_fines AS
SELECT
    s.student_name,
    b.title,
    f.fine_amount,
    f.fine_reason,
    f.status
FROM Fines f
INNER JOIN Book_Issues i
ON f.issue_id = i.issue_id
INNER JOIN Memberships m
ON i.membership_id = m.membership_id
INNER JOIN Students s
ON m.student_id = s.student_id
INNER JOIN Book_Copies bc
ON i.copy_id = bc.copy_id
INNER JOIN Books b
ON bc.book_id = b.book_id
WHERE f.status IN ('Unpaid', 'Partially_Paid');


-- Display all created views
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
