use DataAnalytics;

CREATE TABLE Orders2 (
   OrderID INT PRIMARY KEY,
   OrderDate DATE,
   Amount DECIMAL(10,2)
 );


INSERT INTO Orders2 (OrderID, OrderDate, Amount) 
VALUES
   (1, '2024-11-01', 250.50),
   (2, '2024-11-02', 300.75),
   (3, '2024-11-03', 150.25);


-- a) Amount to String: Convert the Amount column to a textual string.
select cast(Amount as Varchar) as AmounTextt from Orders2;

--  b) Date to String: Format OrderDate as a string (e.g., 'YYYY-MM-DD').
select cast(OrderDate as Varchar) as OrderDateTextFormat from Orders2;
SELECT CONVERT(VARCHAR(10), OrderDate, 23) AS OrderDateTextFormat
FROM Orders2;


-- c) String to Date: Convert literal ' '2024-11-05' into a DATE type.
select convert(Date,'2024-11-05',23) as ConvertedDate;


-- d) Extract Year: Retrieve the year component from OrderDate.
select year(OrderDate) as Year from Orders2;


--e) Concatenate Fields: Combine OrderDate and Amount into one string.

select concat(OrderDate,'-$',Amount) as Summary from Orders2;

