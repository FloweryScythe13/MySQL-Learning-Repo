CREATE PROCEDURE spCustomerRentalHist(@CustID AS INT)
AS
BEGIN
SELECT film_list.title, rental_date, return_date, payment.amount, payment.payment_date FROM rental
JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
JOIN film_list ON (inventory.film_id = film_list.FID)
JOIN payment ON (rental.rental_id = payment.rental_id)
WHERE rental.customer_id = @CustID
END