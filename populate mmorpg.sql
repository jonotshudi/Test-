/*************************************
* Script file name: populate mmorpg
* Programer name: Jonathan Otshudi 
* DATE 2024-03-3
* Description:
*
* Inserts all the data for the tables in the mmorpg database
*
**************************************/
USE mmorpg; 

-- Inserts the date for the price table 
INSERT INTO price( price, prePaymentDate, nextPaymentDate)
VALUES  (54.99, '2024-03-04', '2024-04-04'),
		(54.99, '2024-02-03', '2024-04-03'),
        (54.99, '2024-03-12', '2024-04-12'),
        (54.99, '2024-02-07', '2024-04-07'),
        (54.99, '2024-02-09', '2024-04-09'),
        (54.99, '2024-03-11', '2024-04-11'),
        (54.99, '2024-03-08', '2024-04-08'),
        (54.99, '2024-03-09', '2024-04-09'),
        (54.99, '2024-02-12', '2024-04-12'),
        (54.99, '2024-02-05', '2024-04-05'),
        (54.99, '2024-03-10', '2024-04-10'),
        (54.99, '2024-03-09', '2024-04-09');

-- Inserts the data for the account table 
INSERT INTO account(priceID, accountName, blocked)
VALUES  (3,'verymade', 'NO'),
		(4,'tabbelo77', 'YES'),
        (5,'clerance_torvel', 'YES'),
        (1,'LuLu!ov3','NO'),
        (2,'Jay3E', 'YES'),
        (5,'F1ats', 'NO'),
        (3,'stay3at1ion3', 'NO'),
        (1,'verylost9ent', 'NO'),
        (10,'uWu19', 'YES'),
        (12,'BALLOT', 'NO'),
        (9,'Dalt00sh', 'YES'),
        (3,'Heloo_kitty', 'NO'),
        (4,'kaylip94', 'YES'),
        (8,'rambort', 'NO'),
        (11,'Emma_w0t3n', 'NO'),
        (7,'Mal', 'NO'),
        (5,'Hard Stuck', 'YES'),
        (12,'bora', 'NO'),
        (3,'Gezict', 'NO'),
        (9,'ML7', 'YES');
        


-- Inserts the data for the error table 
INSERT INTO error(errorType)
VALUES  ('system error'),
		('system error'),
        ('item error'),
        ('account error'),
        ('character error'),
        ('character error'),
        ('account error');

-- Inserts the data for the errorDescription table 
INSERT INTO errorDescription(errorID, accountID, errorDescription)
VALUES  (123, 3, 'cannot move character'), 
		(124, 7, 'cannot chang character skin ') ,
		(126, 5, 'cannot login to account'),
		(125, 1, 'cannot pick up item'),
		(127, 2, 'cannot change character'),
		(128, 4, 'cannot logout of account'),
		(124, 8, 'cannot type in chat');
            


-- Inserts the data for the character table 
INSERT INTO `character`(accountID, characterName, characterTeam, charSkillLevel)
VALUES  (3, 'boobi_mel', 'bobi boys', 68),
		(8, 'asmonglod', 'the clan', 32),
        (6, 'morrowind', 'wind word', 92),
        (2, 'olivia', 'growing boys', 45),
        (5, 'izzyaci', 'torronto defient', 79),
        (7, 'Necros', 'genji', 49),
        (12, 'Hofac', 'PLEDIS', 57),
        (4, 'Pprofit', 'Moving', 74),
        (3, 'izzy_2k', 'rejavis', 100),
        (6, 'tembo', 'Home_alonr', 48),
        (7, 'logic', 'Poriting', 95),
        (3, 'blessing45', 'the_boys', 21),
        (16, 'same_day', 'We_Play', 45),
        (5, 'the_bigs', 'GuildMaster', 49),
        (20, 'comest_34', 'lost_andF0Und',60),
        (13, 'Star_child', 'lirycalDive1', 78),
        (17, 'just_juvis', 'the_boys', 34),
        (8, 'betterthan You', 'rejavis', 86),
        (9, 'localHost', 'spot_light', 95),
        (5, 'explicit', 'mettadata', 86),
        (15, 'big_nood', 'rejavis', 35),
        (19, 'Allthe_Range', 'genji', 17),
        (3, 'its_him', 'logic', 86),
        (7, 'forgoten', 'torronto drfiant', 76),
        (3, 'the_longhall', 'Home_alonr', 84),
        (12, 'goodForNothing78', 'the_boys', 38),
        (13, 'best_fr3nd', 'We_Play', 65),
        (18, 'lookinAtMe', 'rejavis', 67),
        (20, 'lostChild1', 'mettadata', 37),
        (14, 'jonOtsh', 'Balders_gate', 67),
        (6, 'Wildthots', 'PLEDIS', 64);
        

-- inserts the data for the item table 
INSERT INTO item(itemDescription, itemType)
VALUES  ('A sword made of gold', 'wepon'),
		('A suit of leather', 'armor'),
        ('A shield made of dimond', 'shield'),
        ('An arroww with poison on it', 'wepon'),
        ('Makes a large ball of fier', 'spell'),
        ('summons a large drogon' , 'spell'),
        ('Golden sword', 'wepon'),
		('Leather suit', 'armor'),
		('Diamond shield', 'shield'),
		('Enchanted staff', 'spell'),
		('Steel dagger', 'wepon'),
		('Silk robe', 'armor'),
		('Bronze helmet', 'armor'),
		('Fireball spellbook', 'spell'),
		('Iron mace', 'wepon'),
		('Crystal amulet', 'spell'),
		('Wooden bow', 'wepon'),
		('Silver gauntlets', 'armor'),
		('Healing potion', 'spell'),
		('Obsidian dagger', 'wepon'),
		('Dragonhide armor', 'armor'),
		('Frostbolt scroll', 'spell'),
		('Ruby-encrusted sword', 'wepon'),
		('Emerald tiara', 'armor'),
		('Ancient grimoire', 'spell'),
		('Steel warhammer', 'wepon'),
		('Adamantine plate mail', 'armor'),
		('Lightning bolt wand', 'spell'),
		('Shadow cloak', 'armor'),
		('Poisoned dart', 'wepon'),
		('Crystal ball', 'spell'),
		('Titanium greaves', 'armor');


-- Inserts the data for the invetorySlot table 
INSERT INTO inventorySlot(characterID, itemID, itemQuantity) 
VALUES  (1, 5, 48),
		(3, 4, 68),
        (4, 12, 58),
        (2, 27, 47),
        (5, 17, 32),
        (23, 4, 74),
        (5, 6, 23),
        (3, 15, 17),
		(24, 5, 48),
		(29, 4, 68),
		(4, 6, 58),
		(26, 12, 30),
		(2, 32, 20),
		(10, 16, 75),
		(15, 22, 10),
		(6, 9, 40),
		(25, 11, 55),
		(12, 18, 5),
		(20, 27, 70),
		(11, 17, 15),
		(31, 7, 25),
		(9, 30, 33),
		(14, 21, 60),
		(18, 29, 12),
		(13, 19, 42),
		(19, 31, 8),
		(16, 24, 50),
		(17, 26, 38);
        


        

