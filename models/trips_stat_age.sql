{{ 
    config(
        materialized='table'
    ) 
}}


with date_age_cte as(
select
	date(t.started_at) as date,
	(extract(year from t.started_at) - extract(year from u.birth_date)) as age
from 
	scooters_raw.users u
inner join scooters_raw.trips t
on u.id = t.user_id
),
count_cte as (
select 
	date,
	age,
	count(*) as trips
	from date_age_cte
	group by date, age)
select age, avg(trips) as avg_trips
from count_cte 
group by age
order by age



