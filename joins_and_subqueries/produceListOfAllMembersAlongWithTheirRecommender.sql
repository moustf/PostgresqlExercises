-- ? Question:
-- * How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

SELECT
	m1.firstname AS memfname,
	m1.surname AS memsname,
	m2.firstname AS recfname,
	m2.surname AS recsname
FROM
	cd.members m1
LEFT JOIN
	cd.members m2
ON
	m2.memid = m1.recommendedby
ORDER BY
	memsname, memfname;
