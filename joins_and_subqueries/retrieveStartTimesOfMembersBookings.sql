-- ? Question:
-- * How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT
	starttime
FROM
	cd.bookings AS b
INNER JOIN
	cd.members AS m
USING(memid)
WHERE
	m.firstname || ' ' || m.surname = 'David Farrell';
