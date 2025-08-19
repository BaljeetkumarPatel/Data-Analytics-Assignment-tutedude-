use DataAnalytics;

CREATE TABLE Employees1 (
   EmpID INT PRIMARY KEY,
   EmpName VARCHAR(50),
   DepartmentID INT
 );

INSERT INTO Employees1(EmpID, EmpName, DepartmentID) 
VALUES
   (1, 'Alice',   101),
   (2, 'Bob', 	102),
   (3, 'Charlie', 103),
   (4, 'Diana',   NULL),
   (5, 'Eve', 	101);


delete from Departments where DeptID=101;

EXEC sp_rename 'Departments.DeptID', 'DepartmentID', 'COLUMN';


INSERT INTO Departments (DepartmentID, DeptName, Location) 
VALUES
   (101, 'HR',   	'New York'),
   (102, 'IT',   	'San Francisco'),
   (103, 'Finance',  'Chicago'),
   (104, 'Sales',	'Boston');

-- List all employees with assigned department names
 SELECT E.EmpID,
        E.EmpName,
        D.DeptName
        FROM Employees1 E
        INNER JOIN Departments D
        ON E.DepartmentID = D.DepartmentID;

--Show all employees, with department name if assigned (NULL if not).
 SELECT E.EmpID,
        E.EmpName,
        D.DeptName
        FROM Employees1 E
        LEFT JOIN Departments D
        ON E.DepartmentID = D.DepartmentID;

--Show all departments, with employee name if exists (NULL if none).
 SELECT D.DepartmentID,
        D.DeptName,
        E.EmpName
        FROM Employees1 E
        RIGHT JOIN Departments D
        ON E.DepartmentID = D.DepartmentID;


--Include all employees and departments, matching where possible.
 SELECT E.EmpID,
        E.EmpName,
        D.DeptName
        FROM Employees1 E
        FULL OUTER JOIN Departments D
        ON E.DepartmentID = D.DepartmentID;


--Generate every combination of employee names and department names.
 SELECT E.EmpName,
        D.DeptName
        FROM Employees1 E
        CROSS JOIN Departments D;


--Create a list combining all employee names and department names in one column.
 SELECT EmpName AS Name FROM Employees1
 UNION ALL
 SELECT DeptName FROM Departments;


--Find department IDs present in both tables.
 SELECT DepartmentID FROM Employees1
 INTERSECT
 SELECT DepartmentID FROM Departments;



-- List department IDs in Departments but not in Employees.
 SELECT DepartmentID FROM Departments
 EXCEPT
 SELECT DepartmentID FROM Employees1;

