#  Online Bookstore Database (MySQL)

##  Project Overview
This project features a robust **relational database implementation for an online bookstore** using MySQL. It manages books, customers, and orders while demonstrating core SQL proficiencies, including schema design, data normalization, complex joins, aggregations, and subqueries.

---

##  Dataset
The database is populated using three primary CSV files:

| File | Description |
| :--- | :--- |
| `books.csv` | Contains book metadata: title, author, genre, price, stock levels, and publication year. |
| `customers.csv` | Contains customer profiles: names, cities, and countries. |
| `orders.csv` | Records transaction history: customer and book associations, quantities, total amounts, and dates. |

---

##  Database Schema
The database utilizes a normalized design consisting of three interconnected tables:

### 1. Books
- `book_id` (Primary Key)
- `title`, `author`, `genre`, `price`, `stock`, `published_yr`

### 2. Customers
- `customer_id` (Primary Key)
- `name`, `city`, `country`

### 3. Orders
- `order_id` (Primary Key)
- `customer_id` (Foreign Key → Customers)
- `book_id` (Foreign Key → Books)
- `qty`, `total_amount`, `order_date`

**Relationships:**
*   **Customers to Orders:** One-to-Many
*   **Books to Orders:** One-to-Many

---

##  SQL Concepts Utilized
*   **DDL & DML:** Schema definition and efficient data ingestion from CSV files.
*   **Data Retrieval:** Filtering (`WHERE`), sorting (`ORDER BY`), and pagination (`LIMIT`).
*   **Relational Logic:** Combining datasets using `INNER JOIN` and `LEFT JOIN`.
*   **Aggregation:** Data summarization using `SUM()`, `AVG()`, `COUNT()`, `MAX()`, and `MIN()`.
*   **Analytical Grouping:** Segmenting data via `GROUP BY` and filtering aggregates with `HAVING`.
*   **Advanced Querying:** Implementing nested subqueries and complex analytical calculations.

---

##  Sample Queries

| Analysis Description | SQL Query |
| :--- | :--- |
| **Filter by Genre** | `SELECT * FROM books WHERE genre = 'Fiction';` |
| **Total Inventory** | `SELECT SUM(stock) FROM books;` |
| **Sales by Genre** | `SELECT genre, SUM(qty) FROM books b JOIN orders o ON b.book_id = o.book_id GROUP BY genre;` |
| **Frequent Buyers** | `SELECT name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) >= 2);` |
| **Inventory Reconcilation** | `SELECT SUM(stock - COALESCE(temp.total_qty, 0)) FROM books b LEFT JOIN (SELECT book_id, SUM(qty) AS total_qty FROM orders GROUP BY book_id) temp ON b.book_id = temp.book_id;` |
| **Top-Tier Fantasy Books** | `SELECT * FROM books WHERE genre = 'Fantasy' ORDER BY price DESC LIMIT 3;` |
| **Highest Spending Customer** | `SELECT c.*, SUM(o.total_amount) AS total_spent FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id ORDER BY total_spent DESC LIMIT 1;` |

---

##  Project Structure
```text
online-bookstore-db/
│
├── dataset/
│   ├── books.csv
│   ├── customers.csv
│   └── orders.csv
│
├── schema.sql              # Table creation and constraints
├── basic_queries.sql       # Initial data exploration
├── advanced_queries.sql    # Complex joins, aggregations, and subqueries
└── README.md               # Project documentation
```

---

##  Technologies Used
*   **MySQL:** Relational Database Management System (RDBMS)
*   **SQL:** Structured Query Language for data manipulation and analysis
*   **Git & GitHub:** Version control and repository hosting

---

##  How to Run

1.  **Initialize the Database:**
    ```sql
    CREATE DATABASE online_bookstore;
    USE online_bookstore;
    ```

2.  **Build the Schema:**
    ```sql
    SOURCE path/to/schema.sql;
    ```

3.  **Import Data:**
    Use `LOAD DATA INFILE` or the Import Wizard in your preferred MySQL client (e.g., MySQL Workbench) to load the CSV files into their respective tables.

4.  **Execute Analysis:**
    Run the scripts provided in `basic_queries.sql` and `advanced_queries.sql` to generate insights.

---

##  Key Insights
*   **Revenue Tracking:** Total sales performance is monitored via `SUM(total_amount)`.
*   **Market Trends:** Identifying best-selling genres by joining product and sales data.
*   **Operational Efficiency:** Calculating real-time stock availability by reconciling initial inventory with sales volume.
*   **Customer Intelligence:** Identifying high-value customers through spend aggregation to support targeted marketing efforts.

---

##  Conclusion
This project demonstrates a comprehensive end-to-end workflow for database design and data analysis. By modeling a real-world bookstore scenario, it showcases proficiency in SQL development, data modeling, and relational algebra—core skills essential for Data Engineering, Backend Development, and Data Analysis roles.