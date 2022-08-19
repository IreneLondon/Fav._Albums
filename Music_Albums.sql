-- Here is a database I curated called Famous_people of the latest albums from my top 20 favorite musicians. 
-- Included are three tables; Singer, Info, and Album. 
-- THE singer table contains the name of the artist, the Title of their latest album, and one Genre from the album.
-- The album table contained the album Id.
-- The Info table also contained the album Id, and release year of the album.
-- The main purpose was to query these tables using the JOIN, Subqueries, and REGEXP as well as perform some aggregations on the data.


-- CREATING DATABASE Famous_people
CREATE DATABASE Famous_People;
USE Famous_People;

-- CREATING TABLE Singer
CREATE TABLE Singer (id INTEGER PRIMARY KEY AUTO_INCREMENT, Name TEXT, Lastest_Album_Title VARCHAR(255),Genre TEXT NOT NULL);

-- Inserting  values in table Singer
INSERT INTO Singer(Name,Lastest_Album_Title,Genre)
VALUES('Kwesi Arthur','Son Of Jacob','AfroPop'),
      ('Sarkodie', 'No pressure','Afrobeats'),
      ('Burna Boy','Love,Damin','Afrobeats'),
      ('Kendrick Lamar', 'Mr.Morale & The Big Steppers','Rap'),
      ('Drake', 'Honestly,Nevermind','Hip-Hop'),
      ('Ariana Grande', 'Positions','Pop'),
      ('Doja Cat', 'Planet Her','Pop'),
      ('Rihanna', 'Anti(DELUXE)','Pop'),
      ('J Balvin', 'Jose','Reggaeton'),
      ('Dua Lipa', 'Future Nostalgia','Pop'),
      ('Ed Sheeran', '=','Pop'),
      ('Justin Bieber', 'Justice','Pop'),
      ('Christ Brown', 'Brezzy(DELUXE)','Pop'),
      ('Asa', 'V','AfroPop'),
      ('Adele', '30','Soul'),
      ('Angele', 'Nonante-Cinq','Pop'),
      ('Jhene Aiko','Chilombo','Soul'),
      ('Beyonce','The Lion King:The Gift(Deluxe)','Afrobeat'),
      ('HER', 'Back Of My Mind','RnB'),
      ('Mzvee', '10 Thirty','Afrobeat');

-- CREATING TABLE Album
CREATE TABLE Album(id INTEGER PRIMARY KEY AUTO_INCREMENT,Album_ID VARCHAR(255) NOT NULL);

-- Inserting  values in table Singer
INSERT INTO Album(Album_ID)
VALUES('KA1'),
      ('SA2'),
      ('BB3'),	
      ('KL4'),
      ('DR5'),
      ('AG6'),
      ('DC7'),
      ('RI8'),
      ('JB9'),
      ('DL10'),
      ('ES11'),
      ('JU12'),
      ('CB13'),
      ('AS14'),
      ('AD15'),
      ('AN16'),
      ('JA17'),
      ('BE18'),
      ('HE19');

-- ADDING value to Album
INSERT INTO Album(Album_ID)
VALUES('MZ20');
     
-- CREATING TABLE Info
CREATE TABLE Info(id INTEGER PRIMARY KEY AUTO_INCREMENT, Alb_ID VARCHAR(255),Year_Released VARCHAR(255) NOT NULL);

