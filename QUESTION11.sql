-- In this select statement, we are extracting the month out of the Borrow Date. It is written YYYY-MM-DD, and we need each month, so we use the MONTH() function. Next we are getting the count of the months after extracting the month. 
SELECT MONTH(BorrowDate) as Month, COUNT(MONTH(BorrowDate)) as MonthCount
-- These columns are both from the Borrower table  
FROM Borrower
-- Specifying that we want the top month for the year 2017, so we extract the year with the YEAR() function.
WHERE YEAR(BorrowDate) = '2017'
-- Group by month because we want all the seperate months to be together. All the 1's (January) to be grouped together, etc.
GROUP BY Month
-- We limit to the top result because the assignment asks for the "top month" singular. 
LIMIT 1;