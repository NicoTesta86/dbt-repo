WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
        EXTRACT(DOW FROM timestamp) AS weekday,
        EXTRACT(DAY FROM timestamp) AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday
