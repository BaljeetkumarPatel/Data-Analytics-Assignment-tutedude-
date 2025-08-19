use DataAnalytics;

 CREATE TABLE Employees2 (
   EmpID INT PRIMARY KEY,
   Name VARCHAR(50),
   DateOfBirth DATE,
   JoinDate DATE
 );

INSERT INTO Employees2(EmpID, Name, DateOfBirth, JoinDate)
VALUES
   (1, 'Alice Johnson', '1985-05-20', '2010-06-15'),
   (2, 'Bob Smith', 	'1990-08-10', '2015-09-01'),
   (3, 'Charlie Brown', '1988-03-25', '2012-11-12'),
   (4, 'Diana Prince',  '1992-01-30', '2017-07-08'),
   (5, 'Eve Adams', 	'1987-12-05', '2013-03-20');


-- a) Current Date & Time: Display the current system date and time.
SELECT CURRENT_TIMESTAMP;

-- b) Calculate Age: Compute each employee’s age in years based on DateOfBirth.
 SELECT Name, FLOOR(DATEDIFF(Day, DateOfBirth,getdate())/365.25) AS Age FROM Employees2;

select Name, DATEDIFF(YEAR, DateOfBirth, GETDATE())Age_in_year from Employees2;


--c) Calculate Experience: Compute total years of service since JoinDate.
select Name,floor(datediff(day,JoinDate,getDAte())/365.25)Experience_in_Year from Employees2;
select Name,datediff(Year,JoinDate,getDAte())Experience_in_Year from Employees2;


--d) Extract DOB Components: Extract year, month, and day from DateOfBirth.
select Name,year(DateOfBirth)BirthYear,month(DateOfBirth)BirthMonth,day(DateOfBirth)BirthDay from Employees2;


-- e) Born in August: List employees born in the month of August.
select Name from Employees2 where month(DateOfBirth)=8;

-- f) Upcoming Birthdays: Display names of employees whose birthdays fall in the next 30 days.
select * from Employees2;

select Name from Employees2 
where DATEADD(YEAR, DATEDIFF(YEAR, DateOfBirth, GETDATE()), DateOfBirth) 
      between GETDATE() AND DATEADD(DAY, 30, GETDATE());

