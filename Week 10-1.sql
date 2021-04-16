# Note 13 reverse engineer
SELECT * FROM product_t;
SELECT * FROM supplier_t;

select distinct suppliernumber
from supplier_t;

select distinct suppliernumber
from product_t;

# reverse engineer (10)
SELECT ProductNumber, count(Distinct SupplierNumber) 
FROM Product_T
Group by ProductNumber;

# reverse engineer (11)
SELECT Supplier_T.SupplierNumber, count(distinct ProductNumber) 
FROM supplier_t LEFT JOIN product_t
ON Supplier_T.SupplierNumber = Product_T.SupplierNumber 
Group by SupplierNumber;

# note
DELETE FROM supplier_t WHERE SupplierNumber =1;
select*from supplier_t;
select*from product_t;


