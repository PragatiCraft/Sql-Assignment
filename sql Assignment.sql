/*1). Create a table called employees with the following structure;
#emp_id (integer, should not be NULL and should be a primary key)`
#emp_name (text, should not be NULL)`
#age (integer, should have a check constraint to ensure the age is at least 18)`
#email (text, should be unique for each employee)`
#salary (decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraints.*/

create database Assignment;
use Assignment;
create table employees 
(
emp_id int not null primary key,
emp_name char(60) not null,
age integer check( age>=18),
email varchar(80) unique,
salary Decimal(10,2 ) default 30000
);

/*2). Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
#examples of common types of constraints*/
#Ans= Constraints are rules applied to columns in a database table .Some types of Constraints with some examples
#i)unique= it ensure that duplicate values are not allowed in a column.
#eg
create table employees
(
emp_id  char(6) unique);
#ii)Not Null:constraints prevent critical fields from being left blank
#eg
create table employees
(
emp_id  char(6) not null);

#iii)check: make sure only valid data is entered
create table employees 
(
age integer check( age>=18));
#iv)Default:Assign Some default value to critical fields
create table employees 
(salary Decimal(10,2 ) default 30000);

/*3).Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
#your answer
Ans: The NOT NULL constraint is applied to ensure that a column cannot store NULL values.
Ensuring that critical fields always contain a value. For example, an email field in a users table must always have an email address.

No, a primary key cannot contain NULL values.
A primary key uniquely identifies each row in a table. If a NULL value were allowed, it would violate the rule that each row must be distinct,
Primary keys serve as the unique identifier for rows in a table. Since NULL represents the absence of a value, 
it doesn't fulfill the requirement of identifying a row*/


/*4)Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.

ans: When modifying constraints on an existing table, you typically use ALTER TABLE in SQL.
 Below are the steps and SQL commands for adding and removing constraints.

 a). Adding a Constraint

To add a constraint to an existing table, you use the ALTER TABLE command followed by ADD CONSTRAINT.
 You can add various types of constraints such as NOT NULL, UNIQUE, CHECK, PRIMARY KEY, or FOREIGN KEY.
 
 eg.
    ALTER TABLE employees
MODIFY COLUMN email VARCHAR(255) NOT NULL;

b). Removing a Constraint

To remove a constraint from a table, you use the ALTER TABLE command followed by DROP CONSTRAINT.
 Depending on the constraint type, the exact syntax can vary slightly.
 eg.
    ALTER TABLE employees
MODIFY COLUMN email VARCHAR(255) NULL;
*/

/*. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint





*/


/*7. You have two tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order
Hint: (use INNER JOIN and LEFT JOIN).*/


/*9) Given the following tables:Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
Ans=
select p.product_name,sum (amount) As total_sum_amount
from sale.s
inner join product p on s.product_id=p.product_id
group by p.product name;
*/

/*10)




*/

/*SQL Commands


1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
Ans:
Primary key in actor table is actor_id
in language  table primary key is language_id




A Primary Key is a unique identifier for each record in a table. No two rows can have the same primary key value,
 and it cannot contain null values. Primary keys enforce entity integrity by ensuring each row is unique.
 
 
     A Foreign Key is a field (or set of fields) in one table that refers to the primary key in another table, establishing a 
     link between the two tables. Foreign keys enforce referential integrity by ensuring that relationships between tables remain consistent.
Examples 

Actor_id is a foreign key beacaue it also prent in actor_award table
customer_id,staff_id_rental_id as a foreign key because is connect the payment table
*/


#2)List all details of actors

select * from actor;

#3)List all customer information from DB.

select * from customer;

#4 -List different countries.
select * from country;

select distinct country
FROM Country;

#5 -Display all active customers.
select * from customer
where active=1;

#6 -List of all rental IDs for customer with ID 1.

select rental_id from rental
where customer_id=1;

#7) - Display all the films whose rental duration is greater than 5 
select title from film
where rental_duration>5;

#8) List the total number of films whose replacement cost is greater than $15 and less than $20

select  count(title) as total_no_films  from film
where 15<replacement_cost<20;

#9)Display the count of unique first names of actors.

select count( distinct  first_name)as actor_name from  actor;

#10) Display the first 10 records from the customer table .

select * from customer
limit 10;

#11) Display the first 3 records from the customer table whose first name starts with ‘b’.

select * from customer
where first_name like 'B%'
limit 3;

#12)Display the names of the first 5 movies which are rated as ‘G’
select title from film
where rating='G';

#13) -Find all customers whose first name starts with "a".
select * from customer
where first_name like 'A%';

#14)Find all customers whose first name ends with "a".
select * from customer
where first_name like '%A';

#15) Display the list of first 4 cities which start and end with ‘a’ .
select * from city
where city like 'A%' and city like '%A'
limit 4;

