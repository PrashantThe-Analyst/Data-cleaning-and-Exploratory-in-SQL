# 1.How many records are there in the dataset?

select count(*) from netflix_titles nt ;

# 2.What are the distinct types of content available?

select distinct `type` from netflix_titles nt; 

# 2.How many movies and TV shows are there in the dataset?

select `type` ,count(`type`) as content_count from netflix_titles nt 
group by `type` ;

#3.What are the most common genres in the dataset?

select listed_in,count(listed_in) as frequency from netflix_titles nt
group by listed_in
order by frequency desc
limit 10;

# 4. Which countries produce the most content?
select country , count(listed_in) as most_content from netflix_titles nt 
group by country
order by most_content desc;

# 5.What types of content are produced by a specific country (e.g., the United States)?

select country,listed_in,count(listed_in) as most_produced_content from netflix_titles nt
where country = "united states"
group by country ,listed_in 
order by most_produced_content desc;

# 6.How has the volume of content changed over the years?

select year(date_added) as `year`,listed_in ,count(listed_in) as content_over_the_year from netflix_titles nt 
group by year(date_added),listed_in 
order by count(listed_in ) desc;

# 7.What year had the highest number of releases?

select release_year,count(`type`) as most_content_release from netflix_titles nt 
group by release_year
order by most_content_release desc
limit 1 ;

#8.What are the different types of ratings in the dataset?

select distinct rating from netflix_titles nt ;

#9.How many titles exist for each rating?

select rating,count(*) as most_rating from netflix_titles nt 
group by rating 
order by most_rating desc;

#10.Which rating has the most content for movies and TV shows?
select `type`,rating,count(rating) as most_rating_base_on_type from netflix_titles nt 
group by `type` ,rating 
order by most_rating_base_on_type desc;

# 11.What is the average duration of movies in minutes?

SELECT AVG(CAST(SUBSTRING(Duration, 1, LENGTH(Duration) - 6) AS UNSIGNED)) AS Avg_Duration
FROM netflix_titles nt 
WHERE Type = 'Movie';

# 12.What is the average number of seasons for TV shows?

SELECT AVG(CAST(SUBSTRING(Duration, 1, LENGTH(Duration) - 8) AS UNSIGNED)) AS Avg_Seasons
FROM netflix_titles nt 
WHERE Type = 'TV Show';

# 13.Which month has the highest number of titles added?

select month(date_added) as `months`,count(*) as most_content_add from netflix_titles nt 
group by month(date_added)
order by most_content_add desc;

# 14.Which directors have the most titles on Netflix?

select director,count(title) as most_title from netflix_titles nt 
where director !="unknown"
group by director
order by count(title) desc;

# 15.how many percentage is movies and tv shows.

select `type`,concat(round((count(`type`)/(select count(`type`) from netflix_titles nt)*100),2),'%') as percenteage from netflix_titles nt
group by `type` 



select * from netflix_titles nt ;
