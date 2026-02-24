SELECT
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    ROUND(SUM(i.Total), 2) AS TotalSpent,
    RANK() OVER (
        PARTITION BY c.Country
        ORDER BY SUM(i.Total) DESC
    ) AS SpendingRankInCountry
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.Country IS NOT NULL
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY c.Country, SpendingRankInCountry;
