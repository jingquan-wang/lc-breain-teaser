-- Table: Department

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | revenue       | int     |
-- | month         | varchar |
-- +---------------+---------+
-- (id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

-- The query result format is in the following example:

-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- Result table:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

SELECT id,
    SUM(IF(month="Jan", revenue, null)) AS Jan_Revenue, 
    SUM(IF(month="Feb", revenue, null)) as Feb_Revenue,
    SUM(IF(month="Mar", revenue, null)) as Mar_Revenue,
    SUM(IF(month="Apr", revenue, null)) as Apr_Revenue,
    SUM(IF(month="May", revenue, null)) as May_Revenue,
    SUM(IF(month="Jun", revenue, null)) as Jun_Revenue,
    SUM(IF(month="Jul", revenue, null)) as Jul_Revenue,
    SUM(IF(month="Aug", revenue, null)) as Aug_Revenue,
    SUM(IF(month="Sep", revenue, null)) as Sep_Revenue,
    SUM(IF(month="Oct", revenue, null)) as Oct_Revenue,
    SUM(IF(month="Nov", revenue, null)) as Nov_Revenue,
    SUM(IF(month="Dec", revenue, null)) as Dec_Revenue
FROM Department
GROUP BY id;

-- Why use "SUM()"?
-- Useful links:
-- https://leetcode-cn.com/problems/reformat-department-table/solution/guan-yu-group-byyu-sumde-pei-he-by-xxiao053/
-- https://blog.csdn.net/u014717572/article/details/80687042
--
-- The main reason is "GROUP BY"
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
--
-- After GROUP BY, we got an imaginary table like this:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- |      | 7000    | Feb   |
-- |      | 6000    | Mar   |
-- +------+---------+-------+
-- | 2    | 9000    | Jan   |
-- +------+---------+-------+
-- | 3    | 10000   | Feb   |
-- +------+---------+-------+
--
-- We can see that there are multiple values in one cell
-- If we only do IF(month="Jan", renenue, null), IF(month="Jan", renenue, null)
-- Given that in mysql, "IF()" will only look for the first value if there are multiple values in one cell
-- Thus for "Jan", it will be fine
-- But for "Feb", it will return null for id=1 but actually we want 7000
-- To solve this issue we use "SUM()", which will take care of all values in a cell
-- As a result, if id=1, month="Feb" have more than one revenue, the results will be wrong
-- But this case has been eliminated in the question setting
-- Similarly, we can also use "MAX()", "MIN()", or any other function that can deal with multiple values