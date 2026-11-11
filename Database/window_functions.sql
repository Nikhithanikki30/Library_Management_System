
USE library_management;


-- 1. Assign row numbers to books based on price
SELECT
    title,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num
FROM Books;


-- 2. Rank books based on their prices
SELECT
    title,
    price,
    RANK() OVER (ORDER BY price DESC) AS book_rank
FROM Books;


-- 3. Rank books within each category
SELECT
    title,
    category_id,
    price,
    DENSE_RANK() OVER (
        PARTITION BY category_id
        ORDER BY price DESC
    ) AS category_rank
FROM Books;


-- 4. Calculate running total of payments
SELECT
    payment_id,
    payment_date,
    amount_paid,
    SUM(amount_paid) OVER (
        ORDER BY payment_date, payment_id
    ) AS running_total
FROM Payments;


-- 5. Display previous issue date for each membership
SELECT
    membership_id,
    issue_id,
    issue_date,
    LAG(issue_date) OVER (
        PARTITION BY membership_id
        ORDER BY issue_date
    ) AS previous_issue_date
FROM Book_Issues;


-- 6. Display next issue date for each membership
SELECT
    membership_id,
    issue_id,
    issue_date,
    LEAD(issue_date) OVER (
        PARTITION BY membership_id
        ORDER BY issue_date
    ) AS next_issue_date
FROM Book_Issues;
