
USE library_management;

DELIMITER $$

-- 1. Display all books
DROP PROCEDURE IF EXISTS GetAllBooks $$
CREATE PROCEDURE GetAllBooks()
BEGIN
    SELECT * FROM Books;
END $$


-- 2. Display books by category
DROP PROCEDURE IF EXISTS GetBooksByCategory $$
CREATE PROCEDURE GetBooksByCategory(
    IN category_input INT
)
BEGIN
    SELECT title, price
    FROM Books
    WHERE category_id = category_input;
END $$


-- 3. Display student details
DROP PROCEDURE IF EXISTS GetStudentDetails $$
CREATE PROCEDURE GetStudentDetails(
    IN student_input INT
)
BEGIN
    SELECT *
    FROM Students
    WHERE student_id = student_input;
END $$


-- 4. Display books issued by a student
DROP PROCEDURE IF EXISTS GetStudentIssuedBooks $$
CREATE PROCEDURE GetStudentIssuedBooks(
    IN student_input INT
)
BEGIN
    SELECT
        s.student_name,
        b.title,
        i.issue_date,
        i.due_date,
        i.status
    FROM Students s
    INNER JOIN Memberships m
    ON s.student_id = m.student_id
    INNER JOIN Book_Issues i
    ON m.membership_id = i.membership_id
    INNER JOIN Book_Copies bc
    ON i.copy_id = bc.copy_id
    INNER JOIN Books b
    ON bc.book_id = b.book_id
    WHERE s.student_id = student_input;
END $$


-- 5. Display unpaid fines
DROP PROCEDURE IF EXISTS GetUnpaidFines $$
CREATE PROCEDURE GetUnpaidFines()
BEGIN
    SELECT *
    FROM Fines
    WHERE status IN ('Unpaid', 'Partially_Paid');
END $$

DELIMITER ;

CALL GetAllBooks();
CALL GetBooksByCategory(1);
CALL GetStudentDetails(1);
CALL GetStudentIssuedBooks(1);
CALL GetUnpaidFines();

SHOW PROCEDURE STATUS
WHERE Db = 'library_management';