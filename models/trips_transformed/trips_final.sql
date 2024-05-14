SELECT
  trip.*,
  cal.year,
  cal.month,
  cal.monthname,
  cal.quarter,
  cal.dayname,
  cal.day,
  cal.public_holiday,
  rdr.rider_age,
  rdr.rider_gender,
  rdr.rider_zip,
  start_stn.borough as start_borough,
  end_stn.borough as end_borough,

  FROM {{ ref("trips_transformed") }} trip
  LEFT JOIN {{ref("calendar")}} as cal ON (trip.trip_date = cal.date)
  LEFT JOIN {{ ref("riders")}} as rdr on (trip.rider_id = rdr.rider_id)
  LEFT JOIN {{ ref("station_detail")}} as start_stn ON (to_char(start_stn.station_id) = trip.start_station_id)
  LEFT JOIN {{ ref("station_detail")}} as end_stn ON (to_char(end_stn.station_id) = trip.end_station_id)
  LEFT JOIN {{ ref("weather")}} as wth on (to_date(wth.datetime) = trip.trip_date)
