create database TATA;
use TATA;

CREATE TABLE sales_order (
				Order_Number INT,
				State_Code VARCHAR(10),
				Customer_Name VARCHAR(100),
				Order_Date DATE,
				Status VARCHAR(50),
				Product VARCHAR(150),
				Category VARCHAR(100),
				Brand VARCHAR(50),
				Cost DECIMAL(10,2),
				Sales DECIMAL(10,2),
				Quantity INT,
				Total_Cost DECIMAL(12,2),
				Total_Sales DECIMAL(12,2),
				Assigned_Supervisor VARCHAR(100)
			);
-- Q1. Display all columns and all records from the table.
select * from sales_order;

-- Q2. Find total number of orders.
SELECT COUNT(*) AS total_orders
FROM sales_order;

-- Q3. Calculate total sales revenue
SELECT SUM(Total_Sales) AS total_revenue
FROM sales_order;

-- Q4. Find average order value
SELECT AVG(Total_Sales) AS avg_order_value
FROM sales_order;

-- Q5. Total sales by state
SELECT State_Code, SUM(Total_Sales) AS total_sales
FROM sales_order
GROUP BY State_Code
ORDER BY total_sales DESC;

-- Q6. Top 5 customers by total purchase
SELECT Customer_Name, SUM(Total_Sales) AS total_spent
FROM sales_order
GROUP BY Customer_Name
ORDER BY total_spent DESC
LIMIT 5;

-- Q7. Total sales by product
SELECT Product, SUM(Total_Sales) AS total_sales
FROM sales_order
GROUP BY Product
ORDER BY total_sales DESC;

-- Q8. Monthly sales analysis
SELECT 
    MONTH(Order_Date) AS month,
    SUM(Total_Sales) AS total_sales
FROM sales_order
GROUP BY MONTH(Order_Date)
ORDER BY month;

-- Q9. Order status distribution
SELECT Status, COUNT(*) AS total_orders
FROM sales_order
GROUP BY Status;

-- Q10. Rank products based on total sales
SELECT 
    Product,
    SUM(Total_Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Total_Sales) DESC) AS rank_position
FROM sales_order
GROUP BY Product;
