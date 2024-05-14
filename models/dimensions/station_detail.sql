{{ config(materialized='table') }}

select station_id,
name as station_name,
lat as station_lat,
lon as station_lon,
boro as borough,
region_id,
geoid as geo_id,
null as station_zip,
class

from {{ ref("stations")}}