{{ config(materialized='table') }}

select
  null::int as  rider_id,
  null as rider_name,
  null as rider_class,  --subscriber or casual
  null as rider_gender,
  null::int as rider_age,
  null as rider_zip,
  null as rider_base_station_id,
  null as rider_lat,
  null as rider_lng,
  current_timestamp() as updated_at