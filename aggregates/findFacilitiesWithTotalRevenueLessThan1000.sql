-- ? Question:
-- * Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

-- You can either use this,
SELECT
	f.name,
  SUM(b.slots *
		CASE
      WHEN b.memid = 0
      THEN f.guestcost
      ELSE f.membercost
		END
	  ) AS revenue
FROM
	cd.facilities f
INNER JOIN
	cd.bookings b
ON
	f.facid = b.facid
GROUP BY
	f.name
HAVING
	SUM(b.slots *
		CASE
      WHEN b.memid = 0
      THEN f.guestcost
      ELSE f.membercost
		END
	  ) < 1000
ORDER BY
	revenue;

-- Or this one.
SELECT
	name, revenue
FROM
	(
	  SELECT
	  	f.name, SUM(b.slots *
						CASE
							WHEN b.memid = 0
							THEN f.guestcost
							ELSE f.membercost
						END
					) AS revenue
	  FROM
	  	cd.facilities f
	  INNER JOIN
	  	cd.bookings b
	  ON
	  	f.facid = b.facid
	  GROUP BY
	  	f.name
	  ) AS subquery -- subquery alias is compulsory
WHERE
	revenue < 1000
ORDER BY
	revenue;

-- ! The best practice for more complex queryies is to use the second 
-- ! approach, but for simplicity and with simple queries, use the first one.
