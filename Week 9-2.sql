select*from supplier_t;
select*from product_t;

# inner join
select CompanyName,ProductName
From supplier_t inner join product_t
on supplier_t.SupplierNumber = product_t.SupplierNumber;

# join - prefer where avoid to writing condition
select CompanyName,ProductName
From supplier_t join product_t
where supplier_t.SupplierNumber = product_t.SupplierNumber;

# inner join and join
select CompanyName,ProductName, streetaddress, city, state, zip
From supplier_t join product_t
on supplier_t.SupplierNumber = product_t.SupplierNumber
order by ProductName asc;

# inner join
select CompanyName,ProductName
From supplier_t join product_t
on supplier_t.SupplierNumber = product_t.SupplierNumber
where zip>7000
order by productname asc;

# same like last one
select CompanyName,ProductName, zip
From supplier_t inner join product_t
on supplier_t.SupplierNumber = product_t.SupplierNumber
where zip>70000
order by productname asc;

# In-class Practice (1)
select ProductName, companyName
from product_t join supplier_t
on product_t.SupplierNumber = supplier_t.SupplierNumber
where QuantityonHand <= ReorderLevel

# LEFT JOIN 1
SELECT DISTINCT Supplier_T.SupplierNumber, ProductNumber 
FROM Supplier_T LEFT JOIN Product_T
ON Supplier_T.SupplierNumber = Product_T.SupplierNumber 
ORDER by Supplier_T.SupplierNumber;

# LEFT JOIN -2
SELECT Supplier_T.SupplierNumber, count(distinct ProductNumber)
FROM supplier_t LEFT JOIN product_t
ON Supplier_T.SupplierNumber = Product_T.SupplierNumber 
Group by SupplierNumber;

# data
select*from employees;
select*from office;

# inner join
select distinct employees.location
from employees join office
on employees.location = office.location;

# inner join - alter
SELECT DISTINCT Office.Location
FROM Employees JOIN Office
ON Employees.Location = Office.Location;

# inner join
SELECT DISTINCT Employees.Location 
FROM Employees JOIN Office
ON Employees.Location = Office.Location 
Order By Location ASC;

# inner join - alter
SELECT DISTINCT Office.Location
FROM Employees JOIN Office
ON Employees.Location = Office.Location Order By Location ASC;

# right join 
SELECT Office.Location, Count(EmployeeID) 
FROM Employees RIGHT JOIN Office
ON Employees.Location = Office.Location 
Group By location
Order By location;

# in-class pracitce (3)
select employees.Location, Count(EmployeeID),ANY_VALUE(RegionalOffice)
From employees right join office
on employees.location = office.Location
group by location
order by location;

select employees.Location, Count(EmployeeID), office.regionaloffice
From office right join employees
on office.RegionalOffice = employees.location
group by location
order by location;

# subquery
SELECT ProductNumber 
FROM Product_T 
WHERE SellingPrice > (SELECT AVG(SellingPrice) 
FROM Product_T);

select count(ProductNumber)
from product_t
where sellingprice >(
select avg(sellingprice)
from product_t
where ProductCategory = "children")
and ProductCategory = "children";

SELECT COUNT(ProductNumber) 
FROM Product_T
WHERE SellingPrice > (
SELECT AVG(SellingPrice)
FROM Product_T
WHERE ProductCategory = 'Children' ) 
AND ProductCategory = 'Road';

SELECT *
FROM Reservation_t 
WHERE RoomType = ( 
SELECT RoomType
FROM Reservation_T 
GROUP BY RoomType 
ORDER BY COUNT(*) DESC 
LIMIT 1);

# In-Class Pracitce(3)
select*
from reservation_t
where ArrivalDate = (
select arrivaldate
from reservation_t
group by arrivaldate
order by count(*) desc
limit 1);

# subquert: as a table of the form clause
SELECT ProductName
FROM Product_T,
(SELECT AVG(SellingPrice) AS AvgPrice 
FROM Product_T) AS Avg_T
WHERE SellingPrice > AvgPrice;

#subquery
SELECT ProductNumber
FROM Product_T,
(SELECT AVG(SellingPrice) AS AvgPrice 
FROM Product_T) as avg_t
WHERE SellingPrice > AvgPrice; 

# subquery
SELECT COUNT(ProductNumber) 
FROM Product_T,
(SELECT AVG(SellingPrice) AS AvgPrice 
FROM Product_T
WHERE ProductCategory = 'Children') AS Avg_T
WHERE SellingPrice > AvgPrice AND ProductCategory = 'Children';

# subquery
SELECT COUNT(ProductNumber) 
FROM Product_T,
(SELECT AVG(SellingPrice) AS AvgPrice 
FROM Product_T
WHERE ProductCategory = 'Children') AS Avg_T
WHERE SellingPrice > AvgPrice AND ProductCategory = 'Road';

# subquery
SELECT *
FROM Reservation_T,
(SELECT COUNT(*), RoomType as popular 
FROM Reservation_T
GROUP BY RoomType
ORDER BY COUNT(*) DESC
LIMIT 1) AS pop_T
WHERE RoomType = popular;

# In-Class Practice (4)
SELECT *
FROM Reservation_T,
(SELECT arrivaldate as businestDATE
FROM Reservation_T
GROUP BY ARRIVALDATE
ORDER BY COUNT(*) DESC
LIMIT 1) AS businestDate
WHERE arrivalDate=businestdate;


