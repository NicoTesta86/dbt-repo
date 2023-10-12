WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
        EXTRACT(DOW FROM date) AS weekday,
        EXTRACT(DAY FROM date) AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday
