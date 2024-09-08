/*************************************
* Script file name: create stored procedures 
* Programer name: Jonathan Otshudi 
* DATE 2024-03-5
* Description:
*
* Creates all of the requiered stored procedures for the mmorpg database 
*
**************************************/
USE mmorpg;

-- Creates a stored procedure that registers a new account
DELIMITER $$
DROP PROCEDURE IF EXISTS spRegister $$
CREATE PROCEDURE spRegister(
	IN account_N VARCHAR(50)
)
BEGIN 
	DECLARE a_id INT;
    
	SELECT accountID INTO a_id FROM account WHERE accountName = account_N;
    
    IF a_id IS NOT NULL THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Account alrady exists';
	
    ELSE 
		INSERT INTO price (price, prePaymentDate, nextPaymentDate)
        VALUES  (54.99, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH));
        
        
		INSERT INTO ACCOUNT( priceID, accountName, blocked)
        VALUES (LAST_INSERT_ID(), account_N, 'NO');
        
		SELECT * FROM account where accountID = LAST_INSERT_ID();
        
	END IF;
END $$

DELIMITER ;



-- Creates a stored procedure that adds the specified time to the specified account
DELIMITER $$

 DROP PROCEDURE IF EXISTS spAddTime $$
 CREATE PROCEDURE spAddTime(
	IN account_N VARCHAR(50)
 )
 BEGIN 
 
	DECLARE a_id INT;
    DECLARE p_id INT;
    
	SELECT accountID INTO a_id FROM account WHERE accountName = account_N;
    
    IF a_id IS NULL THEN
		SIGNAL SQLSTATE '46000'
			SET MESSAGE_TEXT = 'Account not found';
            
	ELSE 
		SELECT p.priceID INTO p_id
        FROM account a 
        JOIN price p 
			ON a.priceID = p.priceID 
		WHERE a.accountID = a_id;
        
        UPDATE price SET nextPaymentDate = DATE_ADD(nextPaymentDate, INTERVAL 1 MONTH)
        WHERE priceID = p_id;
        
        UPDATE price SET prePaymentDate = DATE_ADD(nextPaymentDate, INTERVAL 1 MONTH)
        WHERE priceID = p_id;
        
        SELECT * FROM price WHERE priceID = p_id;
        
	END IF;
END $$

DELIMITER ;


-- Creates a stored procedure that adds an item to a character’s inventory
DELIMITER $$

DROP PROCEDURE IF EXISTS spAddItem $$
CREATE PROCEDURE spAddItem(
	IN character_N VARCHAR(50),
    IN item_id INT,
    IN item_q INT
)
BEGIN

	DECLARE c_id INT;
    
    SELECT characterID INTO c_id  FROM `character` WHERE characterName = character_N;
    
    IF c_id IS NULL THEN 
		SIGNAL SQLSTATE '47000'
			SET MESSAGE_TEXT = 'Character not found';
            
	ELSE 
        
        IF (SELECT COUNT(*) FROM inventoryslot WHERE characterID = c_id) >= 8 THEN 
			SIGNAL SQLSTATE '48000'
				SET MESSAGE_TEXT = 'Inventory is full';
        
        ELSE
			INSERT INTO inventoryslot(characterID, itemID, itemQuantity)
			VALUES  (c_id, item_id, item_q)
            ON DUPLICATE KEY UPDATE itemQuantity = itemQuantity + 1;
		END IF;
	END IF;
END $$

DELIMITER ;


-- Creates a stored procedure that adds a specified character to a specified account
DELIMITER $$

DROP PROCEDURE IF EXISTS  spAddChar $$
CREATE PROCEDURE  spAddChar(
	IN account_N VARCHAR(50),
    IN character_N VARCHAR(50),
    IN char_Team VARCHAR(50)
)

BEGIN 

	DECLARE a_id INT; 
    
    SELECT accountID INTO a_id FROM account WHERE accountName = account_N;
    
    IF a_id IS NULL THEN 
		SIGNAL SQLSTATE '49000'
			SET MESSAGE_TEXT = 'Account not found';
	
    ELSE 
		INSERT INTO `character`(accountID, characterName, characterTeam, charSkillLevel)
        VALUES  (a_id, character_N, char_Team,0); -- character skill is 0 because it is a new character 
	
    END IF;
END $$

DELIMITER ;


-- Creates a stored procedure that prints out a letter for each account, indicating how much time they have left
DELIMITER $$

DROP PROCEDURE IF EXISTS spSendLetter $$
CREATE PROCEDURE spSendLetter(
	IN News VARCHAR(100)
)
BEGIN
	
	DECLARE time_left INT;
    DECLARE pric INT;
    
    IF News IS NULL THEN 
		SELECT 'ther is no news';
        
        SELECT p.priceID, a.accountName,
			TIMESTAMPDIFF(DAY,p.prePaymentDate, p.nextPaymentDate) AS 'Time left',
            CONCAT('You have ', TIMESTAMPDIFF(DAY, p.prePaymentDate, p.nextPaymentDate), 
            ' days remaining until your account is blocked') AS Messag 
		FROM price p
		LEFT JOIN account a
			ON p.priceID = a.priceID
		WHERE TIMESTAMPDIFF(DAY,p.prePaymentDate, p.nextPaymentDate) < 60
		ORDER BY p.priceID;
        
	ELSEIF News IS NOT NULL THEN
		SELECT p.priceID, a.accountName,
			TIMESTAMPDIFF(DAY,p.prePaymentDate, p.nextPaymentDate) AS 'Time left',
            CONCAT('You have ', TIMESTAMPDIFF(DAY, p.prePaymentDate, p.nextPaymentDate), 
            ' days remaining until your account is blocked') AS Messag, News
		FROM price p
		LEFT JOIN account a
			ON p.priceID = a.priceID
		WHERE TIMESTAMPDIFF(DAY,p.prePaymentDate, p.nextPaymentDate) < 60
		ORDER BY p.priceID;
	END IF;
END $$

DELIMITER ;


-- A trigger that checks if errorDescription is null and if so gives it a value of unKnoen 'error'
DELIMITER $$

DROP TRIGGER IF EXISTS after_error_type $$
CREATE TRIGGER after_error_type
AFTER INSERT ON errordescription
FOR EACH ROW 

BEGIN 
	
    IF errordescription.errorDescription = NULL THEN
    UPDATE errorDescription 
    SET errorDescription = 'Unkown error';
	
	END IF;
    
 END $$
 
 
 
        
        
        