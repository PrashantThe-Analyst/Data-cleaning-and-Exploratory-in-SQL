# create database 
create database netflix_db;

# use data base 
use netflix_db;

# fill "null" values by "unknown" word
select * from netflix_titles nt 
where director = "";


select director ,count(director) as blankvalues from netflix_titles
where director = ""
group by director ;


update netflix_titles 
set director="Unknown"
where director = "unknow" ;


# fill "null" values by "unknown" word
select * from netflix_titles nt 
where `cast` = "";

select `cast` ,count(`cast`) as blankvalues from netflix_titles
where `cast` = ""
group by `cast` ;

update netflix_titles 
set `cast` ="Unknown"
where `cast` ="unknow";


# fill "null" values by "unknown" word
select * from netflix_titles nt 
where country ="";

select country ,count(country) as blankvalues from netflix_titles
where country = ""
group by country ;

update netflix_titles 
set country="Unknown"
where country="unkown";



# convert string format in date format
select * from netflix_titles nt 
where date_added ="";

select date_added ,count(show_id)
from netflix_titles nt 
group by date_added
order by count(show_id) desc;

update netflix_titles 
set date_added="January 1,2020"
where date_added ="";

select date_added ,STR_TO_DATE(date_added,'%M%d,%Y') as date_added  from netflix_titles nt ;

update netflix_titles 
set date_added = STR_TO_DATE(date_added,'%M%d,%Y');

alter table netflix_titles 
modify column date_added date;


# convert year format
alter table netflix_titles 
modify column release_year year;




select * from netflix_titles nt 
where rating ="";

select rating,count(show_id) from netflix_titles nt 
group by rating
order by count(show_id) desc;

update netflix_titles 
set rating ="TV-MA"
where rating ="";

update netflix_titles 
set rating ="TV-MA"
where rating like '%min';




select * from netflix_titles nt 
where duration = "";

UPDATE netflix_titles 
SET duration = CASE 
    WHEN show_id = "s5542" THEN "74 min"
    WHEN show_id = "s5795" THEN "84 min"
    when show_id = "s5814" THEN "66 min"
    ELSE duration -- Keep the existing value if the condition doesn't match
END
WHERE show_id IN ("s5542","s5795","s5814");





select * from netflix_titles nt ;

