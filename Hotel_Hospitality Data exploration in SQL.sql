
-- Unifying three datasets: 2018,2019 and 2020--
-- And created a Temp table named hotels--

WITH hotels AS
(
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])


--Looking at data required to calculate the revenue in each year---

SELECT arrival_date_year,stays_in_week_nights,stays_in_weekend_nights,adr 
FROM hotels;



--Looking at the yearly Revenue---

SELECT arrival_date_year, ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr),2) AS Revenue
FROM hotels
GROUP BY arrival_date_year;



--Looking at the yearly Revenue based on the hotel type---

SELECT hotel,arrival_date_year, ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr),2) AS Revenue
FROM hotels
GROUP BY arrival_date_year, hotel;



-- Looking at the daily rate, market segment and the discounted rate--

SELECT ho.adr,ho.market_segment,ms.Discount,ho.adr*(1-ms.Discount) AS Discount_rate FROM hotels ho
JOIN dbo.market_segment$ ms
ON ho.market_segment = ms.market_segment;



-- Looking at the daily rate, market segment and the discounted Revenue--

SELECT ho.arrival_date_year,ms.market_segment,ho.adr,
(ho.stays_in_week_nights+ho.stays_in_weekend_nights)*(ho.adr*(1-ms.Discount)) AS Discounted_revenue
FROM hotels ho
JOIN dbo.market_segment$ ms
ON ho.market_segment = ms.market_segment


















