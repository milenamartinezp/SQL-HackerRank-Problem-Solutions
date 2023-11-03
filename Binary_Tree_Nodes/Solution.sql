WITH Parent_list AS (
    SELECT DISTINCT P
    FROM BST
    WHERE P IS NOT NULL
)
SELECT N,
    CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (SELECT P FROM Parent_list) THEN 'Leaf'
    ELSE 'Inner' 
    END
FROM BST
ORDER BY N