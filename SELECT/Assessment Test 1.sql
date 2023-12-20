-- ASSESSMENT TEST 1

-- COMPLETE THE FOLLOWING TASKS!

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

-- The answer should be customers 187 and 148.

-- 2. How many films begin with the letter J?

-- The answer should be 20.

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

-- The answer is Eddie Tomlin

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP by customer_id
HAVING SUM(amount)  >110


SELECT COUNT (* )
FROM film 
WHERE title like 'J%'

SELECT *
FROM customer
WHERE first_name LIKE 'E%' AND address_id <500
ORDER BY customer_id DESC
limit 1