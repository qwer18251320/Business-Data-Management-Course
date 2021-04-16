# 1) a list of all columns in this dataset
select*from topbabynamesbystate;

# 2) How many rows are there in this dataset? 
select count(*)
from topbabynamesbystate;

# 3) A list of unique names in this dataset ordered alphabetically from A to Z? 
SELECT DISTINCT topname
FROM topbabynamesbystate
ORDER BY topname ASC;

# 4) How many unique names are there in this dataset?
SELECT COUNT(DISTINCT topname)
FROM topbabynamesbystate
ORDER BY topname ASC;

# 5) Which name in which state and in which year had the highest number of occurrences. 
SELECT state, year, MAX(Occurrences)
FROM topbabynamesbystate
GROUP BY state, year
ORDER BY MAX(Occurrences) DESC
limit 1;

# 6) What is the average occurrence of “Jessica” as a top name in the state of CA? 
SELECT state, topName, AVG(Occurrences)
FROM topbabynamesbystate
WHERE state = "CA" AND topName = "Jessica";

# 7) How many years was “Mary” the top name in California? Name the computed column as “Mary_topinCA”. 
SELECT state, topName, count(year) AS Mary_topinCA
FROM topbabynamesbystate
WHERE topName = "Mary" AND state = "CA";

# 8) The three most popular female names in WA state since 2000. Popularity is based on the total number of occurrences. 
# Report the names along with the total number of occurrences. 
SELECT DISTINCT topName, sum(occurrences) AS Popularity
FROM topbabynamesbystate
WHERE state = "WA" AND year >= 2000 AND gender = "F"
GROUP BY topName
ORDER BY Popularity DESC
LIMIT 3;

# 9) Make a list of names that have an average occurrence greater than 1000. Order the result table by name in an ascending alphabetical order. 
SELECT topName, AVG(occurrences)
FROM topbabynamesbystate
GROUP BY topName
HAVING AVG(Occurrences) > 1000
ORDER BY TopName ASC;

# Q2-1
SELECT EmployeeID, FirstName
FROM employees
WHERE FirstName Like "pa___a%";

# Q2-2
SELECT count(distinct EmployeeID)
FROM employees, office
WHERE RegionalOffice = "No" And Year(hired_date) > 2000;

SELECT count(EmployeeID) 
FROM employees join office
on employees.location = office.location
WHERE RegionalOffice = "No" And Year(hired_date) > 2000;

# Q2-3 hired_date newest
SELECT Employeeid, title, AuditCode, (hired_date) as hired_year
FROM employees,office
WHERE auditcode = 100 AND Title = "Account Rep"
Order by hired_year desc
limit 1;

SELECT Employeeid, title, AuditCode, (hired_date) as hired_year
FROM employees join office
on employees.location = office.location
WHERE auditcode = 100 AND Title = "Account Rep"
Order by hired_year desc
limit 1;

# Q2-4
SELECT Title, Performance, avg(salaries)
FROM employees, office
WHERE Performance = "Poor"
Group By Title
HAVING AVG(salaries);

# Q2-5
SELECT*, Day(hired_date)
FROM employees
WHERE Day(hired_date)  = 31 AND LastName like "_____";

# Q2-6
SELECT*,salaries
FROM employees
where salaries > (select avg(salaries) from employees);

# Q2-7
SELECT salaries, avg(salaries), count(distinct EmployeeID)
From employees
where gender = "F"
Group by salaries
Having salaries > (select avg(salaries) from employees);

SELECT count(EmployeeID)
From employees
where gender = "F" and salaries > (select avg(salaries) from employees);