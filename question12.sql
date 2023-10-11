-- Start with the outer query. This will query the subquery, in other words, the outer query is querying the table "created" by the inner query. The outer query gives us our average. We have two columns, the Age and the average. Our average comes from the inner query count, in the inner query we have a count of each instance of bookid's borrowed and the age of the borrower. With that count of each instance, we can get an average by age. The group by statement at the end of the query is important because it tells the query to put all borrowers of the same age together. We cannot use an aggregate function without it.
SELECT Age, AVG(CountBookID) as AverageBorrowCount
-- Subquery in a from statement
FROM (
-- This is our subquery table. Here I am getting the count of the number of times each book was borrowed. Next, I am getting the age of the client that borrowed that book, and the clientID. We need the clientID because we need to seperate out each instance so we can then use the average function.
	SELECT COUNT(Borrower.BookID) as CountBookID, (2023 - ClientDoB) as Age, Client.ClientID
    -- I am first grabbing from the Client table. Then we will join the Borrower table.
    FROM Client
    -- Joining the Borrower table on the ClientID key. We need to join the two tables because the BookID count and ClientDoB come from two separate tables, but we need to connect them, this is how we do that.
    INNER JOIN Borrower ON Borrower.ClientID = Client.ClientID
    -- The inner query needs to be grouped by clientID
    GROUP BY Client.ClientID
    -- Every derived table needs an alias.
    ) as x
    -- Outer query also needs to be grouped by age so it puts all the people of the same age in the same record.
    GROUP BY Age
    -- Order by age to make the results more readable.
    ORDER BY Age;
