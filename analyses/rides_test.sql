SELECT
  *
  from {{ source('raw', 'trips_raw') }}
 -- from CITIBIKE_RAW.PUBLIC.TRIPS_RAW_NEW as trips
  limit 50