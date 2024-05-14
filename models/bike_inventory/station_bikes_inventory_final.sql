select
inv.station_id as station_id,
stn.station_name as station_name,
hour(inv.datetime) as hour_of_day,
inv.rideable_type as bike_type,
sum(inv.bike_qty) as qty_available
-- from CITIBIKE.NYC.STATION_BIKES_INVENTORY as inv
from {{ ref("station_bikes_inventory")}} as inv
--inner join CITIBIKE.NYC.STATION_DETAIL as stn using (station_id)
inner join {{ ref("station_detail")}} as stn using (station_id)
group by 1,2,3,4
order by 1,2,3,4