-- 1. Select all columns for all brands in the Brands table.
SELECT * FROM Brands;

-- 2. Select all columns for all car models made by Pontiac in the Models table.
SELECT * FROM Models WHERE brand_name = "Pontiac";

-- 3. Select the brand name and model 
--    name for all models made in 1964 from the Models table.
SELECT brand_name, name FROM Models WHERE year = "1964";

-- 4. Select the model name, brand name, and headquarters for the Ford Mustang 
--    from the Models and Brands tables.
SELECT brand_name, headquarters, brands.name FROM Models CROSS JOIN Brands;

-- 5. Select all rows for the three oldest brands 
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).
SELECT * FROM Brands ORDER BY founded LIMIT 3;

-- 6. Count the Ford models in the database (output should be a **number**).
SELECT COUNT(*) FROM Models WHERE brand_name = "Ford";

-- 7. Select the **name** of any and all car brands that are not discontinued.
SELECT name FROM BRANDS WHERE discontinued IS NULL;

-- 8. Select rows 15-25 of the DB in alphabetical order by model name.
SELECT * FROM Models ORDER BY name LIMIT 10 OFFSET 15;

-- 9. Select the **brand, name, and year the model's brand was 
--    founded** for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be ``null`` if 
--    the brand is not in the Brands table.)
SELECT brand_name, Models.name, Brands.founded FROM Models LEFT JOIN Brands ON Models.brand_name = Brands.name 
WHERE year = "1960";



-- Part 2: Change the following queries according to the specifications. 
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all **brands** that are not discontinued
-- regardless of whether they have any cars in the cars table.
-- before:
    -- SELECT b.name,
    --        b.founded,
    --        m.name
    -- FROM Model AS m
    --   LEFT JOIN brands AS b
    --     ON b.name = m.brand_name
    -- WHERE b.discontinued IS NULL;

SELECT b.name, b.founded, m.brand_name, m.name FROM Models AS m LEFT JOIN brands AS b ON b.name = m.brand_name 
WHERE b.discontinued IS NULL;

Ford|1903|Ford|Model T
Chrysler|1925|Chrysler|Imperial
Citroën|1919|Citroën|2CV
Chevrolet|1911|Chevrolet|Corvette
Chevrolet|1911|Chevrolet|Corvette
Cadillac|1902|Cadillac|Fleetwood
Chevrolet|1911|Chevrolet|Corvette
Ford|1903|Ford|Thunderbird
Chevrolet|1911|Chevrolet|Corvette
Chevrolet|1911|Chevrolet|Corvette
BMW|1916|BMW|600
Chevrolet|1911|Chevrolet|Corvette
BMW|1916|BMW|600
Ford|1903|Ford|Thunderbird
Chevrolet|1911|Chevrolet|Corvette
BMW|1916|BMW|600
Chevrolet|1911|Chevrolet|Corvair
Chevrolet|1911|Chevrolet|Corvette
||Fillmore|Fillmore
Chevrolet|1911|Chevrolet|Corvette
Chevrolet|1911|Chevrolet|Corvette
Buick|1903|Buick|Special
Ford|1903|Ford|E-Series
Chevrolet|1911|Chevrolet|Corvair 500
Chevrolet|1911|Chevrolet|Corvette
Chevrolet|1911|Chevrolet|Corvette
Ford|1903|Ford|Mustang
Ford|1903|Ford|Galaxie


-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before: 
    -- SELECT m.name,
    --        m.brand_name,
    --        b.founded
    -- FROM Brands AS b
    --   LEFT JOIN Models AS m
    --     ON b.name = m.brand_name;

SELECT m.name, m.brand_name, b.founded FROM Brands AS b LEFT JOIN Models AS m ON b.name = m.brand_name;

