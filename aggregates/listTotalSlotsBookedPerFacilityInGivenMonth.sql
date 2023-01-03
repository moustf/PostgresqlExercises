-- ? Question:
-- * Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

SELECT
	f.facid, SUM(b.slots) AS "Total Slots"
FROM
	cd.facilities f
INNER JOIN
	cd.bookings b
ON
	f.facid = b.facid
WHERE
	(b.starttime >= '2012-09-01' AND b.starttime < '2012-10-01')
GROUP BY
	f.facid
ORDER BY
	"Total Slots";
