SELECT AVG(total_amount_paid. total_payment) AS Average 
FROM 
(
	SELECT SUM(A. amount) AS total_payment, 
	A.customer_1d, 
	B.first_name, 
	B.last_ name, 
	D. city, 
	E.country 
	FROM payment A 
	INNER JOIN customer B ON A.customer_1d=B.customer_id 
	INNER JOIN address C ON B.address_id=c.address_id 
	INNER JOIN city D ON c.city_id=D.city_id 
	INNER JOIN country & on D.country_id=E.country_id 
	WHERE city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur', 'Shanwei') 
	Group BY A.customer_id,first_name,last_name,city,country 
	ORDER BY SUM(A. amount) DESC 
	LIMIT 5
)
AS total_amount_paid
