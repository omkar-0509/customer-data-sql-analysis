CREATE TABLE customer_data (
    ID INT PRIMARY KEY,
    Year_Birth INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income NUMERIC(12,2),
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    Complain INT,
    Z_CostContact INT,
    Z_Revenue INT,
    Response INT
);

select * from customer_data

select id, education, income from customer_data

select id, year_birth, 2026 - year_birth as age from customer_data

select id, income, recency, response from customer_data

select id, mntwines, mntfruits, mntmeatproducts from customer_data

select id, numwebpurchases, numstorepurchases from customer_data

select distinct education from customer_data

select distinct marital_status from customer_data

--Where Clause 
select * from customer_data where education = 'Graduation'

select * from customer_data where marital_status = 'Single'

select * from customer_data where income > 50000

select * from customer_data where income between 30000 and 70000

select * from customer_data where kidhome = 0

select * from customer_data where teenhome > 0

select * from customer_data where recency < 30

SELECT * FROM customer_data WHERE Response = 1;

SELECT * FROM customer_data WHERE Complain = 1;

SELECT * FROM customer_data WHERE AcceptedCmp1 = 1;

--update queries
update customer_data set income = 0 where income is null

update customer_data set education ='Graduate' where education = 'Graduation'

update customer_data set marital_status = 'Single' where marital_status = 'Alone'

UPDATE customer_data
SET Response = 0
WHERE Response IS NULL;

UPDATE customer_data
SET MntWines = MntWines + 10
WHERE ID = 5524;

UPDATE customer_data
SET NumWebVisitsMonth = 0
WHERE NumWebVisitsMonth IS NULL;

select * from customer_data

--Alter Queries
ALTER TABLE customer_data
ADD COLUMN Age INT;

UPDATE customer_data
SET Age = 2026 - Year_Birth;

ALTER TABLE customer_data
ADD COLUMN Total_Spending INT

UPDATE customer_data
SET Total_Spending = MntWines + MntFruits + MntMeatProducts +
          MntFishProducts + MntSweetProducts + MntGoldProds;

ALTER TABLE customer_data
ADD COLUMN Total_Children INT;

UPDATE customer_data
SET Total_Children = Kidhome + Teenhome;

ALTER TABLE customer_data
RENAME COLUMN MntGoldProds TO MntGoldProducts;

ALTER TABLE customer_data
DROP COLUMN Age;

select * from customer_data

--Aggregate Function Queries
SELECT COUNT(*) AS total_customers
FROM customer_data;

SELECT AVG(Income) AS average_income
FROM customer_data;

SELECT MAX(Income) AS highest_income
FROM customer_data;

SELECT MIN(Income) AS lowest_income
FROM customer_data;

SELECT SUM(MntFruits) AS total_fruit_amount
FROM customer_data;

SELECT SUM(MntFruits) AS total_fruit_amount
FROM customer_data;

SELECT SUM(MntMeatProducts) AS total_meat_amount
FROM customer_data;

SELECT Education, COUNT(*) AS total_customers
FROM customer_data
GROUP BY Education;

SELECT Marital_Status, AVG(Income) AS avg_income
FROM customer_data
GROUP BY Marital_Status;

SELECT Response, COUNT(*) AS total_customers
FROM customer_data
GROUP BY Response;

--String Functions
SELECT UPPER(Education) AS education_upper
FROM customer_data;

SELECT LOWER(Marital_Status) AS marital_lower
FROM customer_data;

SELECT LENGTH(Education) AS education_length
FROM customer_data;

SELECT TRIM(Education) AS clean_education
FROM customer_data;

SELECT CONCAT(Education, ' - ', Marital_Status) AS customer_profile
FROM customer_data;

SELECT SUBSTRING(Education FROM 1 FOR 4) AS short_education
FROM customer_data;

SELECT REPLACE(Marital_Status, 'Single', 'Unmarried') AS updated_status
FROM customer_data;

--Number Functions
SELECT ROUND(Income, 0) AS rounded_income
FROM customer_data;

SELECT CEIL(Income) AS ceil_income
FROM customer_data;

SELECT FLOOR(Income) AS floor_income
FROM customer_data;

SELECT ABS(Income) AS absolute_income
FROM customer_data;

SELECT MOD(Year_Birth, 2) AS birth_year_mod
FROM customer_data;

SELECT POWER(NumWebPurchases, 2) AS web_purchase_square
FROM customer_data;

