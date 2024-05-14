{{ config(materialized='table') }}

select 
current_timestamp() as datetime,
null::int as temp,
null::float as humidity,
null::float as dew,
null::float as windgust,
null::float as windspeed,
null::float as cloudcover,
null::char as conditions,
null::int as uvindex
