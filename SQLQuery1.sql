create database library

use library

--identity is used to generate numbers for a column automaticaally.

create table Authors(
author_id int identity(1,1) primary key,
author_name varchar(100) NOT NULL,
birth_year int)

select * from authors

-- there can be only one Primary key column in table and also it will be Unique and not null.
--not null can be used unlimited times
--unique can be used multiple times

create table books(
book_id int identity(1,1) primary key,
title varchar(100) NOT NULL,
isbn varchar(13) unique,
publication_year int check (publication_year >= 1800),
author_id int,
foreign key (author_id) references Authors(author_id))

select * from books

--check constraint is used to limit the range of the values.
--no need to include author id while inserting data into table, bcoz, we are using (identity).

insert into Authors (author_name, birth_year)values 
('Bharath', 1995),
('Raghu', 1985),
('Mahesh', 1875)

select * from authors

--here the publication year cannot be less than 1800 bcoz we are using Check constraints.

insert into Books (title, isbn, publication_year, author_id)values
('Book of Jack', '123', 2005, 1),
('Book of Tom', '456', 2010, 2),
('Book of David', '789', 2020, 3)

select * from books

create table Customers (
    customer_id int identity(1,1) primary key,
    customer_name varchar(50) NOT NULL,
    email varchar(100) unique,
    phone varchar(15) check (len(phone) >= 10))

--check + len is used here bcoz the phone number should be more than or equal to 10 figits only.

select * from Customers

Create table Orders (
    order_id int identity(1,1) primary key,
    order_date date check (order_date >= '2000-01-01'),
    customer_id int,
    total_amount decimal(10, 2) NOT NULL,
    foreign key (customer_id) references Customers(customer_id))

--Decimal here defines, total of 10 digits are allowed including 2 decimals.

select * from Orders

insert into Customers (customer_name, email, phone)values
('Naveen', 'naveen@gmail.com', '9876543210'),
('Ravi', 'ravi@gmail.com', '9123456780'),
('Suresh', 'suresh@gmail.com', '9988776655')

insert into Orders (order_date, customer_id, total_amount) values
('2022-05-10', 1, 500.00),
('2023-01-15', 2, 1200.50),
('2024-03-20', 3, 750.25)

