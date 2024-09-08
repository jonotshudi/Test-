/*************************************
* Script file name: create mmorpg
* Programer name: Jonathan Otshudi 
* DATE 2024-03-2
* Description:
*
* Creates the mmorpg database, all its tables and indexes 
*
**************************************/

-- Creates the database mmorpg
DROP DATABASE IF EXISTS mmorpg;

CREATE DATABASE mmorpg;
USE mmorpg;

-- creates the price table 
CREATE TABLE price(
	priceID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price FLOAT NOT NULL,
    prePaymentDate DATE NOT NULL,
    nextPaymentDate DATE NOT NULL
) ENGINE = InnoDB;

-- Creates the account table 
CREATE TABLE account(
	accountID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	priceID INT NOT NULL,
    accountName VARCHAR(50) NOT NULL UNIQUE,
    blocked ENUM('YES','NO'),
    FOREIGN KEY (priceID) 
    REFERENCES price (priceID)
) ENGINE = InnoDB;

-- Creates the error table 
CREATE TABLE error(
	errorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    errorType SET('system error', 'character error', 'item error', 'account error') NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 123;


-- Creates the errorDescription table 
CREATE TABLE errorDescription(
	accountID INT NOT NULL,
    errorID INT NOT NULL,
    errorDescription VARCHAR(50),
	FOREIGN KEY (accountID)
    REFERENCES account (accountID),
    FOREIGN KEY (errorID)
    REFERENCES error (errorID),
    PRIMARY KEY (accountID, errorID)
) ENGINE = InnoDB;


-- Creates the character table 
CREATE TABLE `character`(
	characterID INT NOT NULL AUTO_INCREMENT,
    accountID INT NOT NULL,
    characterName VARCHAR(50) NOT NULL,
    characterTeam VARCHAR(50) NOT NULL,
    charSkillLevel INT NOT NULL DEFAULT 0 CHECK(charSkillLevel BETWEEN 1 AND 100), 
    FOREIGN KEY (accountID)
    REFERENCES account (accountID),
    PRIMARY KEY (characterID, accountID)
) ENGINE = InnoDB;


-- Creates the item table 
CREATE TABLE item(
	itemID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    itemDescription VARCHAR(50) NOT NULL,
    itemType ENUM('wepon', 'shield', 'spell', 'armor') NOT NULL
)ENGINE = InnoDB;


-- Creates the invetorySlot table 
CREATE TABLE inventorySlot(
	characterID INT NOT NULL,
    itemID INT NOT NULL,
    itemQuantity INT NOT NULL CHECK(itemQuantity BETWEEN 1 AND 80),
    FOREIGN KEY (characterID)
    REFERENCES `character` (characterID),
    FOREIGN KEY (itemID) 
    REFERENCES item (itemID),
    PRIMARY KEY (characterID, itemID)
) ENGINE = InnoDB; 


-- Adds an indexes to the character table 
ALTER TABLE `character` 
ADD INDEX (characterName);




    

