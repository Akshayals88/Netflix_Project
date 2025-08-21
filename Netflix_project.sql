create database zomato;

use netflix_project;

select * from [dbo].[netflix_titles];

-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

select type,count(type) No_of_Category from netflix_titles where type IN ('Movie','TV Show') GROUP BY type;

select * from netflix_titles;

--2. Find the most common rating for movies and TV shows

select rating,count(*) Most_common_rating from netflix_titles where type IN ('Movie','TV Show') Group by rating ORDER BY Most_common_rating desc;


--3. List all movies released in a specific year (e.g., 2020)

select type,title,release_year from netflix_titles where type='Movie' and release_year=2020;


--4. Find the top 5 countries with the most content on Netflix


select TOP 5 country, count(type) AS No_of_Watches from netflix_titles group by country order by No_of_Watches desc;

--5. Identify the longest movie

select TOP 5 MAX(duration),title from netflix_titles where type ='Movie' group by title order by duration desc;


SELECT TOP 5 title, duration
FROM netflix_titles
WHERE type = 'Movie'
  AND duration LIKE '%min'
ORDER BY CAST(REPLACE(duration, ' min', '') AS INT) DESC;


--6 . Find content added in the last 5 years


SELECT * 
FROM netflix_titles
WHERE date_added BETWEEN '2020-01-01' AND '2025-12-31'
ORDER BY date_added DESC;



-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select type,director,title from netflix_titles where director = 'Rajiv Chilaka';

-- 8. List all TV shows with more than 5 seasons

use netflix_project;

SELECT *
FROM netflix_titles
WHERE type = 'TV Show'
  AND CAST(LEFT(duration, CHARINDEX(' ', duration + ' ') - 1) AS INT) > 5;
   


-- 9. Count the number of content items in each genre 

select listed_in,count(type) from netflix_titles group by listed_in;

--10. Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !

SELECT TOP 5 release_year,count(*) AS Avg_content
from netflix_titles where country='India'
group by release_year ORDER BY avg_content DESC;



-- 11. List all movies that are documentaries

select type,listed_in,title AS Movies from netflix_titles where listed_in ='documentaries';

-- 12. Find all content without a director

select * from netflix_titles where director IS NULL;



-- 13. Find in how many movies 'Salman Khan' appeared in last 10 years!


SELECT COUNT(title) AS total_movies
FROM netflix_titles
WHERE type = 'Movie'
  AND cast LIKE '%Salman Khan%'
  AND release_year >= YEAR(GETDATE()) - 10;


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.


select * from netflix_titles;

-- Giving like wrong output

select TOP 10 cast,count(title) AS Highest_no_of_Movies from netflix_titles where country = 'India' AND 
type = 'Movie' group by cast order by Highest_no_of_Movies;

