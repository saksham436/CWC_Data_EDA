SELECT 
    *
FROM
    virat_kohli
ORDER BY Number ASC;

-- Number of double centuries in Test
SELECT 
    COUNT(*) AS double_century_count
FROM
    virat_kohli
WHERE
    Score > 200;

-- Centuries at each position
SELECT 
    Position, COUNT(*) AS Centuries_at_each_position
FROM
    virat_kohli
GROUP BY Position
ORDER BY Position ASC;
-- Centuries in each format 
SELECT 
    Format, COUNT(*) AS Centuries_in_each_format
FROM
    virat_kohli
GROUP BY Format;

-- Centuries for each opposition

SELECT 
    Against, COUNT(*) AS Centuries_against_each_opposition
FROM
    virat_kohli
GROUP BY Against
ORDER BY Centuries_against_each_opposition;
 
 -- Century in each country 
SELECT 
    `Host Nation`, COUNT(*) AS Century_in_each_country
FROM
    virat_kohli
GROUP BY `Host Nation`
ORDER BY Century_in_each_country;
 
-- Century at each venue in India 
SELECT 
    Venue, COUNT(*) AS Century_at_each_Venue_In_India
FROM
    virat_kohli
WHERE
    `Host Nation` = 'India'
GROUP BY Venue
ORDER BY Century_at_each_venue_in_India;
 
-- Highest score in Odi's
SELECT 
    MAX(SCORE) AS Highest_Score_in_ODI
FROM
    virat_kohli
WHERE
    Format = 'ODI';

-- Highest Score in Tests
SELECT 
    MAX(Score) AS Highest_Score_in_Tests
FROM
    virat_kohli
WHERE
    Format = 'Test';

-- Highest Score in T20i's
SELECT 
    MAX(Score) AS Highest_Score_in_T20is
FROM
    virat_kohli
WHERE
    Format = 'T20i';

-- Centuries for a winning cause
SELECT 
    COUNT(*) AS Centuries_for_winning_cause
FROM
    virat_kohli
WHERE
    Win = 'Yes';
-- In ODI's
SELECT 
    COUNT(*) AS Centuries_for_winning_cause_in_ODI
FROM
    virat_kohli
WHERE
    Win = 'Yes' AND Format = 'ODI';

-- In Tests
SELECT 
    COUNT(*) AS Centuies_for_winning_cause_in_Tests
FROM
    virat_kohli
WHERE
    Win = 'Yes' AND Format = 'Test';

-- In T20is
SELECT 
    COUNT(*) AS Centuies_for_winning_cause_in_Tests
FROM
    virat_kohli
WHERE
    Win = 'Yes' AND Format = 'T20i';

-- Centuries for a winning cause while chasing 
-- In Odi
SELECT 
    COUNT(*) AS Centuies_for_winning_cause_in_Tests
FROM
    virat_kohli
WHERE
    Win = 'Yes' AND Format = 'ODI'
        AND Inning = 2;
 
-- Centuries scored between year 2016 to 2019

SELECT 
    COUNT(*) AS Centuries_between_2016to2019
FROM
    virat_kohli
WHERE
    Year BETWEEN 2016 AND 2019;

--  Centuries scored between year 2016 to 2019 in ODI , Test
SELECT 
    Format, COUNT(*) AS Centuries_between_2016to2019
FROM
    virat_kohli
WHERE
    Year BETWEEN 2016 AND 2019
GROUP BY Format;

-- Count of the MOTM Awards when scored a century in each format

SELECT 
    Format, COUNT(*) AS motmawards_for_centuries
FROM
    virat_kohli
WHERE
    MOTM = 'YES'
GROUP BY Format;

-- Max number of centuries in a year
SELECT 
    Year, COUNT(*) AS number_of_centuries
FROM
    virat_kohli
GROUP BY Year
ORDER BY number_of_centuries DESC
LIMIT 1;

--  Average Balls taken to complete the century in ODI
SELECT 
    ROUND(AVG(Balls)) AS avg_balls_taken
FROM
    virat_kohli
WHERE
    format = 'ODI';

-- Average strike rate when century scored in ODI
SELECT 
    ROUND(AVG(`Strike Rate`)) AS avg_strike_rate
FROM
    virat_kohli
WHERE
    format = 'ODI';

-- How many times out and not out in ODI
SELECT 
    `Not Out`, COUNT(*) AS Count
FROM
    virat_kohli
WHERE
    Format = 'ODI'
GROUP BY `Not Out`;

--  How many times out and not out in Test
SELECT 
    `Not Out`, COUNT(*) AS Count
FROM
    virat_kohli
WHERE
    Format = 'Test'
GROUP BY `Not Out`;
-- To combine above two resuts
SELECT 
    `Not Out`,
    SUM(CASE
        WHEN Format = 'ODI' THEN 1
        ELSE 0
    END) AS ODI,
    SUM(CASE
        WHEN Format = 'Test' THEN 1
        ELSE 0
    END) AS Test,
    SUM(CASE
        WHEN Format = 'T20i' THEN 1
        ELSE 0
    END) AS T20i
FROM
    virat_kohli
GROUP BY `Not Out`;

-- Highest score after a century at each venue

SELECT 
    Venue,
    IFNULL(MAX(CASE
                WHEN Format = 'ODI' THEN Score
            END),
            'NA') AS ODI,
    IFNULL(MAX(CASE
                WHEN Format = 'Test' THEN Score
            END),
            'NA') AS Test,
    IFNULL(MAX(CASE
                WHEN Format = 'T20i' THEN Score
            END),
            'NA') AS T20i
FROM
    virat_kohli
GROUP BY Venue
ORDER BY Venue;

-- Centuries in each type of series
SELECT 
    Series, COUNT(*)
FROM
    virat_kohli
WHERE
    Format = 'ODI'
GROUP BY Series;

-- Third highest score in world cup

SELECT DISTINCT
    Score
FROM
    virat_kohli
WHERE
    Series = 'World Cup'
ORDER BY Score
LIMIT 1 OFFSET 2;


 