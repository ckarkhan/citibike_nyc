{% snapshot station_bikes_inventory_snapshot%}


{{
    config(
        target_schema='NYC',
        unique_key="STATION_ID||'-'||DATETIME||'-'||RIDEABLE_TYPE",
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

SELECT * FROM {{ source('trf_trips', 'bike_inventory')}}

{% endsnapshot %}