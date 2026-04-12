--use library

-- 1 Retrieve all records from the table
select * from datatbl

-- 2 Calculate total sales grouped by year and quarter
select year, quarter, sum(amount)
from datatbl
group by year, quarter

-- 3 Get top 5 customers based on highest total purchase
select top 5 customer, sum(amount) as total
from datatbl
group by customer
order by total desc

-- 4 Find product-wise sales for a specific year and quarter
select product, sum(amount)
from datatbl
where year=2017 and quarter='q1'
group by product

-- 5 Retrieve transactions where sales amount is greater than 1000
select *
from datatbl
where amount > 1000

-- 6 Find earliest and latest transaction dates
select min([date]), max([date])
from datatbl

-- 7 Calculate average sales amount for each product
select product, avg(amount)
from datatbl
group by product

-- 8 Retrieve customers who made purchases on a specific date
select *
from datatbl
where [date]='2017-01-01'

-- 9 Calculate total sales for each year
select year, sum(amount)
from datatbl
group by year

-- 10 Retrieve all transactions for a specific customer
select *
from datatbl
where customer='Picco'

-- 11 Calculate total sales per customer in a given year
select customer, sum(amount)
from datatbl
where year=2018
group by customer

-- 12 Count number of transactions made by each customer
select customer, count(*)
from datatbl
group by customer;

-- 13 Find products whose total sales amount is zero
select product
from datatbl
group by product
having sum(amount)=0

-- 14 Retrieve customers who purchased in a specific quarter and year
select distinct customer
from datatbl
where year=2018 and quarter='q2'

-- 15 Calculate total sales per product in a specific quarter
select product, sum(amount)
from datatbl
where quarter='q1'
group by product

-- 16 Find customers whose total purchase is above average
select customer
from datatbl
group by customer
having sum(amount) > (select avg(amount) from datatbl)

-- 17 Retrieve products with sales between 500 and 1000
select *
from datatbl
where amount between 500 and 1000

-- 18 Find customers with lowest purchase in each quarter
select quarter, customer, min(amount)
from datatbl
group by quarter, customer

-- 19 Retrieve customers who purchased in all four quarters
select customer
from datatbl
group by customer
having count(distinct quarter)=4

-- 20 Get top 10 transactions with highest sales amount
select top 10 *
from datatbl
order by amount desc

-- 21 Find earliest and latest purchase dates per customer
select customer, min([date]), max([date])
from datatbl
group by customer

-- 22 Retrieve product with highest sales in a specific year
select top 1 product, sum(amount)
from datatbl
where year=2023
group by product
order by sum(amount) desc

-- 23 Retrieve transactions made on weekends
select *
from datatbl
where datename(weekday,[date]) in ('saturday','sunday')

-- 24 Retrieve transactions made on weekdays
select *
from datatbl
where datename(weekday,[date]) not in ('saturday','sunday')

-- 25 Calculate total sales per quarter in a specific year
select quarter, sum(amount)
from datatbl
where year=2023
group by quarter

-- 26 Find customers with only one transaction
select customer
from datatbl
group by customer
having count(*)=1

-- 27 Calculate total sales per customer in descending order
select customer, sum(amount) as total
from datatbl
group by customer
order by total desc

-- 28 Retrieve customers who purchased on specific public holidays
select *
from datatbl
where [date] in ('2023-01-26','2023-08-15')

-- 29 Find products that have never been purchased
select product
from datatbl
group by product
having sum(amount)=0

----------------------------------

--not
select * from datatbl where not amount > 1000


--distinct
select distinct customer from datatbl
select distinct product from datatbl

--null
select * from datatbl where amount is null

--not null
select * from datatbl where amount is not null

--group by
select customer, sum(amount) from datatbl group by customer
select year, count(*) from datatbl group by year

--order by
select * from datatbl order by amount
select * from datatbl order by year desc

--Having
select customer, sum(amount)
from datatbl
group by customer
having sum(amount) > 1000

--max
select max(amount) from datatbl
select max([date]) from datatbl

--min
select min(amount) from datatbl
select min([date]) from datatbl

--asc
select * from datatbl order by amount asc

--Desc
select * from datatbl order by amount desc

--and
select * from datatbl where year=2018 and quarter='q1'

--like
select * from datatbl where customer like '%ant%'
select * from datatbl where product like 'a%'
select * from datatbl where customer like '%k'

--between
select * from datatbl where amount between 500 and 1000
select * from datatbl where year between 2012 and 2017