-- Inserting values into Info
INSERT INTO Info(Alb_ID,Year_Released)
VALUES('KA1',2022),
      ('SA2',2021),
      ('BB3',2022),
      ('KL4',2022),
      ('DR5',2022),
      ('AG6',2020),
      ('DC7',2021),
      ('RI8',2016),
      ('JB9',2021),
      ('DL10',2021),
      ('ES11',2021),
      ('JU12',2021),
      ('CB13',2022),
      ('AS14',2022),
      ('AD15',2021),
      ('AN16',2021),
      ('JA17',2020),
      ('BE18',2020),
      ('HE19',2021),
	  ('MZ20',2022);
      
      
      ALTER TABLE Album ADD Number_Of_songs INTEGER;
      -- Inputs where done manually
     
     --  UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '15' WHERE (`id` = '1');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '16' WHERE (`id` = '2');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '19' WHERE (`id` = '3');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '19' WHERE (`id` = '4');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '14' WHERE (`id` = '5');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '14' WHERE (`id` = '6');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '14' WHERE (`id` = '7');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '16' WHERE (`id` = '8');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '24' WHERE (`id` = '9');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '19' WHERE (`id` = '10');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '14' WHERE (`id` = '11');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '16' WHERE (`id` = '12');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '33' WHERE (`id` = '13');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '11' WHERE (`id` = '14');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '12' WHERE (`id` = '15');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '13' WHERE (`id` = '16');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '20' WHERE (`id` = '17');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '17' WHERE (`id` = '18');
-- DELETE FROM `famous_people`.`Album` WHERE (`id` = '21');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '21' WHERE (`id` = '19');
-- UPDATE `famous_people`.`Album` SET `Number_Of_songs` = '10' WHERE (`id` = '20');

      
   -- QUERYING DATA 
   SELECT * FROM info;
   SELECT * FROM singer;
   SELECT * FROM Album;
   
   -- Singers With Releases before 2022 -Querying In Subquery
SELECT name,Lastest_Album_Title FROM singer WHERE id IN (SELECT id FROM Info WHERE Year_Released < 2022);
      
      -- Singers With Releases after 2022 -Querying In Subquery
SELECT name,Lastest_Album_Title FROM singer WHERE id IN (SELECT Id FROM Info WHERE Year_Released < 2020);
   
   SELECT name, Lastest_Album_Title FROM singer WHERE Lastest_Album_Title LIKE 'po%';
   
   -- Using REGEXP singers with any pop Album 
   SELECT * FROM singer WHERE Genre NOT LIKE '%po%';
   
  -- MULTIPLE JOIN
  SELECT singer.id, Name, Lastest_Album_Title,Genre, Album_ID, Year_Released
  FROM singer
  JOIN album
  ON album.id = singer.id
  JOIN info
  ON info.Alb_id = album.album_id
  ORDER BY id;

-- ARTIST AND YEAR OF RELEASE   
SELECT name,Year_Released
FROM Singer
JOIN Info
ON singer.id = info.id
JOIN Album 
ON Info.alb_id = album.album_id;

-- SAVING A MULTIPLE JOIN TABLE
CREATE TABLE Joint_table; 
SELECT singer.id,name,Lastest_Album_Title,Genre,Year_Released 
FROM singer 
JOIN info 
ON singer.id = info.id
JOIN album 
ON info.alb_ID = album.Album_ID;


-- Count
 SELECT COUNT(name) AS 'Albums < 20' FROM singer WHERE id IN (SELECT Id FROM album WHERE Number_of_songs <20);     

 -- Singers with number of songs on album less than 20 
SELECT name,Lastest_Album_Title,Genre,Year_Released,Number_Of_songs
FROM singer 
JOIN info 
ON singer.id = info.id
JOIN album 
ON info.alb_ID = album.Album_ID
WHERE Number_Of_songs <20;

-- Count
SELECT COUNT(name) AS 'Albums >= 20' FROM singer WHERE id IN (SELECT Id FROM album WHERE Number_of_songs >= 20); 

 -- Singers with number of songs on album greater than or equal to 20 
SELECT name,Lastest_Album_Title,Genre,Year_Released,Number_Of_songs
FROM singer 
JOIN info 
ON singer.id = info.id
JOIN album 
ON info.alb_ID = album.Album_ID
WHERE Number_Of_songs >=20;
 
 -- Count
SELECT COUNT(name) AS 'Albums <= 10' FROM singer WHERE id IN (SELECT Id FROM album WHERE Number_of_songs <= 10); 

 -- Singers with number of songs on album less than or equal to 10 
SELECT name,Lastest_Album_Title,Genre,Year_Released,Number_Of_songs
FROM singer 
JOIN info 
ON singer.id = info.id
JOIN album 
ON info.alb_ID = album.Album_ID
WHERE Number_Of_songs <=10; 
