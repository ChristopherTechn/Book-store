CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
INSERT INTO Authors (AuthorID, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'David', 'Johnson');

INSERT INTO Books (BookID, Title, AuthorID) VALUES
(1, 'Book1', 1),
(2, 'Book2', 2),
(3, 'Book3', 3);

DELETE 
FROM Books 
WHERE BookID=3;
DELETE 
FROM Authors 
WHERE AuthorID=3;
/*select book2*/
SELECT * FROM Books 
WHERE Title='Book2';

/*query to update lastname*/
UPDATE Authors
SET LastName='Smithson'
WHERE AuthorID IN
(
	SELECT AuthorID FROM Books
	WHERE BookID=1
)

/*Count number of books*/
SELECT COUNT(BookID) FROM Books

/*show all books with their Authors*/
SELECT mk.BookID,Title,mk.AuthorID,FirstName,LastName
FROM Books mk
INNER JOIN
Authors aut
ON mk.AuthorID=aut.AuthorID

