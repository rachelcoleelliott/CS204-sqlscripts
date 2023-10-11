-- Selecting the Occupation field from the Client table, and a count of the client ID's from the Borrower table.
SELECT Client.Occupation, COUNT(Borrower.ClientID) as OccupationCount
-- Using the Client table
FROM Client
-- Inner joining the Borrower and the Client table. The client field has the Client Occupation, and the Borrower table will have the number of times a specific client borrowed.
INNER JOIN Borrower ON (Borrower.ClientID = Client.ClientID)
-- Specifying we want the borrow dates to be in the year 2016.
WHERE Borrower.BorrowDate BETWEEN '2016-01-01' AND '2016-12-31'
-- We Group By client occupation. This will give us distinct values for our results.
GROUP BY Client.Occupation
-- We are ordering by the count in descending order because we need the largest numbers on top.
ORDER BY OccupationCount DESC
-- We limit to five because we need the top 5 occupations. This will give us the largest at the top of our results.
LIMIT 5;
