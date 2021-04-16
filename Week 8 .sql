USE Tina_schema;

#GROUP BY
select distinct genre, avg(profitability)
from hollywood_t
group by genre;

select distinct genre, avg(profitability)
from hollywood_t
group by genre
order by avg(profitability) desc
limit 1;

select distinct genre, count(film)
from hollywood_t
where year=2010
group by genre
order by count(film) desc
limit 1;

#In-class practice(1)
select leadstudio, sum(WorldwideGross)
from hollywood_t
group by leadstudio
order by sum(worldwidegross) desc
limit 1;

# Alias
select genre, avg(profitability) as AvgProfit
from hollywood_t
group by genre
order by AvgProfit desc
limit 1;

#HAVING
SELECT Genre, AVG(AudienceScore) 
FROM Hollywood_T
GROUP BY Genre;

SELECT Genre, AVG(AudienceScore) 
FROM Hollywood_T
GROUP BY Genre
HAVING AVG(AudienceScore)>50;

SELECT Genre, AVG(AudienceScore) 
FROM Hollywood_T
GROUP BY Genre
HAVING AVG(AudienceScore)>50
ORDER BY AVG(AudienceScore) ASC;

SELECT Genre, AVG(AudienceScore) As AvgAs
FROM Hollywood_T
GROUP BY Genre
HAVING AvgAS>50
ORDER BY AvgAS ASC;

SELECT LeadStudio, COUNT(Film) 
FROM Hollywood_T
WHERE year = 2010
GROUP BY LeadStudio
HAVING COUNT(FILM)>1;

#In-Class Practice(2)
SELECT Year, COUNT(film)
FROM Hollywood_T
WHERE Genre = "Romance"
GROUP BY Year
HAVING count(year)>5;

#In-Class Practice(3)
select*
FROM orders_t
ORDER BY OrderID ASC;

select orderID, count(orderID)
FROM orders_t
GROUP BY orderID;

Select OrderID, count(ProductID)
From orders_t
GROUP BY OrderID
HAVING count(ProductID)>1;

select *, quantity*unitPrice
From orders_t
Order by OrderID ASC;

select OrderID, sum(quantity*unitPrice) as Revenue
FROM orders_t
group by orderID;

select OrderID, sum(quantity*unitPrice) as Revenue
FROM orders_t
group by orderID
order by revenue desc
limit 1;

# WILDCARDS
select film
from hollywood_t
where film like "you%";

select film
from hollywood_t
where film like "%you";

select film
from hollywood_t
where film like "%you%";

select film
from hollywood_t
where film like "f_r%";

select year
from hollywood_t
where film like "you %";

select film
from hollywood_t
where film like "f_r%";

# In-Class Practice(4)
select film
from hollywood_t
where film like "a___s%";

# date function 
select*, now(), curdate(),curtime()
from famousbirthdays_t;

select*, year(birthday),month(birthday),day(birthday)
from famousbirthdays_t;

# In-Class Exercose(5)
select*, year(curdate()) - year(birthday) as Age
from famousbirthdays_t;

# date functions
select date_reported, date_occurred, datediff(date_reported, date_occurred) As Days_to_report
from lacrimes_t;

select*
from lacrimes_t
where year(date_occurred)=2013;

SELECT DISTINCT Crm_Cd, CrmCd_Desc
FROM LAcrimes_T
WHERE CrmCd_Desc LIKE '%Traffic%' AND year(date_occurred) = 2013 AND month(date_occurred) = 12;

#In-Class Practice(5)
SELECT count(*)
FROM LAcrimes_T
WHERE CrmCd_Desc LIKE '%Theft%' AND month(date_occurred) = 5;

