SELECT STRING_AGG(value, '&')
FROM generate_series(1, 1000)
WHERE value > 1
AND value NOT IN (
  SELECT i.value
  FROM generate_series(1, 1000) AS i
  INNER JOIN generate_series(1, 1000) AS j
    ON 1 < j.value 
    AND j.value < i.value 
    AND i.value % j.value = 0
    )