#16) Find all customers whose first name have "NI" in any position.
select * from customer
where first_name like '%NI%';

#17) Find all customers whose first name have "r" in the second position 
select * from customer
where first_name like '_r%';

#18)Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from customer
where first_name like 'a%' and length(first_name)>=5;

#19) Find all customers whose first name starts with "a" and ends with "o".

select * from customer
where first_name like 'a%' and first_name like '%o';

#20 )- Get the films with pg and pg-13 rating using IN operator.
use mavenmovies;
select*from film
where rating IN ('PG','PG-13');

#21)  Get the films with length between 50 to 100 using between operator.
SELECT *
FROM film
WHERE title = 'Film Name'
  AND length BETWEEN 50 AND 100;
  
  #22)Get the top 50 actors using limit operator
  select * from actor
  limit 50;
  
  #23) Get the distinct film ids from inventory table.
  select distinct(film_id)from inventory;
  
  #Functions
  
  #Basic Aggregate Functions:
 /* Question 1:
Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.*/

use  sakila;
select count(*)as total_rentals from rental;

/*Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.*/

select day(rental_date) rental_day,
 avg(datediff(return_day,rental_day))  as rental_duration from rental
;

/*string Functions:
Question 3:
Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function.*/

select * from customer
where upper('first_name') and upper('last_name');

/*Question 4:
Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.*/

select rental_id, month(rental_date) as renal_month from rental;

/*GROUP BY:
Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY*/

SELECT customer_id, COUNT(rental_id) AS rental_count
FROM payment
GROUP BY customer_id;

/*Question 6:
Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.*/




/*Question 7:
Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.*/

SELECT fc.category_id, c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY fc.category_id, c.name;



/*Question 8:
Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.*/

SELECT l.language_id, l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.language_id, l.name;

/*Joins
Questions 9 -
Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables*/

SELECT f.title AS movie_title, c.first_name AS customer_first_name, c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;




/*Question 10:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.
*/
select actor.first_name,last_name from actor
join film_actor on actor.actor_id=film_actor.actor_id
join film on film.film_id=film_actor.film_id
where film.title="Gone with the Wind";

/*Question 11:
Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
*/
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_spent
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name;

/*Question 12:
List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.*/

SELECT
    customer.first_name ,customer.last_name AS customer_name,
    
    city.city AS city_name,
    film.title AS movie_title
FROM
    customer
JOIN
    address ON customer.address_id = address.address_id
JOIN
    city ON address.city_id = city.city_id
JOIN
    rental ON customer.customer_id = rental.customer_id
JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN
    film ON inventory.film_id = film.film_id
GROUP BY
    customer.first_name,
    customer.last_name,
    city.city,
    film.title
ORDER BY
    city_name, customer_name, movie_title;
    
    
   /* Advanced Joins and GROUP BY:

Question 13:
Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.*/
SELECT
    film.title AS movie_title,
    COUNT(rental.rental_id) AS rental_count
FROM
    film
JOIN
    inventory ON film.film_id = inventory.film_id
JOIN
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY
    film.title
ORDER BY
    rental_count DESC
LIMIT 5;

/*Question 14:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY*/

SELECT
    customer.customer_id,
    customer.first_name , customer.last_name AS customer_name
FROM
    customer
JOIN
    rental ON customer.customer_id = rental.customer_id
JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
GROUP BY
    customer.customer_id,
    customer.first_name,
    customer.last_name
HAVING
    COUNT(DISTINCT inventory.store_id) = 2;
    
    /*Windows Function:
1. Rank the customers based on the total amount they've spent on rentals.*/

SELECT
    customer.customer_id,
    customer.first_name , customer.last_name AS customer_name,
    SUM(payment.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(payment.amount) DESC) AS spending_rank
FROM
    customer
JOIN
    rental ON customer.customer_id = rental.customer_id
JOIN
    payment ON rental.rental_id = payment.rental_id
GROUP BY
    customer.customer_id,
    customer.first_name,
    customer.last_name
ORDER BY
    spending_rank;
    
    /*2. Calculate the cumulative revenue generated by each film over time.*/
    SELECT
    film.title AS movie_title,
    rental.rental_date,
    SUM(payment.amount) OVER (PARTITION BY film.film_id ORDER BY rental.rental_date) AS cumulative_revenue
FROM
    film
JOIN
    inventory ON film.film_id = inventory.film_id
JOIN
    rental ON inventory.inventory_id = rental.inventory_id
JOIN
    payment ON rental.rental_id = payment.rental_id
ORDER BY
    film.title,
    rental.rental_date;

/*3. Determine the average rental duration for each film, considering films with similar lengths.*/
SELECT
    film.title AS movie_title,
    film.length AS film_length,
    AVG(TIMESTAMPDIFF(day, rental.rental_date, rental.return_date)) OVER (PARTITION BY film.length) AS avg_rental_duration
