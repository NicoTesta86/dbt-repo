WITH total_avg AS (
    SELECT
        city, country, year, weekday,
        AVG(avgtemp_c) AS avg_temp_weekday,
    FROM {{ref('prep_temp')}}
    GROUP BY city, country, year, weekday
)
SELECT *
FROM total_avg




