
--  SQL Assessment Test 2
-- -- Questions and Expected Results
-- -- Keep in mind there is usually more than one way to answer these questions. For the solutions you can visit this link:
-- -- https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit?usp=sharing
-- -- OR you can watch the solutions video walkthrough lecture.
-- -- These questions start off with the basics and then get continually more difficult.

-- -- How can you retrieve all the information from the cd.facilities table?
-- -- Expected Result should look similar to this (with more rows):

-- -- You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?




-- How can you produce a list of facilities that charge a fee to members?
-- Expected Results should have just 5 rows:


-- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
-- Result is just two rows:


-- How can you produce a list of all facilities with the word 'Tennis' in their name?
-- Expected Result is 3 rows

-- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
-- Expected Result is 2 rows


-- How can you produce a list of members who joined after the start of September 
--2012? Return the memid, surname, firstname, and joindate of the members in question.
-- Expected Result is 10 rows (not all are shown below

select * from cd.members
WHERE joindate >= '2012-09-01'

-- How can you produce an ordered list of the first 10 surnames in the members table? 
-- The list must not contain duplicates.
-- Expected Result should be 10 rows if you include GUEST as a last name

SELECT distinct surname 
FROM cd.members
ORDER BY surname asc
limit 10

-- You'd like to get the signup date of your last member. How can you retrieve this information?
-- Expected Result
-- 2012-09-26 18:08:45
SELECT  joindate 
FROM cd.members
ORDER BY joindate desc
limit 1

-- Produce a count of the number of facilities that have a cost to guests of 10 or more.
-- Expected Result
-- 6

SELECT count(*) FROM cd.facilities
WHERE guestcost >= 10

-- Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
-- Expected Result is 9 rows

SELECT b.facid, sum(slots) 
FROM cd.bookings b
WHERE b.starttime BETWEEN '2012-09-01' AND '2012-10-01'
group by b.facid




-- Produce a list of facilities with more than 1000 slots booked. 
-- Produce an output table consisting of facility id and total slots, sorted by facility id.
-- Expected Result is 5 rows

SELECT facid, sum(slots)
FROM cd.bookings
GROUP BY facid
HAVING sum(slots) >= 1000




-- How can you produce a list of the start times for bookings for tennis courts,
-- for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
-- Expected Result is 12 rows


SELECT b.starttime, f.name
FROM cd.facilities f
LEFT JOIN cd.bookings b
ON f.facid = b.facid 
WHERE f.name like '%Tennis Court%' AND b.starttime BETWEEN '2012-09-21' AND '2012-09-22'
ORDER BY b.starttime


-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
-- Expected result is 34 rows of timestamps
SELECT b.starttime, m.surname || ' ' || m.firstname
FROM cd.members m
LEFT JOIN cd.bookings b
ON m.memid = b.memid
WHERE m.surname = 'Farrell' AND m.firstname = 'David'



select * from cd.facilities
select * from cd.bookings
select * from cd.members

