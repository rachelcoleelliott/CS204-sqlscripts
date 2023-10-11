-- Select statement pulls the Genre column from the Book table, and a count of the BookID in the Borrower table, because when we join them, it will count everything, from all the joined tables.
SELECT Book.Genre, COUNT(Borrower.BookID) as GenreCount
-- From the Book table to begin with because this is where our fields are from.
FROM Book
-- Joining Borrower and Client. We need the Borrower table because it will tell us the occurrences of the BookID's which will give us the count of the genres.
INNER JOIN Borrower ON (Borrower.BookID = Book.BookID)
-- Joining the Client table because this will allow us to grab the client's Date of Birth.
INNER JOIN Client ON (Client.ClientID = Borrower.ClientID)
-- Specifying here that we want clients born between 1970 and 1980.
WHERE Client.ClientDoB BETWEEN '1970' AND '1980'
-- Grouping by Genre. Need a group by statement because it is an aggregate function with the count.
GROUP BY Book.Genre
-- Ordering by the count in descending order so the top genres are at the top. ***NOTE: I did not use a LIMIT statement because the question gave me no number to limit to, it only said "show the top borrowed genres." So I kept all the results and just put the top ones at the top. If I needed to do top 5 for example, I would have done LIMIT 5.
ORDER BY GenreCount DESC;