FROM
    film
JOIN
    inventory ON film.film_id = inventory.film_id
JOIN
    rental ON inventory.inventory_id = rental.inventory_id
WHERE
    rental.return_date IS NOT NULL
ORDER BY
    film.length,
    movie_title;
    
    /*4. Identify the top 3 films in each category based on their rental counts.*/
    
    WITH RankedFilms AS (
    SELECT
        category.name AS category_name,
        film.title AS movie_title,
        COUNT(rental.rental_id) AS rental_count,
        ROW_NUMBER() OVER (PARTITION BY category.category_id ORDER BY COUNT(rental.rental_id) DESC) AS rank_in_category
    FROM
        film
    JOIN
        inventory ON film.film_id = inventory.film_id
    JOIN
        rental ON inventory.inventory_id = rental.inventory_id
    JOIN
        film_category ON film.film_id = film_category.film_id
    JOIN
        category ON film_category.category_id = category.category_id
    GROUP BY
        category.category_id,
        category.name,
        film.film_id,
        film.title
)
SELECT
    category_name,
    movie_title,
    rental_count
FROM
    RankedFilms
WHERE
    rank_in_category <= 3
ORDER BY
    category_name,
    rank_in_category;

/*5. Calculate the difference in rental counts between each customer's total rentals and the average rentals
across all customers.*/
use sakila;
WITH CustomerRentals AS (
    SELECT customer_id,
           COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY customer_id
),

AverageRentals AS (
    SELECT AVG(total_rentals) AS average_rentals
    FROM CustomerRentals
)

SELECT cr.customer_id,
       cr.total_rentals,
       ar.average_rentals,
       cr.total_rentals - ar.average_rentals AS difference_from_average
FROM CustomerRentals cr
JOIN AverageRentals ar;

 #6)Find the monthly revenue trend for the entire rental store over time.
 SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS monthly_revenue
FROM payment
GROUP BY month
ORDER BY month;

#7)Identify the customers whose total spending on rentals falls within the top 20% of all customers.


WITH CustomerSpending AS (
    SELECT customer_id,
           SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
),


RankedSpending AS (
    SELECT customer_id,
           total_spent,
           NTILE(5) OVER (ORDER BY total_spent DESC) AS spending_percentile
    FROM CustomerSpending
)

SELECT customer_id,
       total_spent
FROM RankedSpending
WHERE spending_percentile = 1
ORDER BY total_spent DESC;

#8) Calculate the running total of rentals per category, ordered by rental count.
select*from category;
select*from rental;

WITH CategoryRentals AS (
    SELECT c.name AS category_name,
           COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
),

OrderedCategoryRentals AS (
    SELECT category_name,
           rental_count,
           ROW_NUMBER() OVER (ORDER BY rental_count DESC) AS row_num
    FROM CategoryRentals
)

