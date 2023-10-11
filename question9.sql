-- For this query,  a subquery and inner join are used. We need to query from a derived table, within that subquery we need to join two tables. First, the outer table (outside query) retrieves columns Occupation and Average. This average will be the average of the count of BookID's borrowed for each occupation.
SELECT Occupation, AVG(AVGCO) AS Average
-- Begin the subquery, create the inner table
FROM (
-- For this inner table, we use the following columns: occupation, BookID from the Borrower table, and the Count of the BookID's in the Borrower table as AVGCO (average count). We need this count because it will give us the number of BookID's and when we use group by occupation, it will tell us how many bookID's by occupation. Then we average this count by occupation.
	SELECT Occupation, Borrower.BookID, COUNT(Borrower.BookID) AS AVGCO
    -- Getting occupation from the Client table
    FROM Client
    -- Joining the borrower table through the ClientID. The Borrower table is needed to get the BookID counts as each record is an instance a client has borrowed a book.
    INNER JOIN Borrower ON (Borrower.ClientID = Client.ClientID)
    -- Group by occupation and BookID because this is an aggregate function. Need an alias because every derived table must have its own alias.
    GROUP BY Occupation, Borrower.BookID) as x
    -- Grouping by occupation for the outer query because it is also an aggregate function.
    GROUP BY Occupation;
