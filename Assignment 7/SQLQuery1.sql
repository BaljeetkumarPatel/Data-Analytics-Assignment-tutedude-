use DataAnalytics;

create table Customers(
   CustomerID int primary key,
   CustomerName nvarchar(100),
   ContactNumber nvarchar(15)
);

insert into Customers(CustomerID,CustomerName,ContactNumber)
values
(1,'John Doe','123-456-7890'),
(2,'Jane Smith','234-567-8901'),
(3,'Alice Johnson','345-678-9012'),
(4,'Bob Brown','567-890-1234'),
(5,'Carol White','678-901-2345');

create table Orders1(
  OrderID int primary key,
  OrderDate Date,
  CustomerID int,
  Amount DECIMAL(10,2)
  );

insert into Orders1(OrderID,OrderDate,CustomerID,Amount)
values
(1,'2023-06-01',1,150.00),
(2,'2023-06-03',2,200.00),
(3,'2023-06-05',3,300.00),
(4,'2023-06-07',6,250.00),
(5,'2023-06-09',7,175.00);

--inner Join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       inner join Orders1
       on Customers.CustomerID=Orders1.CustomerID;


--join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       join Orders1
       on Customers.CustomerID=Orders1.CustomerID;

--left Join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       left join Orders1
       on Customers.CustomerID=Orders1.CustomerID;


--right Join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       right join Orders1
       on Customers.CustomerID=Orders1.CustomerID;


--full outer join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       full outer join Orders1
       on Customers.CustomerID=Orders1.CustomerID;


--cross join
select Customers.CustomerID,
       Customers.CustomerName,
       Orders1.OrderID,
       Orders1.OrderDate,
       Orders1.Amount
       from Customers
       cross join Orders1;


--union all


--Except
