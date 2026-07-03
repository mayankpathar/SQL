-- 1. Top 5 customers who purchased the highest total quantity
SELECT TOP 5 CustomerName, SUM(Quantity) AS TotalQuantity
FROM MYTABLE
GROUP BY CustomerName
ORDER BY TotalQuantity DESC;

-- 2. Top 3 cities having the maximum number of orders
SELECT TOP 3 City, COUNT(OrderID) AS TotalOrders
FROM MYTABLE
GROUP BY City
ORDER BY TotalOrders DESC;

-- 3. Top 10 products having the highest total revenue
SELECT TOP 10 Product,
SUM(Quantity * UnitPrice) AS TotalRevenue
FROM MYTABLE
GROUP BY Product
ORDER BY TotalRevenue DESC;

-- 4. Top 5 categories having the highest average unit price
SELECT TOP 5 Category,
AVG(UnitPrice) AS AvgUnitPrice
FROM MYTABLE
GROUP BY Category
ORDER BY AvgUnitPrice DESC;

-- 5. Top 3 payment modes used most frequently
SELECT TOP 3 PaymentMode,
COUNT(*) AS Frequency
FROM MYTABLE
GROUP BY PaymentMode
ORDER BY Frequency DESC;

-- 6. Cities where total revenue > 500000
SELECT City,
SUM(Quantity * UnitPrice) AS TotalRevenue
FROM MYTABLE
GROUP BY City
HAVING SUM(Quantity * UnitPrice) > 500000;

-- 7. Categories where average quantity > 5
SELECT Category,
AVG(Quantity) AS AvgQuantity
FROM MYTABLE
GROUP BY Category
HAVING AVG(Quantity) > 5;

-- 8. Customers who placed at least 5 orders
SELECT CustomerName,
COUNT(OrderID) AS TotalOrders
FROM MYTABLE
GROUP BY CustomerName
HAVING COUNT(OrderID) >= 5;

-- 9. Products sold in more than 3 cities
SELECT Product,
COUNT(DISTINCT City) AS TotalCities
FROM MYTABLE
GROUP BY Product
HAVING COUNT(DISTINCT City) > 3;

-- 10. Customers who purchased from more than 2 categories
SELECT CustomerName,
COUNT(DISTINCT Category) AS Categories
FROM MYTABLE
GROUP BY CustomerName
HAVING COUNT(DISTINCT Category) > 2;

-- 11. Cities having more than 10 distinct customers
SELECT City,
COUNT(DISTINCT CustomerName) AS Customers
FROM MYTABLE
GROUP BY City
HAVING COUNT(DISTINCT CustomerName) > 10;

-- 12. Payment modes having more than 100 total quantities sold
SELECT PaymentMode,
SUM(Quantity) AS TotalQuantity
FROM MYTABLE
GROUP BY PaymentMode
HAVING SUM(Quantity) > 100;

-- 13. Top 10 products with highest average unit price
SELECT TOP 10 Product,
AVG(UnitPrice) AS AvgPrice
FROM MYTABLE
GROUP BY Product
ORDER BY AvgPrice DESC;

-- 14. Categories where maximum unit price > 50000
SELECT Category,
MAX(UnitPrice) AS MaxPrice
FROM MYTABLE
GROUP BY Category
HAVING MAX(UnitPrice) > 50000;

-- 15. Cities where minimum unit price < 5000
SELECT City,
MIN(UnitPrice) AS MinPrice
FROM MYTABLE
GROUP BY City
HAVING MIN(UnitPrice) < 5000;

-- 16. Customers whose maximum purchase quantity > 10
SELECT CustomerName,
MAX(Quantity) AS MaxQuantity
FROM MYTABLE
GROUP BY CustomerName
HAVING MAX(Quantity) > 10;

-- 17. Top 5 customers with highest average unit price
SELECT TOP 5 CustomerName,
AVG(UnitPrice) AS AvgPrice
FROM MYTABLE
GROUP BY CustomerName
ORDER BY AvgPrice DESC;

-- 18. Top 10 products sold in highest total quantity
SELECT TOP 10 Product,
SUM(Quantity) AS TotalQuantity
FROM MYTABLE
GROUP BY Product
ORDER BY TotalQuantity DESC;

-- 19. Categories whose total revenue > 500000
SELECT Category,
SUM(Quantity * UnitPrice) AS TotalRevenue
FROM MYTABLE
GROUP BY Category
HAVING SUM(Quantity * UnitPrice) > 500000;

-- 20. Top 5 cities with highest average revenue per order
SELECT TOP 5 City,
AVG(Quantity * UnitPrice) AS AvgRevenue
FROM MYTABLE
GROUP BY City
ORDER BY AvgRevenue DESC;

-- 21. Customers who purchased more than 10 distinct products
SELECT CustomerName,
COUNT(DISTINCT Product) AS Products
FROM MYTABLE
GROUP BY CustomerName
HAVING COUNT(DISTINCT Product) > 10;

-- 22. Categories having at least 5 different products
SELECT Category,
COUNT(DISTINCT Product) AS Products
FROM MYTABLE
GROUP BY Category
HAVING COUNT(DISTINCT Product) >= 5;

-- 23. Payment modes having more than 5 distinct customers
SELECT PaymentMode,
COUNT(DISTINCT CustomerName) AS Customers
FROM MYTABLE
GROUP BY PaymentMode
HAVING COUNT(DISTINCT CustomerName) > 5;

-- 24. Cities where total quantity >100 and average unit price >20000
SELECT City,
SUM(Quantity) AS TotalQuantity,
AVG(UnitPrice) AS AvgPrice
FROM MYTABLE
GROUP BY City
HAVING SUM(Quantity) > 100
AND AVG(UnitPrice) > 20000;

-- 25. Top 10 customers:
-- Highest revenue, then quantity, then alphabetical order
SELECT TOP 10 CustomerName,
SUM(Quantity * UnitPrice) AS TotalRevenue,
SUM(Quantity) AS TotalQuantity
FROM MYTABLE
GROUP BY CustomerName
ORDER BY TotalRevenue DESC,
         TotalQuantity DESC,
         CustomerName ASC;