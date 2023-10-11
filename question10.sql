-- Creating the view as the question asked.
CREATE VIEW BookBorrow as
-- Selecting the count of clientID's in the Borrower table, I added the DISTINCT keyword because we want books borrowed by at least 16 different clients, not just 16 times. Also selecting the Book Title from the Book table because the question asks to display the book title.
SELECT COUNT(DISTINCT ClientID) as BookCount, Book.BookTitle
-- BookCount will come from the Borrower table.
FROM Library.Borrower
-- Because the question asks for the Book Title, we need to join the Book table. The Borrower table has BookID but not the title.
INNER JOIN Book ON Book.BookID = Borrower.BookID
-- We want to count all the distinct clientID's and aggregate them according to the BookTitles, so we group by BookTitles. 
GROUP BY Book.BookTitle
-- The question asks for titles borrowed by at least 20% of clients. 20% of 80 is 16, and we need any titles borrowed by 16 distinct clients or more, greater than or equal to.
HAVING BookCount >= 16