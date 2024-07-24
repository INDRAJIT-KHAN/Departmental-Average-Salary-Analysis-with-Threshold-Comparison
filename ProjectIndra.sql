CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(50)
);






INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'John Doe', 1, 60000.00),
(2, 'Jane Smith', 1, 70000.00),
(3, 'Alice Johnson', 1, 65000.00),
(4, 'Bob Brown', 1, 75000.00),
(5, 'Charlie Wilson', 1, 80000.00),
(6, 'Eva Lee', 2, 70000.00),
(7, 'Michael Clark', 2, 75000.00),
(8, 'Sarah Davis', 2, 80000.00),
(9, 'Ryan Harris', 2, 85000.00),
(10, 'Emily White', 2, 90000.00),
(11, 'David Martinez', 3, 95000.00),
(12, 'Jessica Taylor', 3, 100000.00),
(13, 'William Rodriguez', 3, 105000.00);

INSERT INTO Departments (DepartmentID, Name) VALUES
(1, 'Marketing'),
(2, 'Research'),
(3, 'Development');






WITH DepartmentAverages AS (
    SELECT
        e.DepartmentID,
        d.Name AS DepartmentName,
        AVG(e.Salary) AS AverageSalary,
        COUNT(e.EmployeeID) AS NumberOfEmployees
    FROM
        Employees e
    JOIN
        Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY
        e.DepartmentID, d.Name
),
OverallAverage AS (
    SELECT
        AVG(Salary) AS OverallAverageSalary
    FROM
        Employees
)
SELECT
    da.DepartmentName,
    da.AverageSalary,
    da.NumberOfEmployees
FROM
    DepartmentAverages da,
    OverallAverage oa
WHERE
    da.AverageSalary > oa.OverallAverageSalary;
