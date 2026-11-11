USE library_management;

-- Create Trigger 1 – Update book copy status after issuing a book
DELIMITER $$

CREATE TRIGGER after_book_issue
AFTER INSERT ON Book_Issues
FOR EACH ROW
BEGIN
    UPDATE Book_Copies
    SET copy_status = 'Issued'
    WHERE copy_id = NEW.copy_id;
END $$

DELIMITER ;

-- Create Trigger 2 – Update book copy status after returning a book
DELIMITER $$

CREATE TRIGGER after_book_return
AFTER INSERT ON Book_Returns
FOR EACH ROW
BEGIN
    UPDATE Book_Copies
    SET copy_status = 'Available'
    WHERE copy_id = (
        SELECT copy_id
        FROM Book_Issues
        WHERE issue_id = NEW.issue_id
    );
END $$

DELIMITER ;

-- Create Trigger 3 – Update fine payment status
DELIMITER $$

CREATE TRIGGER after_fine_payment
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    UPDATE Fines
    SET payment_status = 'Paid'
    WHERE fine_id = NEW.fine_id;
END $$

DELIMITER ;

SHOW TRIGGERS FROM library_management;