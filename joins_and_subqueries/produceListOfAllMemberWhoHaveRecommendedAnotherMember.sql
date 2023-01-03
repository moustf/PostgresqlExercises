-- ? Question:
-- * How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

-- Either this one,
SELECT
	firstname,
	surname
FROM
	cd.members
WHERE
	memid IN (
    SELECT
      recommendedby
    FROM
      cd.members
    WHERE
      recommendedby IS NOT NULL
    )
ORDER BY
	surname, firstname;

-- Or this one.
SELECT DISTINCT
	m1.firstname AS firstname,
	m1.surname AS surname
FROM
	cd.members m1
INNER JOIN
	cd.members m2
ON
	m1.memid = m2.recommendedby
ORDER BY
	surname, firstname;