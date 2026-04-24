
CREATE DATABASE IF NOT EXISTS bank;
USE bank;

CREATE TABLE accounts (
    kontonummer INT PRIMARY KEY,
    kontoinhaber VARCHAR(100),
    kontostand DECIMAL(10,2)
);


INSERT INTO accounts VALUES
(1, 'Juan', 1000.00),
(2, 'Maria', 500.00),
(3, 'Carlos', 200.00);


DELIMITER //

CREATE PROCEDURE ueberweisung (
    IN sender INT,
    IN empfaenger INT,
    IN betrag DECIMAL(10,2)
)
BEGIN
    DECLARE sender_saldo DECIMAL(10,2);

    START TRANSACTION;
    -- Start transaction

    SELECT kontostand INTO sender_saldo
    FROM accounts
    WHERE kontonummer = sender;
    -- Get current balance of sender

    IF sender_saldo IS NULL THEN
        ROLLBACK;
        -- Rollback if account does not exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Konto existiert nicht';

    ELSEIF sender_saldo < betrag THEN
        ROLLBACK;
        -- Rollback if insufficient funds
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nicht genug Guthaben';

    ELSE
        UPDATE accounts
        SET kontostand = kontostand - betrag
        WHERE kontonummer = sender;
        -- Deduct money from sender

        UPDATE accounts
        SET kontostand = kontostand + betrag
        WHERE kontonummer = empfaenger;
        -- Add money to receiver

        COMMIT;
        -- Commit transaction if everything is successful
    END IF;

END //

DELIMITER ;
SELECT * FROM accounts;


CALL ueberweisung(1, 2, 300.00);     -- works - Juan → Maria
SELECT * FROM accounts;

CALL ueberweisung(2, 3, 100.00);     -- works - Maria → Carlos
SELECT * FROM accounts;

CALL ueberweisung(3, 1, 500.00);     -- doesn't works - Carlos → Juan (insufficient funds)
SELECT * FROM accounts;

CALL ueberweisung(99, 1, 100.00);    -- doesn't works - non-existing sender
SELECT * FROM accounts;