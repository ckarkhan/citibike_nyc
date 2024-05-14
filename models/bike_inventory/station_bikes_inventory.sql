{{ config(materialized='table') }}

select
null::int as station_id,
null::timestamp as datetime,
null as rideable_type,
null::int as bike_qty,
current_timestamp() as updated_at