SELECT ROUND(Income / 12, 2) AS monthly_income
FROM customer_data;

--Like Pattern Queries
SELECT * FROM customer_data
WHERE Education LIKE 'G%';

SELECT * FROM customer_data
WHERE Education LIKE '%tion';

SELECT * FROM customer_data
WHERE Education LIKE '%Master%';

SELECT * FROM customer_data
WHERE Marital_Status LIKE 'S%';

SELECT * FROM customer_data
WHERE Marital_Status LIKE '%Together%';

SELECT * FROM customer_data
WHERE Education ILIKE '%phd%';

--order by queries
SELECT ID, Income
FROM customer_data
ORDER BY Income ASC;

SELECT ID, Income
FROM customer_data
ORDER BY Income DESC;

SELECT ID, Year_Birth
FROM customer_data
ORDER BY Year_Birth ASC;

SELECT ID, Recency
FROM customer_data
ORDER BY Recency DESC;

SELECT ID, MntWines
FROM customer_data
ORDER BY MntWines DESC;

SELECT ID, NumStorePurchases
FROM customer_data
ORDER BY NumStorePurchases DESC;

--Having Clause Queries
SELECT Education, COUNT(*) AS total_customers
FROM customer_data
GROUP BY Education
HAVING COUNT(*) > 100;

SELECT Marital_Status, AVG(Income) AS avg_income
FROM customer_data
GROUP BY Marital_Status
HAVING AVG(Income) > 50000;

SELECT Education, SUM(MntWines) AS total_wine_spending
FROM customer_data
GROUP BY Education
HAVING SUM(MntWines) > 10000;

SELECT Response, COUNT(*) AS total
FROM customer_data
GROUP BY Response
HAVING COUNT(*) > 500;

--Limit Queries
SELECT * FROM customer_data
LIMIT 5;

SELECT ID, Income
FROM customer_data
ORDER BY Income DESC
LIMIT 10;

SELECT ID, MntWines
FROM customer_data
ORDER BY MntWines DESC
LIMIT 10;

SELECT ID, Recency
FROM customer_data
ORDER BY Recency ASC
LIMIT 10;

--Order by with Functions
SELECT ID, Education
FROM customer_data
ORDER BY LENGTH(Education) DESC;

SELECT ID, Income
FROM customer_data
ORDER BY ROUND(Income, 0) DESC;

SELECT ID, Year_Birth, 2026 - Year_Birth AS Age
FROM customer_data
ORDER BY Age DESC;

SELECT 
    ID,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
FROM customer_data
ORDER BY total_spending DESC;

select * from customer_data

--SubQueries
SELECT *
FROM customer_data
WHERE Income > (
    SELECT AVG(Income)
    FROM customer_data
);

SELECT *
FROM customer_data
WHERE Income = (
    SELECT MAX(Income)
    FROM customer_data
);

SELECT *
FROM customer_data
WHERE MntWines > (
    SELECT AVG(MntWines)
    FROM customer_data
);

SELECT *
FROM customer_data
WHERE Recency < (
    SELECT AVG(Recency)
    FROM customer_data
);

SELECT *
FROM customer_data
WHERE Education IN (
    SELECT Education
    FROM customer_data
    GROUP BY Education
    HAVING COUNT(*) > 100
);

--View Queries
CREATE VIEW customer_basic_view AS
SELECT ID, Education, Marital_Status, Income
FROM customer_data;

SELECT * FROM customer_basic_view;

CREATE VIEW customer_spending_view AS
SELECT 
    ID,
    Income,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
FROM customer_data;

SELECT * FROM customer_spending_view;

CREATE VIEW campaign_response_view AS
SELECT ID, Education, Marital_Status, Response
FROM customer_data
WHERE Response = 1;

DROP VIEW campaign_response_view;

--Indexing Queries
CREATE INDEX idx_customer_income
ON customer_data(Income);

CREATE INDEX idx_customer_education
ON customer_data(Education);

CREATE INDEX idx_customer_marital_status
ON customer_data(Marital_Status);

CREATE INDEX idx_customer_response
ON customer_data(Response);

CREATE INDEX idx_customer_recency
ON customer_data(Recency);

DROP INDEX idx_customer_income;

----Delete, Drop, Truncate Queries
DELETE FROM customer_data
WHERE Income IS NULL;

