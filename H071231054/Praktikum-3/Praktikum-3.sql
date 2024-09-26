-- Nomor 1.

INSERT INTO authors (name, nationality)
VALUES ("Tere Liye", "Indonesian"), 
		 ("J.K. Rowling", "British"),
		 ("Andrea Hirata", NULL);
		 
SELECT * FROM authors;
		 

-- INSERT INTO books (isbn, title, author_name, published_year, genre, copies_available)
-- VALUES (7040289780375, "Ayah", "Andrea Hirata", 2015, "Fiction", 15),
-- 		 (9780375704025, "Bumi", "Tere Liye", 2014, "fantasy", 5),
-- 		 (831037170, "Bulan", "Tere Liye", 2015, "fantasy", 3),
-- 		 (9780747532699, "harry Potter and the Philosopher's Stone", "J.K. Rowling", 1997, NULL, 10),
-- 		 (7210301703022, "The Running Grave", "J.K. Rowling", 2016, "Fiction", 11);



INSERT INTO books (isbn, title, author_id, published_year, genre, copies_available)
VALUES (7040289780375, "Ayah", "3", 2015, "Fiction", 15),
		 (9780375704025, "Bumi", "1", 2014, "fantasy", 5),
		 (831037170, "Bulan", "1", 2015, "fantasy", 3),
		 (9780747532699, "harry Potter and the Philosopher's Stone", "2", 1997, NULL, 10),
		 (7210301703022, "The Running Grave", "2", 2016, "Fiction", 11);
		 
SELECT * FROM books;


UPDATE members
SET join_date = "2023-04-29"
WHERE id = "1";

UPDATE members
SET join_date =  "2023-05-01"
WHERE id = "2";

UPDATE members
SET join_date = "2023-06-20"
WHERE id = "3";

SELECT * FROM members;
SELECT @@sql_mode;
SET sql_mode = '';


INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ("John", "Doe", "john.doe@example.com", NULL, "2023-04-29", NULL),
		 ( "Alice", "Johnson", "alice.johnson@example.com", 1231231231, "2023-05-01","standar"),
		 ("Bob", "Williams", "bob.williams.@example.com", 3213214321, "2023-06-20", "premium");
		 
		 
INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ("Kevin", "Ryadi", "kvn.rydi@example.com", 1234567890, "2004-06-13", "standar");
		 

INSERT INTO borrowings(member_id, book_id, borrow_date, return_date)
VALUES (1, 4, "2023-07-10", "2023-07-25"),
(3, 1, "2023-08-01", NULL),
(2, 5, "2023-09-06", "2023-09-09"),
(2, 3, "2023-09-08", NULL),
(3, 2, "2023-09-10", NULL);
		 
SELECT * FROM borrowings;	 
-- Nomor 2.

UPDATE books 
SET copies_available = copies_available - 1
WHERE id = 2 OR 4 OR 5;

SELECT * FROM books;

-- Nomor 3.
SHOW CREATE TABLE borrowings;


ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1,
ADD CONSTRAINT borrowings_ibfk_3 FOREIGN KEY (member_id) REFERENCES members(id)  ON DELETE CASCADE;

ALTER TABLE borrowings
ADD FOREIGN KEY (member_id) REFERENCES members(id);
ON DELETE CASCADE;

SELECT * FROM borrowings;
SELECT * FROM members;

UPDATE members
SET membership_type = "standar"
WHERE id = 3;


DELETE FROM members 
WHERE membership_type = "Standar";

SELECT * FROM members;

DELETE members
WHERE 