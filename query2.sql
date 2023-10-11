-- Selecting fields for client's first and last name, date of birth, and occupation
SELECT ClientFirstName, ClientLastName, (2023 - ClientDoB) as Age , Occupation
-- From the Client table
FROM Client;