DELETE FROM customer_data
WHERE Complain = 1;

DELETE FROM customer_data
WHERE Response = 0;

TRUNCATE TABLE customer_data;

DROP TABLE customer_data;

--Windows Functions
SELECT 
    ID,
    Income,
    RANK() OVER (ORDER BY Income DESC) AS income_rank
FROM customer_data;

SELECT 
    ID,
    Income,
    DENSE_RANK() OVER (ORDER BY Income DESC) AS dense_income_rank
FROM customer_data;

SELECT 
    ID,
    Education,
    Income,
    RANK() OVER (PARTITION BY Education ORDER BY Income DESC) AS rank_by_education
FROM customer_data;

SELECT 
    ID,
    Marital_Status,
    Income,
    AVG(Income) OVER (PARTITION BY Marital_Status) AS avg_income_by_status
FROM customer_data;

SELECT 
    ID,
    Education,
    MntWines,
    SUM(MntWines) OVER (PARTITION BY Education) AS total_wine_by_education
FROM customer_data;

SELECT 
    ID,
    Income,
    LAG(Income) OVER (ORDER BY Income) AS previous_income
FROM customer_data;

SELECT 
    ID,
    Income,
    LEAD(Income) OVER (ORDER BY Income) AS next_income
FROM customer_data;

SELECT 
    ID,
    Income,
    NTILE(4) OVER (ORDER BY Income DESC) AS income_quartile
FROM customer_data;

--Practies Queries on Each Imp Column
SELECT * FROM customer_data WHERE ID = 5524;

SELECT * FROM customer_data WHERE Year_Birth < 1970;

SELECT * FROM customer_data WHERE Education = 'Master';

SELECT * FROM customer_data WHERE Marital_Status = 'Married';

SELECT * FROM customer_data WHERE Income >= 60000;

SELECT * FROM customer_data WHERE Kidhome = 1;

SELECT * FROM customer_data WHERE Teenhome = 1;

SELECT * FROM customer_data WHERE Recency <= 20;

SELECT * FROM customer_data WHERE MntWines > 300;

SELECT * FROM customer_data WHERE MntFruits > 50;

SELECT * FROM customer_data WHERE MntMeatProducts > 200;

SELECT * FROM customer_data WHERE MntFishProducts > 100;

SELECT * FROM customer_data WHERE MntSweetProducts > 50;

SELECT * FROM customer_data WHERE MntGoldProducts > 100;

SELECT * FROM customer_data WHERE NumDealsPurchases > 2;

SELECT * FROM customer_data WHERE NumWebPurchases > 5;

SELECT * FROM customer_data WHERE NumCatalogPurchases > 5;

SELECT * FROM customer_data WHERE NumStorePurchases > 5;

SELECT * FROM customer_data WHERE NumWebVisitsMonth > 7;

SELECT * FROM customer_data WHERE AcceptedCmp1 = 1;

SELECT * FROM customer_data WHERE AcceptedCmp2 = 1;

SELECT * FROM customer_data WHERE AcceptedCmp3 = 1;

SELECT * FROM customer_data WHERE AcceptedCmp4 = 1;

SELECT * FROM customer_data WHERE AcceptedCmp5 = 1;

SELECT * FROM customer_data WHERE Complain = 1;

SELECT * FROM customer_data WHERE Response = 1;

--Advanced level Queries

