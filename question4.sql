-- Selecting the columns needed: the author's first and last name from the author table, and the count of BookID's from the Borrower table. I am using aliases in this query. A is the Author table. B is the Book table, and O is the Borrower table.
SELECT  a.AuthorFirstName, a.AuthorLastName, COUNT(o.BookID) as AuthorCount 
FROM Author a
-- Inner joining two different tables. First,  join the Book table, where the authorID in the Book and Author table is used as the common field
INNER JOIN Book b ON (b.AuthorID = a.AuthorID)
-- Now joining the Borrower table through the BookID field. We need both the Book table as it is the connector between the three tables. Need the borrower table because it will give us the count of BookID's and the ability to check the date range.
INNER JOIN Borrower o ON (o.BookID = b.BookID)
-- Specifying the date range here, the year 2017.
WHERE o.BorrowDate BETWEEN '2017-01-01' AND '2017-12-31'
-- Grouping by both first and last name so all the records stay together.
GROUP BY a.AuthorFirstName, a.AuthorLastName
-- Ordering by the count in descending order so we are able to see the top numbers.
ORDER BY AuthorCount desc
-- Assignment asks for the top 5, so limit the results.
LIMIT 5;