SELECT category_name,
       rental_count,
       SUM(rental_count) OVER (ORDER BY rental_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM OrderedCategoryRentals
ORDER BY row_num;

#9) Find the films that have been rented less than the average rental count for their respective categories.

WITH FilmRentals AS (
    SELECT f.film_id,
           f.title,
           c.name AS category_name,
           COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY f.film_id, f.title, c.name
),

CategoryAverages AS (
    SELECT c.name AS category_name,
           AVG(fr.rental_count) AS avg_rental_count
    FROM FilmRentals fr
    JOIN category c ON fr.category_name = c.name
    GROUP BY c.name
)

SELECT fr.film_id,
       fr.title,
       fr.category_name,
       fr.rental_count,
       ca.avg_rental_count
FROM FilmRentals fr
JOIN CategoryAverages ca ON fr.category_name = ca.category_name
WHERE fr.rental_count < ca.avg_rental_count
ORDER BY fr.category_name, fr.rental_count;

#10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS monthly_revenue
FROM payment
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 5;


/*Normalisation & CTE
1. First Normal Form (1NF):
a. Identify a table in the Sakila database that violates 1NF. Explain how you
would normalize it to achieve 1NF*/

/*Ans:   The Sakila database, which   contains various tables, including customer, film, actor, rental,
 and inventory tables. First Normal Form (1NF) 
requires that each column in a table contains atomic values, meaning no repeating groups or arrays within a single column.

Let's assume the film table in Sakila contains a special_features column that stores a list of features
 (e.g., {release_year, rental_duration, rating}). This column violates 1NF because it stores multiple values within 
 a single field.

Steps to Normalize to Achieve 1NF

To bring this table into 1NF, we would separate the special_features data into atomic values. Here’s how to achieve that:
i)Create a New Table for Special Features:
ii)Adjust the Original Table:

/*2)Second Normal Form (2NF):

a. Choose a table in Sakila and describe how you would determine whether it is in 2NF.
If it violates 2NF, explain the steps to normalize it.*/

/*Ans:
It is already in First Normal Form (1NF).
all non-key attributes should be fully functionally dependent on the entire primary key.

The rental table records information about each rental transaction. Suppose it has the following columns:
rental_id,rental_date,inventory_id,customer_id,staff_id
In this example:

    rental_id is the primary key, and the other columns
    (rental_date, inventory_id, customer_id, return_date, staff_id, and last_update) are non-key attributes.
    
    Checking if rental is in 2NF
    i)Verify 1NF Compliance:
    ii)Check for Partial Dependencies:
    
    /*3)Third Normal Form (3NF):

a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies
present and outline the steps to normalize the table to 3NF.

Ans:Third Normal Form (3NF) requires a table to be in Second Normal Form (2NF) and have no transitive dependencies
3NF ensures that all non-key attributes are directly dependent only on the primary key and not on other non-key attributes.
In the Sakila database, the address table might contain transitive dependencies and therefore violate 3NF.
Primary Key: address_id
Non-key Attributes: address, district, city_id, postal_code, phone, last_update

 city_id is a foreign key referencing the city table, which stores information about each city
 
 ransitive Dependencies

To check if this table violates 3NF, we look for any transitive dependencies. Here’s what we might find:
city_id is a foreign key that refers to the city of the address.
Attributes like district, postal_code, and phone are directly related to the address, so they depend on address_id.
However, city information, such as the country associated with the city, is indirectly related to address_id through city_id. 
This creates a transitive dependency because if city_id is removed, information about the city's country will also be removed.

Steps to Normalize the address Table to 3NF
1)Separate City Information:
2)New Structure
3)Update Relationships*/

/*4) Normalization Process:

a. Take a specific table in Sakila and guide through the process of normalizing it from the initial
unnormalized form up to at least 2NF.*/



/*5. CTE Basics:

a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they
have acted in from the actor and film_actor tables.*/

use sakila;
WITH ActorFilmCount AS (
    SELECT
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM
        actor a
    JOIN
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY
        a.actor_id, actor_name
)

SELECT
    actor_name,
    film_count
FROM
    ActorFilmCount
ORDER BY
    film_count DESC;

/*6)CTE with Joins:

a. Create a CTE that combines information from the film and language tables to display the film title,
language name, and rental rate*/

WITH FilmLanguageInfo AS (
    SELECT
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM
        film f
    JOIN
        language l ON f.language_id = l.language_id
)

SELECT
    film_title,
    language_name,
    rental_rate
FROM
    FilmLanguageInfo
ORDER BY
    film_title;


/* 7)CTE for Aggregation:

a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments)
from the customer and payment tables.*/

WITH CustomerRevenue AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM
        customer c
    JOIN
        payment p ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id, customer_name
)

SELECT
    customer_name,
    total_revenue
FROM
    CustomerRevenue
ORDER BY
    total_revenue DESC;

/*8) CTE with Window Functions:

a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.*/

WITH FilmRanking AS (
    SELECT
        title AS film_title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM
        film
)

SELECT
    film_title,
    rental_duration,
    duration_rank
FROM
    FilmRanking
ORDER BY
    duration_rank;

/*9)CTE and Filtering:

a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the
customer table to retrieve additional customer details.*/

WITH FrequentRenters AS (
    SELECT
        r.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM
        rental r
    GROUP BY
        r.customer_id
    HAVING
        COUNT(r.rental_id) > 2
)

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.address_id,
    fr.rental_count
FROM
    FrequentRenters fr
JOIN
    customer c ON fr.customer_id = c.customer_id
ORDER BY
    fr.rental_count DESC;

/*10)CTE for Date Calculations:

a. Write a query using a CTE to find the total number of rentals made each month, considering the
rental_date from the rental table.*/

WITH MonthlyRentals AS (
    SELECT
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM
        rental
    GROUP BY
        rental_month
)

SELECT
    rental_month,
    total_rentals
FROM
    MonthlyRentals
ORDER BY
    rental_month;

/*11) CTE and Self-Join:

a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film
together, using the film_actor table.*/
WITH ActorPairs AS (
    SELECT
        fa1.actor_id AS actor_id_1,
        fa2.actor_id AS actor_id_2,
        fa1.film_id
    FROM
        film_actor fa1
    JOIN
        film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE
        fa1.actor_id < fa2.actor_id 
        
)

SELECT
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor_name_1,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor_name_2,
    f.title AS film_title
FROM
    ActorPairs ap
JOIN
    actor a1 ON ap.actor_id_1 = a1.actor_id
JOIN
    actor a2 ON ap.actor_id_2 = a2.actor_id
JOIN
    film f ON ap.film_id = f.film_id
ORDER BY
    film_title, actor_name_1, actor_name_2;
    
    /*12). CTE for Recursive Search:

a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager,
considering the reports_to column*/















