with all_rides as (
select
year, month, count(ride_id) as ride_count
from {{ ref("trips_final")}}
{# from CITIBIKE.NYC.TRIPS_FINAL #}
group by 1,2
order by 1,2)

select year, month, ride_count,
lag(ride_count) over (partition by year order by year, month) as rides_prev_month,
ride_count - lag(ride_count) over (partition by year order by year, month) as prev_month_difference,
ride_count - lag(ride_count, 3) over (order by year, month) as prev_yr_month_difference
from all_rides