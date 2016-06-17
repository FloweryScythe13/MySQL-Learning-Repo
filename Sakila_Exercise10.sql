SELECT COUNT(title) FROM film 
JOIN language ON (film.language_id = language.language_id) 
JOIN film_category ON (film.film_id = film_category.film_id) 
JOIN category ON (film_category.category_id = category.category_id) 
WHERE language.name = "English" AND category.name = "Documentary"


Files Reviewed



Checklist
[partially met] All queries produce expected results. There may be more than one ways of getting the same result, but the result itself should not be incorrect.
[met] Medium to large queries are broken down into multiple lines to enhance readability.
[met] In each query, SQL reserved words are written in capital letters and user-defined names (such as table names, column names, etc.) are written in small letters.
[met] "SELECT *" is never used: selected columns are explicitly specified.
[not met] The more readable ANSI-Standard Join clauses are used instead of the old-style joins.
[met]  Column numbers are not used in the ORDER BY clause.
[met] Meaningful names are used for table or column aliases.










notes

AW_Exercise2.sql - selecting City is not fully necessary here in order to specify a condition for the City field
AW_Exercise3.sql - returns an empty set. When Having is corrected to WHERE, it returns an incorrect number of items due to the use of COUNT rather than SUM. Also minor defect - ListPrice need not be listed in the Select statement, and it prints the list price for just one specific sold item. 
AW_Exercise4.sql - selecting SubTotal, TaxAmt, and Freight is not fully necessary here
AW_Exercise5.sql - this does not include a restriction on the product name to just "Racing Socks, L," and so the result returned is incorrect. 
AW_Exercise6.sql - minor defect, since you are calling from SalesOrderHeader as your primary table, you need not specify SalesOrderHeader.SalesOrderId. It is probably good practice to specify it on UnitPrice for readability, though, since UnitPrice is part of SalesOrderDetail, not SalesOrderHeader. 
AW_Exercise8.sql - selecting Culture and ProductID not fully necessary here
AW_Exercise9.sql - might be wrong result. COME BACK TO THIS
AW_Exercise10.sql - selecting City and ProductCategory.Name is not fully necessary here
AW_Exericse11.sql - COME BACK TO THIS
AW_Exercise12.sql - returns incorrect results for the second and third statements, due to use of SUM. This is partially due to poor wording of the question, however. When SUM is used, only the first order is displayed. 
AW_Exercise13.sql - question might have been misunderstood (compared to my own reading of it); need an objective definition of "best selling" to refer to. Even if understanding of question is accurate, the answer itself is incomplete - existing code would need to be set as a subquery, so that you can pull the max value row from the result set and display the corresponding product by its UnitPrice (or ListPrice). Final result should only contain 1 row. 
AW_Exercise14.sql - I'm mainly confused by the use of SalesOrderHeader and the joining of SalesOrderDetail instead of just pulling from SalesOrderDetail in the first place, but I think it looks good otherwise.
AW_Exercise15.sql - different understanding of "most important" compared to mine here again. Other than that, the product breakdown is good, but the result set needs to be limited to the top 3 cities. So answer is incomplete. 
AW_Exercise18.sql - same issue with intermingling of "bike" and "cycle" company names that I had. To quote Dinesh, "The names containing "cycle" are intermingled with the names containing "bike".  Suggested solution is to instead do two separate queries, first one using WHERE CompanyName LIKE "%ike%", then UNION with second SELECT statement using WHERE CompanyName LIKE "%ycle%". " 
AW_Exercise19.sql - minor defect - since you aliased SUM(SubTotal+TaxAmt+Freight) as TotalValue in your Select statement, you can refer to that value as TotalValue in your Order By clause at the end, and need not write out SUM(SubTotal+TaxAmt+Freight) again. Otherwise good. 
AW_Exercise20.sql - I think my own answer for this question is wrong. So I will need to figure out the correct query result first. 

Sakila_Exercise7.sql - does not run. There is a typo in the Select statement - "fist_name" should be "first_name".
Sakila_Exercise8.sql - does not run. There is a typo - film_list.film_id should be film_list.FID. 


