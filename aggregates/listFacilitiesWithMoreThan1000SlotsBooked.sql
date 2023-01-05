-- ? Question:
-- * Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and slots, sorted by facility id.

SELECT
	f.facid,
  SUM(b.slots) AS "Total Slots"
FROM
	cd.facilities f
INNER JOIN
	cd.bookings b
ON
	f.facid = b.facid
GROUP BY
	f.facid
HAVING
	SUM(b.slots) > 1000
ORDER BY
 	f.facid;
