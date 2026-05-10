use library

select * from customers
select * from orders

---Create a stored procedure that retrieves all records from the table.

create procedure Cus_Name
as
begin

select first_name from customers

end

execute cus_name

---Write a stored procedure that takes a specific Product as input and returns all the transactions related to that product.

select * from orders

create procedure sp_getorderid
    @order_id int
as
begin

    select *
    from order_items
    where order_id = @order_id

end

execute sp_getorderid 1015

---Develop a stored procedure that accepts a Customer's name as input and provides a summary of their total spending for each year.

create procedure sp_customer_yearly_spending
    @first_name varchar(50)
as
begin

select 
c.first_name,
year(o.order_date) as order_year,
sum(o.total_amount) as total_spending
from customers c
join orders o
on c.customer_id = o.customer_id
where c.first_name = @first_name
group by c.first_name, year(o.order_date)
order by order_year

end

exec sp_customer_yearly_spending john

---Design a stored procedure that calculates the total sales amount for a specific Quarter and Year.

create procedure sp_total_sales_quarter_year
    @quarter int, @year int
as
begin

select 
@year as sales_year,
@quarter as sales_quarter,
sum(total_amount) as total_sales
from orders
where datepart(quarter, order_date) = @quarter
and year(order_date) = @year

end

exec sp_total_sales_quarter_year 1, 2015

---Create a stored procedure that returns the top N customers with the highest spending in a given Year.

create procedure sp_top_customers_year
    @top_n int,
    @year int
as
begin

select top (@top_n)
c.first_name,
sum(o.total_amount) as total_spending
from customers c
join orders o
on c.customer_id = o.customer_id
where year(o.order_date) = @year
group by c.first_name
order by total_spending desc

end

exec sp_top_customers_year 3, 2015


---Implement a stored procedure that calculates the average sales amount for each Product across all Years.

create procedure sp_avg_sales_per_product
as
begin

select 
oi.product_id,
avg(o.total_amount) as avg_sales
from order_items oi
join orders o
on oi.order_id = o.order_id
group by oi.product_id
order by oi.product_id

end

exec sp_avg_sales_per_product

---Write a stored procedure that takes a start and end date as inputs and returns all transactions within that date range.

create procedure sp_transactions_by_date
    @start_date date,
    @end_date date
as
begin

select *
from orders
where order_date between @start_date and @end_date

end

exec sp_transactions_by_date '2011-01-01', '2015-12-31'

---Create a stored procedure that retrieves the sales amount for a specific Customer on a particular Date.

create procedure sp_customer_sales_by_date
    @customer_id int,
    @order_date date
as
begin

select 
c.customer_id,
c.first_name,
o.order_date,
o.total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
where c.customer_id = @customer_id
and o.order_date = @order_date

end

exec sp_customer_sales_by_date 1, '2012-05-10'

---Develop a stored procedure that returns the total sales for each Quarter in a given Year.

create procedure sp_total_sales_by_quarter
    @year int
as
begin

select 
datepart(quarter, order_date) as quarter,
sum(total_amount) as total_sales
from orders
where year(order_date) = @year
group by datepart(quarter, order_date)
order by quarter

end

exec sp_total_sales_by_quarter 2013

---Write a stored procedure that updates the sales amount for a specific transaction identified by its unique identifier

create procedure sp_update_transaction_amount
    @order_id int,
    @new_amount decimal(10,2)
as
begin

update orders
set total_amount = @new_amount
where order_id = @order_id

end

exec sp_update_transaction_amount 1001, 5000

---Create a  stored procedure to insert Data in a Table

create procedure sp_insert_customer
    @first_name varchar(50),
    @last_name varchar(50),
    @email varchar(100),
    @phone varchar(20),
    @address varchar(100),
    @city varchar(50),
    @state varchar(50),
    @country varchar(50),
    @zip_code varchar(10)
as
begin

insert into customers(
first_name,
last_name,
email,
phone,
address,
city,
state,
country,
zip_code)

values(
@first_name,
@last_name,
@email,
@phone,
@address,
@city,
@state,
@country,
@zip_code)

end

exec sp_insert_customer
'naveen',
'gowda',
'naveen@gmail.com',
'9876543210',
'btm',
'bangalore',
'karnataka',
'india',
'560076'

