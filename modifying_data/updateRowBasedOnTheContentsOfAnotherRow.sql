-- ? Question:
-- * We want to alter the price of the second tennis court so that it costs 10% more than the first one. Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.

-- Either this one,
UPDATE
	cd.facilities
SET
 	membercost = membercost + TRUNC((membercost / 100) * 10, 1),
	guestcost = guestcost + TRUNC((guestcost / 100) * 10, 1)
WHERE
	name = 'Tennis Court 2';

-- Or this one,
UPDATE cd.facilities facs
SET
  membercost = (SELECT membercost * 1.1 from cd.facilities WHERE facid = 0),
  guestcost = (SELECT guestcost * 1.1 FROM cd.facilities WHERE facid = 0)
WHERE facs.facid = 1;

-- Even you can use this one!
UPDATE cd.facilities facs
SET
  membercost = facs2.membercost * 1.1,
  guestcost = facs2.guestcost * 1.1
FROM (SELECT * FROM cd.facilities WHERE facid = 0) facs2
WHERE facs.facid = 1;
