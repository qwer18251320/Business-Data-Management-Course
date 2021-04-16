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

# LEFT JOIN

