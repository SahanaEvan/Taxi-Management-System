1.NESTED QUERY
Q. Select the first and last name of users who travelled on date 09/10/2022 

SELECT u_fname,u_lname
FROM users
WHERE usr_id IN (SELECT usr_id
             FROM billing_detail
             WHERE bill_date='2022-10-09');

==============================================================================

2. CORRELATED QUERY
Q.Finds drivers whose salary is greater than the average salary of all other drivers to compare their work and feedback with those paid lesser
SELECT driver_fname, d_salary
 FROM driver d
 WHERE d_salary >
                (SELECT AVG(d_salary)
                 FROM driver
		);

===============================================================================
3. SET OPERATION UNION
Q. Join the taxi and auto and bike service tables into one vehicle table for better reference.
SELECT * FROM auto_bike_service 
UNION
SELECT * FROM taxi;
===============================================================================
4. SET OPERATION 
Q.Check how many drivers know to drive taxi and auto or bike
SELECT driver_fname
FROM driver 
WHERE driver_id in (
SELECT driver_id
FROM taxi
Intersect
SELECT driver_id
FROM auto_bike_service);
===============================================================================
5.Two queries  for Aggregate functions with group by clause, use Having Clause.
Q. Group the users based on their usage of the company's services and display those
users who have spent more than 500 rupees our on taxi services
SELECT	usr_id ,SUM(fare),COUNT(usr_id)
				FROM		trip_detail td
				GROUP BY	td.usr_id
                HAVING		SUM(fare)>=500;
==============================================================================
6.Two queries  for Aggregate functions with group by clause, use Having Clause.////
Q. Group based on the billing date and find out on which day how much collection has occurred and display those dates where collection is more than 200
SELECT	bill_date,usr_id ,SUM(total_amt),COUNT(usr_id)
				FROM		billing_detail
				GROUP BY	bill_date
                HAVING		SUM(total_amt)>=200

==============================================================================
7.ORDER BY CLAUSE
Q. Order the billing table based on bill_date starting from most recent dates.
 SELECT bill_no, bill_date,u_fname,u_phone,total_amt,discount
    FROM billing_detail b,users u
    WHERE u.usr_id=b.usr_id
	ORDER BY bill_date desc;
==============================================================================
8. ORDER BY CLAUSE
Q.Order the driver table based on salary in descending order.
SELECT driver_fname,driver_lname,d_salary
FROM driver
ORDER BY d_salary DESC

=============================================================================
FUNCTION:
DELIMITER $$
CREATE FUNCTION annualincome_tax(monthly_salary INTEGER)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
IF monthly_salary*12 > 50000 THEN 
RETURN ("Taxable");
ELSE
RETURN ("Non Taxable");
END IF;
END$$
DELIMITER ;