E-Series|Ford|1903
Galaxie|Ford|1903
Model T|Ford|1903
Mustang|Ford|1903
Thunderbird|Ford|1903
Thunderbird|Ford|1903
Imperial|Chrysler|1925
2CV|Citroën|1919
Minx Magnificent|Hillman|1907
Corvair|Chevrolet|1911
Corvair 500|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Corvette|Chevrolet|1911
Fleetwood|Cadillac|1902
600|BMW|1916
600|BMW|1916
600|BMW|1916
Mini|Austin|1905
Mini|Austin|1905
Mini Cooper|Austin|1905
Mini Cooper|Austin|1905
Mini Cooper S|Austin|1905
Rockette|Fairthorpe|1954
Avanti|Studebaker|1852
Avanti|Studebaker|1852
Avanti|Studebaker|1852
Avanti|Studebaker|1852
Bonneville|Pontiac|1926
GTO|Pontiac|1926
Grand Prix|Pontiac|1926
Grand Prix|Pontiac|1926
Grand Prix|Pontiac|1926
LeMans|Pontiac|1926
Tempest|Pontiac|1926
Special|Buick|1903
Classic|Rambler|1901
Fury|Plymouth|1928
||2003


-- followup question: In your own words, describe the difference between 
-- left joins and inner joins.

-- INNER JOIN returns only the matching rows between the tables involved in the JOIN. 
-- LEFT JOIN returns all rows from left table including non-matching rows.


-- 3. Modify the query so that it only selects brands that don't have any car models in the cars table. 
-- (Hint: it should only show Tesla's row.)
-- before: 
    -- SELECT name,
    --        founded
    -- FROM Brands
    --   LEFT JOIN Models
    --     ON brands.name = Models.brand_name
    -- WHERE Models.year > 1940;

SELECT Brands.name, founded FROM Brands LEFT JOIN Models ON brands.name = Models.brand_name 
WHERE Models.name IS NULL;

Tesla|2003

-- 4. Modify the query to add another column to the results to show 
-- the number of years from the year of the model *until* the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before: 
    -- SELECT b.name,
    --        m.name,
    --        m.year,
    --        b.discontinued
    -- FROM Models AS m
    --   LEFT JOIN brands AS b
    --     ON m.brand_name = b.name
    -- WHERE b.discontinued NOT NULL;

SELECT b.name, m.name, m.year, b.discontinued , b.discontinued - m.year AS DD FROM Models AS m 
LEFT JOIN brands AS b ON m.brand_name = b.name WHERE b.discontinued NOT NULL;

Hillman|Minx Magnificent|1950|1981|31
Austin|Mini|1959|1987|28
Fairthorpe|Rockette|1960|1976|16
Austin|Mini Cooper|1961|1987|26
Studebaker|Avanti|1961|1967|6
Pontiac|Tempest|1961|2010|49
Pontiac|Grand Prix|1962|2010|48
Studebaker|Avanti|1962|1967|5
Austin|Mini|1963|1987|24
Austin|Mini Cooper S|1963|1987|24
Rambler|Classic|1963|1969|6
Studebaker|Avanti|1963|1967|4
Pontiac|Grand Prix|1963|2010|47
Pontiac|GTO|1964|2010|46
Pontiac|LeMans|1964|2010|46
Pontiac|Bonneville|1964|2010|46
Pontiac|Grand Prix|1964|2010|46
Plymouth|Fury|1964|2001|37
Studebaker|Avanti|1964|1967|3
Austin|Mini Cooper|1964|1987|23


-- Part 3: Futher Study

-- 1. Select the **name** of any brand with more than 5 models in the database.

-- 2. Add the following rows to the Models table.

-- year    name       brand_name
-- ----    ----       ----------
-- 2015    Chevrolet  Malibu
-- 2015    Subaru     Outback

-- 3. Write a SQL statement to crate a table called ``Awards`` 
--    with columns ``name``, ``year``, and ``winner``. Choose 
--    an appropriate datatype and nullability for each column.

-- 4. Write a SQL statement that adds the following rows to the Awards table:

--   name                 year      winner_model_id
--   ----                 ----      ---------------
--   IIHS Safety Award    2015      # get the ``id`` of the 2015 Chevrolet Malibu
--   IIHS Safety Award    2015      # get the ``id`` of the 2015 Subaru Outback

-- 5. Using a subquery, select only the *name* of any model whose 
-- year is the same year that *any* brand was founded.





