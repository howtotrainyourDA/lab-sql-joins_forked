USE sakila; 


## Challenge - Joining on multiple tables


-- 1. List the number of films per category.

SELECT 
	cat.name, COUNT(film.title) AS total_films
FROM 
	sakila.film AS film
JOIN
	sakila.film_category AS filmcat
	ON 
		film.film_id = filmcat.film_id
JOIN 
	sakila.category AS cat 
	ON 
		cat.category_id = filmcat.category_id
GROUP BY 
	cat.name;


/*
2. Retrieve the store ID, city, and country for each store.
*/
SELECT 
	sakila.store.store_id, sakila.city.city, sakila.country.country
FROM
	sakila.store
JOIN 
	sakila.address
	ON 
		sakila.store.address_id = sakila.address.address_id
JOIN
	sakila.city
    ON
		sakila.address.city_id = sakila.city.city_id
JOIN
	sakila.country
    ON
		sakila.country.country_id = sakila.city.country_id;
	
	



/*
3.  Calculate the total revenue generated by each store in dollars.

*/

SELECT sakila.store.store_id, sum(sakila.payment.amount) AS total_revenue
FROM 
	sakila.store
JOIN
	sakila.staff
		ON
			sakila.store.store_id = sakila.staff.store_id
JOIN
	sakila.rental
		ON
			sakila.rental.staff_id = sakila.staff.staff_id
JOIN
	sakila.payment
		ON
			sakila.payment.rental_id = sakila.rental.rental_id
GROUP BY
	sakila.store.store_id;



/*
4.  Determine the average running time of films for each category.
*/

SELECT 
	cat.name, AVG(film.length) AS avg_runtime
FROM 
	sakila.film AS film
JOIN
	sakila.film_category AS filmcat
	ON 
		film.film_id = filmcat.film_id
JOIN 
	sakila.category AS cat 
	ON 
		cat.category_id = filmcat.category_id
GROUP BY 
	cat.name;

/*
**Bonus**:

5.  Identify the film categories with the longest average running time.
6.  Display the top 10 most frequently rented movies in descending order.
7. Determine if "Academy Dinosaur" can be rented from Store 1.
8. Provide a list of all distinct film titles, along with their availability status in the inventory. Include a column indicating whether each title is 'Available' or 'NOT available.' Note that there are 42 titles that are not in the inventory, and this information can be obtained using a `CASE` statement combined with `IFNULL`."

Here are some tips to help you successfully complete the lab:

***Tip 1***: This lab involves joins with multiple tables, which can be challenging. Take your time and follow the steps we discussed in class:

- Make sure you understand the relationships between the tables in the database. This will help you determine which tables to join and which columns to use in your joins.
- Identify a common column for both tables to use in the `ON` section of the join. If there isn't a common column, you may need to add another table with a common column.
- Decide which table you want to use as the left table (immediately after `FROM`) and which will be the right table (immediately after `JOIN`).
- Determine which table you want to include all records from. This will help you decide which type of `JOIN` to use. If you want all records from the first table, use a `LEFT JOIN`. If you want all records from the second table, use a `RIGHT JOIN`. If you want records from both tables only where there is a match, use an `INNER JOIN`.
- Use table aliases to make your queries easier to read and understand. This is especially important when working with multiple tables.
- Write the query

***Tip 2***: Break down the problem into smaller, more manageable parts. For example, you might start by writing a query to retrieve data from just two tables before adding additional tables to the join. Test your queries as you go, and check the output carefully to make sure it matches what you expect. This process takes time, so be patient and go step by step to build your query incrementally.

*/