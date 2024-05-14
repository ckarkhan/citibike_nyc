{% snapshot riders_history%}


{{
    config(
        target_schema='NYC',
        unique_key='RIDER_ID',
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

SELECT * FROM {{ source('trf_trips', 'riders')}}

{% endsnapshot %}