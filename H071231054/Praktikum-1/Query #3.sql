CREATE DATABASE library;library

CREATE TABLE authors(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL
	
);	

ALTER TABLE authors 
ADD nationality VARCHAR(50);
	
CREATE TABLE books(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	isbn VARCHAR(13),
	author_id INT,
	FOREIGN KEY(author_id) REFERENCES authors(id)
);


-- --nomor5--
CREATE TABLE members(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE books(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	isbn CHAR(13) UNIQUE NOT NULL,
	author_id INT NOT NULL,
	published_year YEAR NOT NULL,
	genre VARCHAR(150) NOT NULL,
	copies_avaible INT NOT NULL
);

CREATE TABLE borrowings(
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	FOREIGN KEY(member_id) REFERENCES members(id),
	book_id INT NOT NULL,
	FOREIGN KEY (book_id) REFERENCES books(id),
	borrow_date DATE NOT NULL,
	return_date DATE 
);

ADD nationality VARCHAR(50),
ALTER TABLE authors
MODIFY nationality VARCHAR(50) NOT NULL;

ALTER TABLE books
MODIFY isbn VARCHAR(100) UNIQUE NOT NULL,
MODIFY author_id INT(11) NOT NULL;


ALTER TABLE books
ADD UNIQUE(isbn);

DESCRIBE authors;
DESCRIBE books;
DESCRIBE members;
DESCRIBE borrowings;

ALTER TABLE books
-- ADD published_year YEAR NOT NULL;
-- ADD genre VARCHAR(50) NOT NULL;
-- ADD copies_available INT NOT NULL;

	