Unnecessary Fields in Select Statement
AW_Exercises 2, 4, 8, 10


Files Reviewed

AW_Exercise1.sql - AWExercise20.sql
Sakila_Exercise_01.sql
Sakila_Exercise_02.sql
Sakila_Exercise_03.sql
Sakila_Exercise_04.sql
Sakila_Exercise_05.sql
Sakila_Exercise_06.sql
Sakila_Exercise_07.sql
Sakila_Exercise_08.sql
Sakila_Exercise_09.sql
Sakila_Exercise_10.sql

Checklist
[partially met] All queries produce expected results. There may be more than one ways of getting the same result, but the result itself should not be incorrect.
[met] Medium to large queries are broken down into multiple lines to enhance readability.
[met] In each query, SQL reserved words are written in capital letters and user-defined names (such as table names, column names, etc.) are written in small letters.
[met] "SELECT *" is never used: selected columns are explicitly specified.
[met] The more readable ANSI-Standard Join clauses are used instead of the old-style joins.
[met]  Column numbers are not used in the ORDER BY clause.
[met] Meaningful names are used for table or column aliases.


Defects: 

Defect 1 (grouping)
Type: Extra
Severity: Minor
Location:
AW_Exercise2.sql
AW_Exercise3.sql
AW_Exercise4.sql
AW_Exercise8.sql
AW_Exercise10.sql
Description:
In these files, fields that are used for restrictions in the WHERE clauses are included in the SELECT statement. This is helpful for verifying the restriction conditions, but are unnecessary for the answer. In exercise 2, City is the unneeded field in the first line; in exercise 3, it is the ListPrice field; in exercise 4, it is SubTotal, TaxAmt, and Freight; in exercise 8, Culture and ProductID; and in exercise 10, City and ProductCategory.Name. 

Defect 2
Type: Wrong
Severity: Major
Location:
AW_Exercise3.sql
Description:
Query returns an empty set, due to use of HAVING clause instead of WHERE. In addition, the number of items returned in the query (after HAVING is corrected) is incorrect due to use of COUNT for the OrderQty field. Since an order can contain more than one of a given item (as represented by the value of OrderQty), the per-row values of OrderQty should be added together, not counted, to find the total number of sold items with a ListPrice > $1000. So final query would look like SELECT SUM(OrderQty) FROM SalesOrderHeader NATURAL JOIN SalesOrderDetail NATURAL JOIN ProductAW WHERE ListPrice > 1000; 

Defect 3
Type: Missing
Severity: Major
Location:
AW_Exercise5.sql
Description: 
The query is missing a restriction condition - the products should be limited to those with product name "Racing Socks, L." The result returned is thus incorrect. The code needs an extra join to the ProductAW table and an addition to the WHERE clause, i.e. AND ProductAW.Name = "Racing Socks, L". 

Defect 4 
Type: Extra
Severity: Minor
Location: 
AW_Exercise6.sql
Description:
As a small stylistic issue, because this query uses SalesOrderHeader as the primary table, it is unnecessary to specify it in SELECT SalesOrderHeader.SalesOrderID, UnitPrice FROM SalesOrderHeader. You would then need to specify SalesOrderDetail.UnitPrice, but this would improve the readability of the code (since the current format suggests to a reader that UnitPrice is a field of SalesOrderHeader, when it is actually only a field of SalesOrderDetail). 

Defect 5
Type: Wrong
Severity: Major
Location:
AW_Exercise9.sql
Description:
Result returned is incorrect. The query as written returns the combined total weight of all orders ever made by each company, but the question asks to show the total weight of each individual order. The code can be amended to get the correct result by eliminating the SUM function (and accompanying parentheses, if you prefer) from line 1 and the GROUP BY CustomerAW.CompanyName clause in line 9.

