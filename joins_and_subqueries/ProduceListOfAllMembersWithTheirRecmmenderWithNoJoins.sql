-- ? Question:
-- * How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.

SELECT DISTINCT
	m.firstname || ' ' || m.surname AS member,
	(
    SELECT
      firstname || ' ' || surname AS recommender
    FROM
      cd.members mm
    WHERE
    mm.memid = m.recommendedby
  )
FROM
	cd.members m
ORDER BY member;
