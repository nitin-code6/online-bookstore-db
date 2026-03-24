-- 1) Retrieve the total number of books sold for each genre
select genre,sum(qty) from books b join orders o on o.book_Id=b.book_Id group by b.genre;
-- 2) Find the average price of books in the "Fantasy" genre
select avg(price) from books where genre="Fantasy";
-- 3) List customers who have placed at least 2 orders
select customer_Id from orders group by customer_Id having count(order_Id)>2;
select name from customers;
select name,customer_Id from customers where customer_Id in (select customer_Id from orders group by customer_Id having count(order_Id)>2);
-- 4) Find the most frequently ordered book
select book_Id from orders  group by  book_Id having count(order_Id)=4;
select * from books where book_Id;
 select * from books where book_Id in (select book_Id from orders  group by  book_Id having count(order_Id)=(select max(order_count) from (select count(order_Id) as order_count from orders  group by  book_Id) as t));
--  OPTIMIZED SOLUTION 
select b.* from books b join orders o on b.book_Id=o.book_Id group by o.book_Id order by count(order_Id) desc limit 1;
-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
select * from books where genre="Fantasy" order by price desc limit 3;
-- 6) Retrieve the total quantity of books sold by each author
    select author,sum(o.qty) as total_qty from books b join orders o on b.book_Id =o.book_Id group by b.author;
-- 7) List the cities where customers who spent over $30 are located
select distinct city from customers c join orders o on o.customer_Id=c.customer_Id  where o.total_Amount>30;
-- 8) Find the customer who spent the most on orders
select c.* , sum(o.total_Amount) as total_spent from customers c join orders o on  o.customer_Id=c.customer_Id group by o.customer_Id order by sum(o.total_Amount) desc limit 1;
-- 9) Calculate the stock remaining after fulfilling all orders
select sum(stock-temp.total_qty) from books b
left join (select book_Id,sum(qty) as total_qty from orders group by book_Id) as temp on b.book_Id =temp.book_Id;