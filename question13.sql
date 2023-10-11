-- Selecting the columns we need for the first table: Client's first and last name, and date of birth.
SELECT ClientFirstName, ClientLastName, ClientDoB
-- Getting these fields from the Client table.
FROM Client
-- We want the oldest clients from the column, so the MIN function is used -- This is because older years are "smaller" than more recent years. 
WHERE ClientDoB = (SELECT MIN(ClientDoB) from Client)

-- Using a union to put the two tables together. Because there are multiple client's with the same year as the youngest and oldest, we need two different tables to come together. Using joins and limits may not represent accurate data.
UNION

-- Selecting the columns we need for this table. The same as above
SELECT ClientFirstName, ClientLastName, ClientDoB
-- Grabbing from the Client table. 
FROM Client
-- Here the maximum function is used. This will query our youngest clients. More recent years are "bigger" than older years. 
WHERE ClientDoB = (SELECT MAX(ClientDoB) from Client)