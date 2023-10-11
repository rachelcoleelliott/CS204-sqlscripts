-- Selecting the author's nationality and the BookID count
SELECT Author.AuthorNationality, COUNT(Borrower.BookID) as Count
FROM Author
-- Joining the Book table on the AuthorID field as it is the related key. We need to join three tables together: Author, Book, and Borrower. Author will give us the nationality, Book will give us the connection between the two tables, and the Borrower table will give us the count of borrows for each book so we know which author had the least number of borrowed books.
INNER JOIN Book ON (Book.AuthorID = Author.AuthorID)
-- Joining Borrower and Book on the BookID key.
INNER JOIN Borrower ON (Borrower.BookID = Book.BookID)
-- Specifying date range. 2015-2017.
WHERE Borrower.BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
-- Grouping by nationality as specified in the Select statement. This will keep everything together.
GROUP BY Author.AuthorNationality
-- Order by the count in ascending order because we want the LEAST 5 authors clients borrowed. This will put the lowest numbers at the top.
ORDER BY Count ASC
-- Assignment asks for the least 5. So we limit our query to 5 results. 
LIMIT 5;