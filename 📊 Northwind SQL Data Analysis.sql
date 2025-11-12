📊 Northwind SQL Data Analysis – Full Project Summary
This project explores the Northwind dataset using SQLite and SQL. It covers foundational data analysis techniques including table inspection, filtering, joining, and aggregation. The goal is to build confidence in relational data modeling and querying.

🧰 1. Data Preparation
Imported CSV files into DB Browser for SQLite

Ensured correct settings:

Field separator: ;

Encoding: UTF-8

First row contains column names: ✅

Verified structure and cleaned preview

Imported tables:

customers

orders

order_details

products

categories

🔍 2. Basic Data Exploration

View All Customers

sql

SELECT 
    * 
FROM 
    customers;

Select Specific Columns
sql

SELECT 
    companyname, 
    country 
FROM 
    customers;

Filter by Country
sql

SELECT 
    companyname, 
    country 
FROM 
    customers 
WHERE 
    country = 'Germany';

Sort Alphabetically

sql

SELECT 
    companyname, 
    country 
FROM 
    customers 
ORDER BY 
    companyname ASC;

🔗 3. Relational Joins
Customers and Their Orders

sql

SELECT 
    c.customerid,
    c.companyname,
    o.orderid,
    o.orderdate
FROM 
    customers c
INNER JOIN 
    orders o ON c.customerid = o.customerid
LIMIT 10;

Orders and Products

sql

SELECT 
    o.orderid,
    p.productname,
    od.quantity,
    od.unitprice
FROM 
    orders o
INNER JOIN 
    order_details od ON o.orderid = od.orderid
INNER JOIN 
    products p ON od.productid = p.productid
LIMIT 10;

Full Order Details with Customer Info

sql

SELECT 
    c.companyname AS customer,
    p.productname,
    od.quantity,
    od.unitprice,
    o.orderdate
FROM 
    orders o
INNER JOIN 
    customers c ON o.customerid = c.customerid
INNER JOIN 
    order_details od ON o.orderid = od.orderid
INNER JOIN 
    products p ON od.productid = p.productid
LIMIT 10;


📊 4. Aggregation and Category Analysis
Total Sales by Product
sql

SELECT 
    p.productname,
    SUM(od.quantity * od.unitprice * (1 - od.discount)) AS total_sales
FROM 
    order_details od
JOIN 
    products p ON od.productid = p.productid
GROUP BY 
    p.productname
ORDER BY 
    total_sales DESC
LIMIT 10;

Total Sales by Category
sql

SELECT 
    cat.categoryname,
    SUM(od.quantity * od.unitprice * (1 - od.discount)) AS total_sales
FROM 
    order_details od
JOIN 
    products p ON od.productid = p.productid
JOIN 
    categories cat ON p.categoryid = cat.categoryid
GROUP BY 
    cat.categoryname
ORDER BY 
    total_sales DESC;

✅ Key Concepts Practiced
Table inspection and column selection

Filtering and sorting with WHERE and ORDER BY

Multi-table joins using INNER JOIN

Aggregating sales data with SUM

Grouping results with GROUP BY


Category-level analysis using JOIN with categories
