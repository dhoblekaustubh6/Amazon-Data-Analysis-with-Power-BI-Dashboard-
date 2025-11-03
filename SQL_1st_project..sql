CREATE DATABASE Amazon ;
USE Amazon; 

-- To understand the dataset structure and column names.--
SELECT * FROM amazon_ecommerce_dataset;

-- To find how many product category or departments exist.--
SELECT DISTINCT Product_Category FROM amazon_ecommerce_dataset;

-- To analyze payment mode distribution.-- 
SELECT * FROM amazon_ecommerce_dataset WHERE Payment_Mode = 'Cash on Delivery';

-- Find total sales for each order.-- 
SELECT Customer_Name, (Quantity * Unit_Price * (1 - Discount)) AS Total_Sales FROM amazon_ecommerce_dataset;

-- To see which product category is most profitable.-- 
SELECT Product_Category, SUM(Profit) AS Total_Profit FROM amazon_ecommerce_dataset GROUP BY Product_Category ORDER BY Total_Profit DESC;

-- Count total number of orders placed in each state.-- 
SELECT State, COUNT(Order_ID) AS Total_Orders FROM amazon_ecommerce_dataset GROUP BY State ORDER BY Total_Orders DESC;

-- Get the top 5 highest-selling products (by revenue).-- 
SELECT Product_Name, SUM(Quantity * Unit_Price * (1 - Discount)) AS Total_Sales FROM amazon_ecommerce_dataset GROUP BY Product_Name ORDER BY Total_Sales DESC LIMIT 5;

-- Show total profit by month and year.--
SELECT YEAR(Order_Date) AS Order_Year, MONTH(Order_Date) AS Order_Month, SUM(Profit) AS Monthly_Profit 
FROM amazon_ecommerce_dataset GROUP BY YEAR(Order_Date), MONTH(Order_Date) ORDER BY Order_Year, Order_Month;

-- check mostly used payment mode. -- 
SELECT Payment_Mode, COUNT(Order_ID) AS Total_Orders FROM amazon_ecommerce_dataset GROUP BY Payment_Mode ORDER BY Total_Orders DESC LIMIT 5;
