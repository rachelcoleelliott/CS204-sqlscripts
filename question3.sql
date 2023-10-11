-- Selecting client's first and last names so they display as columns
SELECT ClientFirstName, ClientLastName
-- From the client table
FROM Client
-- Joining the Borrower table because we need the borrow date field to see which clients have borrowed books between the specified time period.
INNER JOIN Borrower
-- Using the ClientID field in the Client and Borrower table as this is the primary and foreign key in those tables.
ON Client.ClientID = Borrower.ClientID
-- Specifying we want to see the first and last names for anyone in March 2018 who borrowed a book.
WHERE Borrower.BorrowDate BETWEEN '2018-03-01' AND '2018-03-31';