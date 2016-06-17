CREATE PROCEDURE spCountryCustomers(@CoName AS STRING)
AS
BEGIN
SELECT customer_id, customer.fist_name, customer.last_name FROM customer_list
JOIN customer ON (customer_list.customer_id = customer.customer_id)
WHERE customer_list.country = @CoName
END