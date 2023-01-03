-- ? Question:
-- * The Produce a list of costly bookings exercise contained some messy logic: we had to calculate the booking cost in both the WHERE clause and the CASE statement. Try to simplify this calculation using subqueries. For reference, the question was:
-- * How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost.

select 
	fname || ' ' || lname AS member,
	facility,
	cost
FROM
	(
		SELECT
			m.firstname AS fname,
			m.surname AS lname,
			f.name AS facility,
			b.starttime AS time,
		CASE
			WHEN
				m.memid = 0
			THEN
				b.slots * f.guestcost
			ELSE
				b.slots * f.membercost
		END AS cost
		FROM
			cd.members m
		INNER JOIN
			cd.bookings b
		USING(memid)
		INNER JOIN
			cd.facilities f
		USING(facid)
	) AS result
WHERE
	cost > 30
AND
	(result.time >= '2012-09-14' AND result.time < '2012-09-15')
ORDER BY
	cost DESC;
