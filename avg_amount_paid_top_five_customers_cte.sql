With top_amount_cte(customer_id,address_id,city,country,total_payment) AS
(
SELECT
	A.customer_id,
	B.address_id,
	D.city, 
	E.country 
	FROM payment A 
	INNER JOIN customer B ON A.customer_id=B.customer_id 
	INNER JOIN address C ON B.address_id=C.address_id 
	INNER JOIN city D ON C.city_id=D.city_id 
	INNER JOIN country E on D.country_1d=E.country_id
	WHERE city IN 
	(
		 SELECT C.city 
		 FROM customer A 
		 INNER JOIN address B on A.address_id=B.address_id 
		 INNER JOIN city C on B.city_id=C.city_id 
		 INNER JOIN country D on c.country_1d=D.country_1d 
		 WHERE country IN 
		 ( 
			 SELECT D.country 
			 FROM customer A 
			 INNER JOIN address B on A.address_id=B.address_id 
			 INNER JOIN city C on B.city_id=c.city_id 
			 INNER JOIN country D on C.country_id=D.country_id 
			 GROUP BY country 
			 ORDER BY COUNT (customer_id) DESC 
			 LIMIT 10
		 )
	GROUP BY country,city 
	ORDER BY COUNT (customer_id) DESC 
	LIMIT 10
	)
Group BY A.customer_id, first_name, last_name, city, country 
ORDER BY total_ payment DESC 
LIMIT 5 
)
SELECT ROUND (AVG (total_payment),2) 
FROM top_ amount_cte 
