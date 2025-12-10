-- Netflix Project

DROP TABLE IF EXISTS Netflix

CREATE TABLE Netflix
(
	show_id VARCHAR(6),
	type VARCHAR(10),	
	title VARCHAR(150),
	director VARCHAR(208),
	casts VARCHAR(1000),	
	country VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,
	rating VARCHAR(10),
	duration VARCHAR(15),
	listed_in VARCHAR(100),	
	description VARCHAR(250)
);

SELECT * FROM Netflix;

SELECT
COUNT(*) AS total_content
FROM Netflix;

SELECT
	DISTINCT type
FROM Netflix;

-- 15 Business Problems
-- 1. Counting the number of movies vs tv shows

SELECT Type, COUNT(show_id) AS total_content
FROM Netflix
GROUP BY Type;

--2. Finding the most common rating for movies and TV Shows

SELECT
	type,
	rating,
	COUNT(*)
	RANK () OVER(PARTITION BY type ORDER BY COUNT(*)) AS ranking
FROM Netflix
GROUP BY 1, 2
ORDER BY 1, 3 DESC


-- 3. Listing all movies released in a year 2020

SELECT *
FROM Netflix
WHERE 
	type = 'Movie'
	AND
	release_year = 2020;

--4. Finding the top 5 countries with the most content on netflix

SELECT
	 UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country,
	COUNT(show_id) AS total_content
FROM Netflix
GROUP BY 1
ORDER BY 2 DESC

--5. Identifying the longest movie

SELECT *
FROM Netflix
WHERE 
	type = 'Movie'
	AND
	duration = (SELECT MAX(duration) FROM Netflix)

--6. Finding those content added in last 5 years

SELECT *
FROM Netflix
WHERE
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 Years';


--7. Finding all the movies/tv shows by director 'Rajiv Chilka'

SELECT * 
FROM Netflix
WHERE director ILIKE '%Rajiv Chilaka%'

--8. Listing all the TV shows with more than 5 seasons.

SELECT
	*
FROM Netflix
WHERE
	type = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::numeric > 5


--9. Counting the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(show_id) as total_content
FROM Netflix
GROUP BY 1


--10. Finding each year and the average numbers of content release in USA on Netflix and
--returning the top 5 year with highet avg content release.

SELECT
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) as year,
	COUNT(*) as yeraly_content,
	ROUND(
	COUNT(*)::numeric/(SELECT COUNT(*) FROM Netflix WHERE Country = 'United States')::numeric * 100,2) as avg_content_per_year
FROM Netflix
WHERE Country= 'United States'
GROUP BY 1


--11. listing all the movies that are documentaries

SELECT *
FROM Netflix
WHERE listed_in ILIKE '%Documentaries%'


--12. Finding all the contnet without a director

SELECT*
FROM Netflix
WHERE director IS NULL

--13. Finding the number of movies acotr 'Nicolas Cage' apperead in last 10 years

SELECT *
FROM Netflix
WHERE
casts ILIKE '%Nicolas Cage%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10


--14. Finding the top 10 actors who have appeared in the highest bumber of movies produced in in United States

SELECT
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
	COUNT(*) as total_content
FROM Netflix
WHERE country ILIKE '%United States%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


-- 15. categorizing the content based on the keywords 'kill' and 'violence' in the description
field and labeling them as bad and rest as good also counting the numbers in those 2 category.


WITH new_table
AS(
SELECT 
	*,
	CASE
	WHEN description ILIKE '%kill%' OR 
	description ILIKE '%violence%' THEN 'Bad_Content'
	ELSE 'Good_Content'
	END category
	FROM Netflix
)
SELECT
	category,
	COUNT(*) as total_content
FROM new_table
GROUP BY 1;
	