--1. Total Spending Column Using CTE
WITH customer_spending AS (
    SELECT 
        ID,
        Income,
        Education,
        Marital_Status,
        Recency,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT *
FROM customer_spending
ORDER BY total_spending DESC;

--2. Top 10 High Value Customers
WITH spending AS (
    SELECT 
        ID,
        Income,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT *
FROM spending
WHERE Income > 50000
ORDER BY total_spending DESC
LIMIT 10;

--3. Customer Segmentation
SELECT
    ID,
    Income,
    Recency,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
    CASE
        WHEN Recency <= 30 AND 
             MntWines + MntFruits + MntMeatProducts +
             MntFishProducts + MntSweetProducts + MntGoldProducts >= 1000
        THEN 'High Value Active Customer'

        WHEN Recency > 60 AND 
             MntWines + MntFruits + MntMeatProducts +
             MntFishProducts + MntSweetProducts + MntGoldProducts >= 1000
        THEN 'High Value Inactive Customer'

        WHEN Recency <= 30 THEN 'Active Customer'
        ELSE 'Low Value Customer'
    END AS customer_segment
FROM customer_data;

--4. RFM Analysis
WITH rfm AS (
    SELECT
        ID,
        Recency,
        NumWebPurchases + NumCatalogPurchases + NumStorePurchases AS frequency,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS monetary
    FROM customer_data
)
SELECT
    ID,
    Recency,
    frequency,
    monetary,
    NTILE(5) OVER (ORDER BY Recency ASC) AS recency_score,
    NTILE(5) OVER (ORDER BY frequency DESC) AS frequency_score,
    NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score
FROM rfm;

--5. Best Customers Using RFM Score
WITH rfm AS (
    SELECT
        ID,
        Recency,
        NumWebPurchases + NumCatalogPurchases + NumStorePurchases AS frequency,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS monetary
    FROM customer_data
),
rfm_score AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY Recency ASC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS m_score
    FROM rfm
)
SELECT
    ID,
    Recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    r_score + f_score + m_score AS total_rfm_score
FROM rfm_score
ORDER BY total_rfm_score DESC;

--6. Rank Customers by Income
SELECT
    ID,
    Income,
    RANK() OVER (ORDER BY Income DESC) AS income_rank
FROM customer_data
WHERE Income IS NOT NULL;

--7. Rank Customers by Spending Within Education
SELECT
    ID,
    Education,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
    RANK() OVER (
        PARTITION BY Education
        ORDER BY MntWines + MntFruits + MntMeatProducts +
                 MntFishProducts + MntSweetProducts + MntGoldProducts DESC
    ) AS spending_rank
FROM customer_data;

--8. Top 3 Spending Customers From Each Education
WITH ranked_customers AS (
    SELECT
        ID,
        Education,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
        RANK() OVER (
            PARTITION BY Education
            ORDER BY MntWines + MntFruits + MntMeatProducts +
                     MntFishProducts + MntSweetProducts + MntGoldProducts DESC
        ) AS rank_no
    FROM customer_data
)
SELECT *
FROM ranked_customers
WHERE rank_no <= 3;

--9. Campaign Acceptance Count Per Customer
SELECT
    ID,
    AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 +
    AcceptedCmp4 + AcceptedCmp5 + Response AS total_campaigns_accepted
FROM customer_data
ORDER BY total_campaigns_accepted DESC;

--10. Customers Who Accepted Multiple Campaigns
SELECT
    ID,
    AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 +
    AcceptedCmp4 + AcceptedCmp5 + Response AS total_campaigns_accepted
FROM customer_data
WHERE AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 +
      AcceptedCmp4 + AcceptedCmp5 + Response >= 2
ORDER BY total_campaigns_accepted DESC;

--11. Campaign Response Rate by Education
SELECT
    Education,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM customer_data
GROUP BY Education
ORDER BY response_rate DESC;

--12. Campaign Response Rate by Marital Status
SELECT
    Marital_Status,
    COUNT(*) AS total_customers,
    SUM(Response) AS responders,
    ROUND(SUM(Response) * 100.0 / COUNT(*), 2) AS response_rate
FROM customer_data
GROUP BY Marital_Status
ORDER BY response_rate DESC;

--13. Average Spending by Education
SELECT
    Education,
    ROUND(AVG(
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts
    ), 2) AS avg_spending
FROM customer_data
GROUP BY Education
ORDER BY avg_spending DESC;

--14. Product Category Sales Percentage
WITH sales AS (
    SELECT
        SUM(MntWines) AS wine_sales,
        SUM(MntFruits) AS fruit_sales,
        SUM(MntMeatProducts) AS meat_sales,
        SUM(MntFishProducts) AS fish_sales,
        SUM(MntSweetProducts) AS sweet_sales,
        SUM(MntGoldProducts) AS gold_sales
    FROM customer_data
)
SELECT
    ROUND(wine_sales * 100.0 / 
        (wine_sales + fruit_sales + meat_sales + fish_sales + sweet_sales + gold_sales), 2
    ) AS wine_percentage,

    ROUND(meat_sales * 100.0 / 
        (wine_sales + fruit_sales + meat_sales + fish_sales + sweet_sales + gold_sales), 2
    ) AS meat_percentage,

    ROUND(gold_sales * 100.0 / 
        (wine_sales + fruit_sales + meat_sales + fish_sales + sweet_sales + gold_sales), 2
    ) AS gold_percentage
FROM sales;

--15. Most Preferred Product Per Customer
SELECT
    ID,
    GREATEST(
        MntWines,
        MntFruits,
        MntMeatProducts,
        MntFishProducts,
        MntSweetProducts,
        MntGoldProducts
    ) AS highest_product_spending,
    CASE
        WHEN MntWines = GREATEST(MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProducts)
        THEN 'Wines'
        WHEN MntFruits = GREATEST(MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProducts)
        THEN 'Fruits'
        WHEN MntMeatProducts = GREATEST(MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProducts)
        THEN 'Meat'
        WHEN MntFishProducts = GREATEST(MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProducts)
        THEN 'Fish'
        WHEN MntSweetProducts = GREATEST(MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProducts)
        THEN 'Sweet'
        ELSE 'Gold'
    END AS favorite_product
FROM customer_data;

--16. Web vs Store Purchase Preference
SELECT
    ID,
    NumWebPurchases,
    NumStorePurchases,
    CASE
        WHEN NumWebPurchases > NumStorePurchases THEN 'Web Preferred'
        WHEN NumStorePurchases > NumWebPurchases THEN 'Store Preferred'
        ELSE 'Equal Preference'
    END AS purchase_preference
FROM customer_data;

--17. Customer Purchase Channel Summary
SELECT
    ID,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebPurchases + NumCatalogPurchases + NumStorePurchases AS total_purchases,
    CASE
        WHEN NumWebPurchases >= NumCatalogPurchases 
         AND NumWebPurchases >= NumStorePurchases THEN 'Web'
        WHEN NumCatalogPurchases >= NumWebPurchases 
         AND NumCatalogPurchases >= NumStorePurchases THEN 'Catalog'
        ELSE 'Store'
    END AS main_purchase_channel
FROM customer_data;

--18. High Income but Low Spending Customers
WITH spending AS (
    SELECT
        ID,
        Income,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT *
FROM spending
WHERE Income > 70000
  AND total_spending < 500
ORDER BY Income DESC;

--19. Low Income but High Spending Customers
WITH spending AS (
    SELECT
        ID,
        Income,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT *
FROM spending
WHERE Income < 40000
  AND total_spending > 700
ORDER BY total_spending DESC;

--20. Customers Above Average Income and Spending
WITH spending AS (
    SELECT
        ID,
        Income,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT *
FROM spending
WHERE Income > (SELECT AVG(Income) FROM customer_data)
  AND total_spending > (SELECT AVG(
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts
      ) FROM customer_data);
	  
--21. Running Total of Spending
SELECT
    ID,
    Income,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
    SUM(
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts
    ) OVER (ORDER BY Income) AS running_total_spending
FROM customer_data
WHERE Income IS NOT NULL;

--22. Moving Average Income
SELECT
    ID,
    Income,
    AVG(Income) OVER (
        ORDER BY Income
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_income
FROM customer_data
WHERE Income IS NOT NULL;

--23. Customers Higher Than Education Average Income
SELECT
    ID,
    Education,
    Income,
    AVG(Income) OVER (PARTITION BY Education) AS avg_income_by_education
FROM customer_data
WHERE Income IS NOT NULL;

--Advanced filter:

WITH education_avg AS (
    SELECT
        ID,
        Education,
        Income,
        AVG(Income) OVER (PARTITION BY Education) AS avg_income_by_education
    FROM customer_data
    WHERE Income IS NOT NULL
)
SELECT *
FROM education_avg
WHERE Income > avg_income_by_education;

--24. Spending Rank by Marital Status
WITH spending AS (
    SELECT
        ID,
        Marital_Status,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending
    FROM customer_data
)
SELECT
    *,
    DENSE_RANK() OVER (
        PARTITION BY Marital_Status
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM spending;

--25. Duplicate Check
SELECT
    ID,
    COUNT(*) AS duplicate_count
FROM customer_data
GROUP BY ID
HAVING COUNT(*) > 1;

--26. Data Quality Check
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE Income IS NULL) AS missing_income,
    COUNT(*) FILTER (WHERE Education IS NULL) AS missing_education,
    COUNT(*) FILTER (WHERE Marital_Status IS NULL) AS missing_marital_status,
    COUNT(*) FILTER (WHERE Year_Birth IS NULL) AS missing_birth_year
FROM customer_data;

--27. Outlier Income Customers
WITH income_stats AS (
    SELECT
        AVG(Income) AS avg_income,
        STDDEV(Income) AS std_income
    FROM customer_data
    WHERE Income IS NOT NULL
)
SELECT c.*
FROM customer_data c
CROSS JOIN income_stats s
WHERE c.Income > s.avg_income + 3 * s.std_income
   OR c.Income < s.avg_income - 3 * s.std_income;

--28. Age Group Analysis
SELECT
    CASE
        WHEN 2026 - Year_Birth BETWEEN 18 AND 30 THEN '18-30'
        WHEN 2026 - Year_Birth BETWEEN 31 AND 45 THEN '31-45'
        WHEN 2026 - Year_Birth BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts
    ), 2) AS avg_spending
FROM customer_data
GROUP BY age_group
ORDER BY avg_spending DESC;

--29. Campaign Performance Comparison
SELECT
    SUM(AcceptedCmp1) AS campaign_1_accepts,
    SUM(AcceptedCmp2) AS campaign_2_accepts,
    SUM(AcceptedCmp3) AS campaign_3_accepts,
    SUM(AcceptedCmp4) AS campaign_4_accepts,
    SUM(AcceptedCmp5) AS campaign_5_accepts,
    SUM(Response) AS latest_campaign_accepts
FROM customer_data;

--30. Most Successful Campaign
WITH campaign_summary AS (
    SELECT 'Campaign 1' AS campaign_name, SUM(AcceptedCmp1) AS total_accepts FROM customer_data
    UNION ALL
    SELECT 'Campaign 2', SUM(AcceptedCmp2) FROM customer_data
    UNION ALL
    SELECT 'Campaign 3', SUM(AcceptedCmp3) FROM customer_data
    UNION ALL
    SELECT 'Campaign 4', SUM(AcceptedCmp4) FROM customer_data
    UNION ALL
    SELECT 'Campaign 5', SUM(AcceptedCmp5) FROM customer_data
    UNION ALL
    SELECT 'Latest Campaign', SUM(Response) FROM customer_data
)
SELECT *
FROM campaign_summary
ORDER BY total_accepts DESC;

--31. Create Advanced Customer View
CREATE VIEW customer_advanced_view AS
SELECT
    ID,
    Education,
    Marital_Status,
    Income,
    2026 - Year_Birth AS Age,
    Kidhome + Teenhome AS total_children,
    MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
    NumWebPurchases + NumCatalogPurchases + NumStorePurchases AS total_purchases,
    AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 +
    AcceptedCmp4 + AcceptedCmp5 + Response AS total_campaigns_accepted
FROM customer_data;
SELECT *
FROM customer_advanced_view
ORDER BY total_spending DESC;

--32. Indexes for Industry Performance
CREATE INDEX idx_customer_income 
ON customer_data(Income);
CREATE INDEX idx_customer_education 
ON customer_data(Education);
CREATE INDEX idx_customer_response 
ON customer_data(Response);
CREATE INDEX idx_customer_recency 
ON customer_data(Recency);
CREATE INDEX idx_customer_education_income 
ON customer_data(Education, Income);

--33. Query Plan Check
EXPLAIN ANALYZE
SELECT *
FROM customer_data
WHERE Income > 60000
ORDER BY Income DESC;

--34. Advanced Final Business Query
WITH customer_summary AS (
    SELECT
        ID,
        Education,
        Marital_Status,
        Income,
        Recency,
        2026 - Year_Birth AS Age,
        Kidhome + Teenhome AS total_children,
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProducts AS total_spending,
        NumWebPurchases + NumCatalogPurchases + NumStorePurchases AS total_purchases,
        AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 +
        AcceptedCmp4 + AcceptedCmp5 + Response AS total_campaigns_accepted
    FROM customer_data
),
ranked_customers AS (
    SELECT
        *,
        RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
    FROM customer_summary
)
SELECT
    *,
    CASE
        WHEN spending_rank <= 100 AND Recency <= 30 THEN 'Premium Active Customer'
        WHEN spending_rank <= 100 AND Recency > 30 THEN 'Premium Inactive Customer'
        WHEN total_campaigns_accepted >= 2 THEN 'Campaign Interested Customer'
        WHEN total_purchases >= 10 THEN 'Frequent Buyer'
        ELSE 'Normal Customer'
    END AS final_customer_segment
FROM ranked_customers
ORDER BY spending_rank;