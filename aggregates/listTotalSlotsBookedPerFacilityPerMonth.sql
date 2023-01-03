-- ? Question:
-- * Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.

-- Either this one,
SELECT
	facid,
  EXTRACT(MONTH from starttime) AS month,
  SUM(slots) AS "Total Slots"
FROM
	cd.bookings
WHERE
	EXTRACT(YEAR FROM starttime) = 2012
GROUP BY
	facid, month
ORDER BY
  facid, month;

-- Or this one.
SELECT
	facid,
  EXTRACT(MONTH from starttime) AS month,
  SUM(slots) AS "Total Slots"
FROM
	cd.bookings
WHERE
	(starttime >= '2012-01-01' AND starttime < '2013-01-01')
GROUP BY
	facid, month
ORDER BY
  facid, month;
