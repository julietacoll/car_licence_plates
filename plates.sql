USE car_licence_plates;

-- Years where sales of imported cars were lower than sales of domestic cars

SELECT 
		YEAR(Date) as Date,
		SUM(Total_Sales) as Total_Sales, 
		SUM(Imported) as Imported ,
		SUM(Domestic) as Domestic
FROM dbo.car_licence_plates
GROUP BY YEAR(Date)
HAVING SUM(Imported)<SUM(Domestic)
;

-- Month where sales of imported cars were lower than sales of domestic cars, to see if there is any seasonality

SELECT 
		MONTH(Date) as Date,
		SUM(Total_Sales) as Total_Sales, 
		SUM(Imported) as Imported ,
		SUM(Domestic) as Domestic
FROM dbo.car_licence_plates
GROUP BY MONTH(Date)
HAVING SUM(Imported)<SUM(Domestic);

-- Top 5 years with more total sales

SELECT TOP 5
		YEAR(Date) as Date,
		SUM(Total_Sales) as Total_Sales, 
		SUM(Imported) as Imported ,
		SUM(Domestic) as Domestic
FROM dbo.car_licence_plates
GROUP BY YEAR(Date)
ORDER BY Total_Sales DESC;

-- Show disaggregated information of the categories of cars sold, when available

SELECT
		YEAR(Date) as Date, 
		SUM(Cars) as Cars, 
		SUM(Commercial_Heavy) as Commercial_Heavy, 
		SUM(Commercial_Light) as Commercial_Light, 
		SUM(Other_Heavy) as Other_Heavy, 
		SUM(Total_Sales) as Total_Sales
FROM dbo.car_licence_plates
WHERE Cars IS NOT NULL
GROUP BY YEAR(Date)
ORDER BY Total_Sales DESC; 

