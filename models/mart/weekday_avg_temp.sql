WITH total_avg AS (
    SELECT
        city, country, date, weekday,
        AVG(avgtemp_c) AS avg_temp_weekday,
        MAX(maxtemp_c) AS max_temp_weekday,
        MIN(mintemp_c) AS min_temp_weekday
        MAX(maxwind_kph) AS max_wind_kph
        AVG(avgvis_km) AS avg_vis_km
        AVG(avghumidity) AS avg_umidity
    FROM {{ref('prep_temp')}}
    GROUP BY city, country, date, weekday
)
SELECT *
FROM total_avg




