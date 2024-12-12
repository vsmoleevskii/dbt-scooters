
select 
count(*) as trips,
count(distinct user_id) as users, 
round(avg (extract(epoch from finished_at-started_at)/60),2) as avg_duration_m,
sum(price)/100 as revenue_rub,
round(count (case when price = 0 then 1 end) * 100.00/count(*),2) as free_trips_pct 
from scooters_raw.trips








