/*************************************
* Script file name: create views
* Programer name: Jonathan Otshudi 
* DATE 2024-03-4
* Description:
*
* Creates all of the requiered viewa for the mmorpg database
*
**************************************/
USE mmorpg; 

-- Creates a view that shows all the accounts that are currently blocked.
CREATE OR REPLACE VIEW vwBlockedAccounts
AS 
	SELECT account.accountID AS 'Account ID',
			account.accountName AS 'Account Name',
			account.blocked AS 'Blocked Accounts'
	FROM account
    WHERE account.blocked = 'YES';
    

-- The top 20 characters with the highest skill levels and their account details     
CREATE OR REPLACE VIEW vwTopSkill
AS
	SELECT c.characterID AS 'Character ID', 
			a.accountID AS 'Account ID', 
            a.accountName AS 'Account Name', 
            c.characterName AS 'Character Name', 
            c.charSkillLevel AS 'Character Skill Level' 
	FROM `character` c
	JOIN account a
		ON c.accountID = a.accountID
	ORDER BY charSkillLevel DESC
	LIMIT 20;


-- A view of the 20 items that are stacked most frequently, including the characters whose inventory they are stacked in
CREATE OR REPLACE VIEW vwTopStackedItems
AS
	SELECT i.itemID,
			c.characterID,
			c.characterName, 
			it.itemDescription,
			it.itemType, 
	COUNT(i.itemID) AS 'Times item is stacked'
	FROM inventoryslot i
	JOIN item it 
		ON i.itemID = it.itemID
	LEFT JOIN `character` c 
		ON i.characterID = c.characterID
	GROUP BY i.itemID
	ORDER BY 'Times item is stacked' DESC
	LIMIT 20;
 

--  The five most popular items that are contained inside the character’s inventory, including the number of characters that have the item.
CREATE OR REPLACE VIEW vwPopItems
AS
	SELECT i.itemID, 
			it.itemDescription,
			it.itemType, COUNT(i.itemID) AS 'Number of characters'
		FROM inventoryslot i
		LEFT JOIN item it 
			ON i.itemID = it.itemID 
		GROUP BY i.itemID  
		ORDER BY 'Number of characters'
		LIMIT 5;











