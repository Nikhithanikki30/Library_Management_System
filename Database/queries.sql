
USE library_management;

-- SECTION 1: BASIC SQL

-- 1. Display all books
SELECT * FROM Books;

-- 2. Display all student details
SELECT * FROM Students;

-- 3. Display books with price greater than 300
SELECT title, price
FROM Books
WHERE price > 300;

-- 4. Display students whose names start with A
SELECT *
FROM Students
WHERE student_name LIKE 'A%';

-- 5. Display the five most expensive books
SELECT title, price
FROM Books
ORDER BY price DESC
LIMIT 5;


-- SECTION 2: AGGREGATE FUNCTIONS

-- 6. Count the total number of books
SELECT COUNT(*) AS total_books
FROM Books;

-- 7. Find the average price of books
SELECT AVG(price) AS average_price
FROM Books;

-- 8. Count books in each category
SELECT category_id, COUNT(*) AS total_books
FROM Books
GROUP BY category_id;

-- 9. Find departments having more than two students
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 2;

-- 10. Find total fine amount by status
SELECT status, SUM(fine_amount) AS total_fine
FROM Fines
GROUP BY status;


-- SECTION 3: JOINS

-- 11. Display books with author names
SELECT b.title, a.author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

-- 12. Display books with category names
SELECT b.title, c.category_name
FROM Books b
INNER JOIN Categories c
ON b.category_id = c.category_id;

-- 13. Display students and their membership numbers
SELECT s.student_name, m.membership_number
FROM Students s
INNER JOIN Memberships m
ON s.student_id = m.student_id;

-- 14. Display students and the books they issued
SELECT s.student_name, b.title, i.issue_date
FROM Students s
INNER JOIN Memberships m
ON s.student_id = m.student_id
INNER JOIN Book_Issues i
ON m.membership_id = i.membership_id
INNER JOIN Book_Copies bc
ON i.copy_id = bc.copy_id
INNER JOIN Books b
ON bc.book_id = b.book_id;

-- 15. Display all books and their copy status
SELECT b.title, bc.accession_number, bc.status
FROM Books b
LEFT JOIN Book_Copies bc
ON b.book_id = bc.book_id;

-- 16. Display fine details with student names
SELECT s.student_name, f.fine_amount, f.status
FROM Students s
INNER JOIN Memberships m
ON s.student_id = m.student_id
INNER JOIN Book_Issues i
ON m.membership_id = i.membership_id
INNER JOIN Fines f
ON i.issue_id = f.issue_id;

-- 17. Display purchase orders with supplier names
SELECT po.order_id, s.supplier_name, po.quantity, po.status
FROM Purchase_Orders po
INNER JOIN Suppliers s
ON po.supplier_id = s.supplier_id;


-- SECTION 4: SUBQUERIES

-- 18. Find books costing more than the average price
SELECT title, price
FROM Books
WHERE price > (
    SELECT AVG(price)
    FROM Books
);

-- 19. Find the most expensive book
SELECT title, price
FROM Books
WHERE price = (
    SELECT MAX(price)
    FROM Books
);

-- 20. Find books that have never been issued
SELECT b.title
FROM Books b
WHERE NOT EXISTS (
    SELECT 1
    FROM Book_Copies bc
    INNER JOIN Book_Issues i
    ON bc.copy_id = i.copy_id
    WHERE bc.book_id = b.book_id
);

-- 21. Find students who have not issued any books
SELECT s.student_name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Memberships m
    INNER JOIN Book_Issues i
    ON m.membership_id = i.membership_id
    WHERE m.student_id = s.student_id
);


-- SECTION 5: PRACTICAL SQL QUERIES

-- 22. Display overdue books
SELECT b.title, s.student_name, i.due_date
FROM Book_Issues i
INNER JOIN Book_Copies bc
ON i.copy_id = bc.copy_id
INNER JOIN Books b
ON bc.book_id = b.book_id
INNER JOIN Memberships m
ON i.membership_id = m.membership_id
INNER JOIN Students s
ON m.student_id = s.student_id
WHERE i.due_date < CURDATE()
AND i.status = 'Issued';

-- 23. Display books available for issue
SELECT b.title, bc.accession_number
FROM Books b
INNER JOIN Book_Copies bc
ON b.book_id = bc.book_id
WHERE bc.status = 'Available';

-- 24. Display students with active memberships
SELECT s.student_name, m.membership_number
FROM Students s
INNER JOIN Memberships m
ON s.student_id = m.student_id
WHERE m.status = 'Active';

-- 25. Display returned books and return dates
SELECT b.title, s.student_name, r.return_date
FROM Book_Returns r
INNER JOIN Book_Issues i
ON r.issue_id = i.issue_id
INNER JOIN Book_Copies bc
ON i.copy_id = bc.copy_id
INNER JOIN Books b
ON bc.book_id = b.book_id
INNER JOIN Memberships m
ON i.membership_id = m.membership_id
INNER JOIN Students s
ON m.student_id = s.student_id;

-- 26. Display payment details
SELECT payment_id, fine_id, amount_paid, payment_method
FROM Payments;

-- 27. Count books issued by each staff member
SELECT st.staff_name, COUNT(i.issue_id) AS total_issues
FROM Staff st
LEFT JOIN Book_Issues i
ON st.staff_id = i.issued_by_staff_id
GROUP BY st.staff_id, st.staff_name;

-- 28. Display reservations with student and book details
SELECT s.student_name, b.title, r.reservation_date, r.status
FROM Reservations r
INNER JOIN Students s
ON r.student_id = s.student_id
INNER JOIN Books b
ON r.book_id = b.book_id;

-- 29. Calculate total purchase order value
SELECT order_id, quantity, unit_price,
       quantity * unit_price AS total_order_value
FROM Purchase_Orders;

-- 30. Display book issue status using CASE
SELECT issue_id, due_date, status,
CASE
    WHEN status = 'Returned' THEN 'Completed'
    WHEN due_date < CURDATE() AND status = 'Issued' THEN 'Overdue'
    ELSE 'Within Due Date'
END AS issue_condition
FROM Book_Issues;
