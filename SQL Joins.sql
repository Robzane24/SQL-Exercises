/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

 SELECT products.Name as 'Product Name', categories.Name as 'Catagory Name'
 FROM products
 INNER JOIN categories
 ON products.CatagoryID = catagories.CatagoryID
 WHERE catagories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 SELECT p.Name, p.Price, r.Rating
 FROM products AS p
 INNER JOIN reviews AS r
 ON p.PRODUCTID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS total
FROM sales AS s
INNER JOIN employees AS e
ON e.employeeID = s.employeeID
GROUP BY e.EmployeeID
ORDER BY total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.NAME AS 'Department Name', C.Name AS 'Category Name'
FROM departments AS d
INNER JOIN categories AS c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT p.NAME, Sum(s.Quantity) as 'Total Units Sold',
	Sum(s.quantity *s.PricePerUnit) as 'Total Price'
    FROM products as p
    INNER JOIN sales as s
    ON s.productID = p.productID
    WHERE p.ProductID = 97;
    -- verification:
    SELECT * FROM sales WHERE productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.reviewer, r.rating,
r.Comment FROM products AS p
INNER JOIN reviews AS r
ON r.ProductID = p.ProductID
WHERE p.productID	= 857 AND r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */