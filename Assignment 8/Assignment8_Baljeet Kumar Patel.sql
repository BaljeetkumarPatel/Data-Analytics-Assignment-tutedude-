use DataAnalytics;

CREATE TABLE Products1 (
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(50),
   Price DECIMAL(10,2),
   QuantitySold INT,
   Category VARCHAR(50)
 );

INSERT INTO Products1 (ProductID, ProductName, Price, QuantitySold, Category)
VALUES
   (1, 'Laptop', 	800.00,  5,  'Electronics'),
   (2, 'Smartphone', 600.00, 10,  'Electronics'),
   (3, 'Desk Chair', 120.00, 15,  'Furniture'),
   (4, 'Table',  	200.00,  8,  'Furniture'),
   (5, 'Notebook', 	5.00, 20,  'Stationery'),
   (6, 'Pen',      	2.00, 50,  'Stationery');



--Above-Average Price: Select products whose Price exceeds the average price.
select * from Products1 where Price >(select avg(Price) from Products1);


-- Most Expensive Product: Display the ProductName and Price of the highest-priced item.
select top 1 ProductName,Price from Products1 order by Price Desc;


--Category Counts: Show the total number of products in each Category (using a subquery).

select Category,count(ProductName) as ProductCount from Products1 group by Category;

 SELECT DISTINCT Category,
   (SELECT COUNT(*)
    FROM Products P2
    WHERE P2.Category = P1.Category) AS ProductCount
 FROM Products P1;


-- Below-Average Sales: Find products with QuantitySold below the average quantity sold.
select ProductName,QuantitySold from Products1 where QuantitySold<(select avg(QuantitySold) from Products1);


-- Electronics View: Create a view for all Electronics products.

CREATE VIEW ElectronicsViews as
select * FROM Products1
WHERE Category = 'Electronics';

select * from ElectronicsViews;