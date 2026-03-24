create database if not exists online_bookstore;
use online_bookstore;
create table Books (
book_Id int primary key,
title varchar(100),
author varchar(100),
genre varchar(50),
published_yr year,
price decimal(10,2),
stock int);
create table Customers (
customer_Id int primary key,
name varchar(50),
email varchar(50),
phone varchar(15),
city varchar(50),
country varchar(100)
);
create table Orders (
order_Id int primary key,
customer_Id int ,
book_Id int ,
order_Date date,
qty int ,
total_Amount decimal (10,2),
foreign key (customer_Id) references Customers(customer_Id),
foreign key (book_Id) references Books(book_Id)
);