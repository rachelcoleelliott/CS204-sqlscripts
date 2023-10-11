-- Selecting the author first and last name and the GenreCount alias from the subquery. 
SELECT AuthorFirstName, AuthorLastName, GenreCount
-- Our subquery will get the count of genres by author ID. We don't want simply a count of how many genres because there could be 4 of the same genre, we need them to be distinct and different genres, so we use the DISTINCT keyword. 
FROM(
	SELECT COUNT(DISTINCT Book.Genre) as GenreCount, Author.AuthorID, Author.AuthorFirstName, Author.AuthorLastName
    FROM Author
-- Joining the Book and Author tables because we need Author first and last name from Author table, and genres from the Book table.
    INNER JOIN Book ON Book.AuthorID = Author.AuthorID
    -- Grouping by authorID because we want all the counted genres to stay with the author. Alias is x because all derived tables require an alias.
    GROUP BY Author.AuthorID) as x
    -- Filtering our results so we get authors with books in more than one genre. SPOILER ALERT: there are none.
    WHERE GenreCount > 1;