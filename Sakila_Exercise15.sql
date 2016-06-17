
CREATE PROCEDURE spMissingPayments
AS
BEGIN
SELECT first_name, last_name FROM customer
JOIN rental ON (customer.customer_id = rental.customer_id)
RIGHT JOIN payment ON (rental.rental_id = payment.rental_id)
WHERE payment.payment_id IS null;
END