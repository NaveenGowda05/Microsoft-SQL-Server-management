use library
select * from Customers
Select * from order_items
select * from payment
select * from orders


-- Customer details + orders

select c.first_name, c.last_name, o.order_id, o.order_date
from customers c
inner join orders o
on c.customer_id = o.customer_id

--What products where ordered

select o.order_id, oi.product_id, oi.quantity, oi.price
from orders o
left join order_items oi


-- total orders including 0

select 
c.first_name,
o.order_id,
oi.product_id,
oi.quantity,
oi.price
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
on o.order_id=oi.order_id

--Payment details per order

select o.order_id, p.payment_method, p.payment_amount
from orders o
left join payment p
on o.order_id=p.order_id

--all tables data


select 
c.first_name,
c.email,
o.order_id,
o.order_date,
oi.product_id,
oi.quantity,
p.payment_amount,
p.payment_method
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join payment p on o.order_id = p.order_id

--total order amount per customer

select c.first_name, sum(o.total_amount)
from customers c
join orders o on c.customer_id = o.customer_id
group by c.first_name

--All products with customer

select c.first_name, oi.product_id
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id

--Employees + Departments

select c.*, o.order_id, o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id

--Students + Attendance

select c.first_name, o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id
where o.order_date = '2023-10-01'

---Customers with NO orders

select c.*
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null

--Total orders per customer

select c.first_name, count(o.order_id) as total_orders
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.first_name

--Employee + Manager

select c1.first_name, c2.first_name as referred_by
from customers c1
left join customers c2
on c1.customer_id = c2.customer_id

---Books + Authors

select oi.product_id, o.order_date
from order_items oi
join orders o
on oi.order_id = o.order_id

--Students + Avg grades

select c.first_name, avg(o.total_amount) as avg_order
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.first_name

--Total order amount per customer

select c.first_name, sum(o.total_amount) as total_amount
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.first_name

