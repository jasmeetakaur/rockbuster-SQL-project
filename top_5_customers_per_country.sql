SELECT D.country, 
	COUNT(DISTINCT A.customer_id) AS all_customer_count, 
	COUNT(DISTINCT top_5_customers) AS top_customer_count 
FROM customer A 
INNER JOIN address B ON A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D on C.country_id = D.country_id 
LEFT JOIN
(
	SELECT SUM(A.amount) As total_payment 
	B. customer_id, 
	D.city,
	E.country 
	FROM payment A 
	INNER JOIN customer B ON A.customer_id=B.customer_id 
	INNER JOIN address C ON B.address_id=C.address_id 
	INNER JOIN city D ON C.city_id=D.city_id 
	INNER JOIN country E on D.country_id=E.country_id
	WHERE city IN ('Aurora','Acua', 'Citrus Heights', 'Iwaki', 'Ambattur', 'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianj')
	Group BY B.customer_id,city,country 
	ORDER BY SUM(A.amount) DESC 
	LIMIT 5
) 
AS top_5_customers 
ON A.customer_id = top_S_customers.customer_id 
GROUP BY D.country 
ORDER BY  all_customer_count DESC
