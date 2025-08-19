use DataAnalytics;

 CREATE TABLE Orders (
   OrderID INT PRIMARY KEY,
   CustomerName VARCHAR(50),
   ProductCategory VARCHAR(50),
   Quantity INT,
   TotalPrice DECIMAL(10,2),
   OrderDate DATE
 );

INSERT INTO Orders (OrderID, CustomerName, ProductCategory, Quantity, TotalPrice, OrderDate) 
VALUES
   (1, 'Alice',   'Electronics', 2,  1600.00, '2024-11-01'),
   (2, 'Bob', 	'Furniture',   1,   300.00, '2024-11-02'),
   (3, 'Charlie', 'Electronics', 1,   800.00, '2024-11-03'),
   (4, 'Diana',   'Stationery', 10,	50.00, '2024-11-04'),
   (5, 'Eve', 	'Electronics', 3,  2400.00, '2024-11-05'),
   (6, 'Frank',   'Stationery', 20,   100.00, '2024-11-06');

--Compute total Quantity sold for each ProductCategory
SELECT ProductCategory, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductCategory;

--Find categories where total Quantity > 10.

select ProductCategory from Orders Group by ProductCategory having sum(Quantity)>10;

 SELECT ProductCategory
 FROM (
   SELECT ProductCategory, SUM(Quantity) AS TotalQuantity
   FROM Orders
   GROUP BY ProductCategory
 ) AS T
 WHERE TotalQuantity > 10;

--Calculate average TotalPrice per ProductCategory.
select ProductCategory,avg(TotalPrice) as Average_Total_Price from Orders group by ProductCategory;


--Identify categories where average TotalPrice < 1000.
select ProductCategory from Orders group by ProductCategory having avg(TotalPrice) <1000;

 SELECT ProductCategory
 FROM (
   SELECT ProductCategory, AVG(TotalPrice) AS AvgPrice
   FROM Orders
   GROUP BY ProductCategory
 ) AS T
 WHERE AvgPrice < 1000;


--Add a column marking each order as 'High Value' if TotalPrice > 1000, else 'Low Value'.

select *,case 
             when TotalPrice>1000 then 'High Value'
             else 'Low Value'
             end as ValueCategory
             from Orders;



