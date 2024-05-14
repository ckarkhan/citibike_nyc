{{ config(
   materialized = 'incremental'
  )
}}

SELECT
  ride_id,
  null:: int as rider_id,
  date(started_at) as trip_date,
  hour(started_at) as start_hour,
  substr(start_station_id,1,4) as start_station_id,
  start_station_name,
  hour(ended_at) as end_hour,
  substr(end_station_id,1,4) as end_station_id,
  end_station_name,
  datediff(minutes, started_at, ended_at) as ride_duration_minutes,
 {# {{ dbt_utils.haversine_distance(start_lat, start_lng, end_lat, end_lng) }} as distance_miles, #}
  round(haversine(start_lat, start_lng,end_lat,end_lng)/1.60934 ,2) as distance_miles,
  member_casual as rider_type,
  rideable_type,
  current_timestamp() as updated_at

  from {{ source('raw', 'trips_raw') }}

  {% if is_incremental() %}
   where started_at >= (select max(updated_at) from {{ this }} )
  {% endif %}