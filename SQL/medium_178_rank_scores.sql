-- Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

-- +----+-------+
-- | Id | Score |
-- +----+-------+
-- | 1  | 3.50  |
-- | 2  | 3.65  |
-- | 3  | 4.00  |
-- | 4  | 3.85  |
-- | 5  | 4.00  |
-- | 6  | 3.65  |
-- +----+-------+
-- For example, given the above Scores table, your query should generate the following report (order by highest score):

-- +-------+---------+
-- | score | Rank    |
-- +-------+---------+
-- | 4.00  | 1       |
-- | 4.00  | 1       |
-- | 3.85  | 2       |
-- | 3.65  | 3       |
-- | 3.65  | 3       |
-- | 3.50  | 4       |
-- +-------+---------+
-- Important Note: For MySQL solutions, to escape reserved words used as column names, you can use an apostrophe before and after the keyword. For example `Rank`.

-- 1. Find out that "Rank" is actually the count of distinct scores higher than the ranked one
-- 2. First get distinct scores: 
--  SELECT DISTINCT Score FROM Scores
-- 3. Get "Rank": count how many scores are higher than each element in "DISTINCT Scores"
--  SELECT s.Score, COUNT(t.Score) AS `Rank` FROM (2.) AS t, Scores as s WHERE t.Score >= s.Score
-- 4. Till now, we got the sum of "(for each element in s.Score, how many t.Score meet t.Score >= s.Score)"
--    Thus we need to group the results by s.Id
-- 5. And remember to order the score DESC

SELECT s.Score, COUNT(t.Score) AS `Rank` FROM
(SELECT DISTINCT Score FROM Scores) AS t, Scores AS s
WHERE s.Score <= t.Score
GROUP BY s.Id
ORDER BY s.Score DESC;