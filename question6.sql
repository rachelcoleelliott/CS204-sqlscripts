-- We select the columns we want from the tables. Here we are selecting 2: the book title from the book column and a count of the Book ID's from the borrower table.
SELECT Book.BookTitle, COUNT(Borrower.BookID) as Count
FROM Borrower
-- Using an inner join here because we need data from two different tables: Borrower and Book. We will connect them with BookID, a field in both tables.
INNER JOIN Book ON (Book.BookID = Borrower.BookID)
-- Narrowing our results so we are only get books borrowed between 2015 and 2017.
WHERE Borrower.BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
-- Group By statement allows us to group the BookID's into one column.
GROUP BY Borrower.BookID
-- Order By used so we can get the count of the most borrowed book and we order by descending so highest number is at the top of the list
ORDER BY Count DESC
-- Limit to one because we want the MOST borrowed book
LIMIT 1;