Defect 6 
Type: Wrong
Severity: Major
Location:
AW_Exercise11.sql
Description:
The subquery in IFNULL is missing an open parentheses. When this is corrected, an error is thrown stating that the subquery returns more than one row - in other words, more than one row is being returned per Address.AddressLine1. The bug is in the WHERE clause in line 8 - by specifying CustomerAW.CustomerID = CustomerAddress.CustomerID, you will essentially be selecting ALL rows for which the address customerID and customer customerID are equal, which will be all or almost all of them. 

Defect 7 
Type: Wrong
Severity: Major
Location: 
AW_Exercise12.sql
Description:
The second and third queries return incorrect results, due to the use of the SUM function. The original question's poor wording is partly to blame for this problem. In any case, use of SUM is incorrect because it calculates the sum of all OrderQty*UnitPrice and OrderQty*ListPrice values from all the sales orders, and then displays only the first sales order ID - the question wants the OrderQty*UnitPrice and OrderQty*ListPrice values displayed for each individual SalesOrderID. This can be corrected by simply removing the SUM functions from those queries.

Defect 8
Type: Missing
Severity: Major
Location:
AW_Exercise13.sql
Description:



notes

AW_Exercise2.sql - selecting City is not fully necessary here in order to specify a condition for the City field
AW_Exercise3.sql - returns an empty set. When Having is corrected to WHERE, it returns an incorrect number of items due to the use of COUNT rather than SUM. Also minor defect - ListPrice need not be listed in the Select statement, and it prints the list price for just one specific sold item. 
AW_Exercise4.sql - selecting SubTotal, TaxAmt, and Freight is not fully necessary here
AW_Exercise5.sql - this does not include a restriction on the product name to just "Racing Socks, L," and so the result returned is incorrect. 
AW_Exercise6.sql - minor defect, since you are calling from SalesOrderHeader as your primary table, you need not specify SalesOrderHeader.SalesOrderId. It is probably good practice to specify it on UnitPrice for readability, though, since UnitPrice is part of SalesOrderDetail, not SalesOrderHeader. 
AW_Exercise8.sql - selecting Culture and ProductID not fully necessary here
AW_Exercise9.sql - might be wrong result. COME BACK TO THIS
AW_Exercise10.sql - selecting City and ProductCategory.Name is not fully necessary here
AW_Exericse11.sql - COME BACK TO THIS
AW_Exercise12.sql - returns incorrect results for the second and third statements, due to use of SUM. This is partially due to poor wording of the question, however. When SUM is used, only the first order is displayed. 
AW_Exercise13.sql - question might have been misunderstood (compared to my own reading of it); need an objective definition of "best selling" to refer to. Even if understanding of question is accurate, the answer itself is incomplete - existing code would need to be set as a subquery, so that you can pull the max value row from the result set and display the corresponding product by its UnitPrice (or ListPrice). Final result should only contain 1 row. 
AW_Exercise14.sql - I'm mainly confused by the use of SalesOrderHeader and the joining of SalesOrderDetail instead of just pulling from SalesOrderDetail in the first place, but I think it looks good otherwise.
AW_Exercise15.sql - different understanding of "most important" compared to mine here again. Other than that, the product breakdown is good, but the result set needs to be limited to the top 3 cities. So answer is incomplete. 
AW_Exercise18.sql - same issue with intermingling of "bike" and "cycle" company names that I had. To quote Dinesh, "The names containing "cycle" are intermingled with the names containing "bike".  Suggested solution is to instead do two separate queries, first one using WHERE CompanyName LIKE "%ike%", then UNION with second SELECT statement using WHERE CompanyName LIKE "%ycle%". " 
AW_Exercise19.sql - minor defect - since you aliased SUM(SubTotal+TaxAmt+Freight) as TotalValue in your Select statement, you can refer to that value as TotalValue in your Order By clause at the end, and need not write out SUM(SubTotal+TaxAmt+Freight) again. Otherwise good. 
AW_Exercise20.sql - I think my own answer for this question is wrong. So I will need to figure out the correct query result first. 

Sakila_Exercise7.sql - does not run. There is a typo in the Select statement - "fist_name" should be "first_name".
Sakila_Exercise8.sql - does not run. There is a typo - film_list.film_id should be film_list.FID. 


