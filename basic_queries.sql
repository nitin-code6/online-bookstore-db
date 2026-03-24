-- 1) Retrieve all books in the "Fiction" genre
select * from books where genre="Fiction";

-- 2) Find books published after the year 1950
select * from books where published_yr>1950;
-- 3) List all customers from the Canada
select * from customers where country="Canada";
-- 4) Show orders placed in November 2023
select order_date from orders;
select * from orders where year(order_Date)=2023 and month(order_date)=11;
-- 5) Retrieve the total stock of books available
select sum(stock) from books;

-- 6) Find the details of the most expensive book

    select * from books where price=(select max(price) from books);
-- 7) Show all customers who ordered more than 1 quantity of a book
 select c. * , o. qty from customers c join orders o on c.customer_id=o.customer_id where qty>1;

-- 8) Retrieve all orders where the total amount exceeds $20
select * from orders where total_Amount >20;
-- 9) List all genres available in the Books table
select distinct genre from books;
-- 10) Find the book with the lowest stock
select * from books where ( select min(stock) from books)=stock;
-- 11) Calculate the total revenue generated from all orders
select sum(total_Amount) from orders ;