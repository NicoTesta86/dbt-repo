WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
        to_char(timestamp, 'Day') AS weekday,
    FROM temp_daily
)
SELECT *
FROM add_weekday