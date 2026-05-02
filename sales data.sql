USE sales_projects;
SELECT * FROM sales_data LIMIT 10;
SELECT count(*) FROM sales_data;

-- Total Revenue
SELECT SUM(SALES) AS total_revenue FROM sales_data;

-- Revenue by Country
SELECT COUNTRY, SUM(SALES) AS revenue
FROM sales_data
GROUP BY COUNTRY
ORDER BY revenue DESC;

-- Revenue by Product Line
SELECT PRODUCTLINE, SUM(SALES) AS revenue
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY revenue DESC;

-- Top 5 Customers
SELECT CUSTOMERNAME, SUM(SALES) AS revenue
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY revenue DESC
LIMIT 5;

-- Best Month per Year
SELECT YEAR_ID, MONTH_ID, SUM(SALES) AS revenue
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, revenue DESC;

-- Top 5 Products with RANK()
SELECT PRODUCTCODE, PRODUCTLINE, SUM(SALES) AS revenue,
RANK() OVER (ORDER BY SUM(SALES) DESC) AS rnk
FROM sales_data
GROUP BY PRODUCTCODE, PRODUCTLINE
LIMIT 5;

