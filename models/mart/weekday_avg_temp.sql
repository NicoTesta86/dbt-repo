WITH avg_temp_per_country AS (
    SELECT
        (data -> 'location' -> 'country')::VARCHAR AS country,
        AVG(((data -> 'forecast' -> 'day' -> 'avgtemp_c')::VARCHAR)::FLOAT) AS avg_avgtemp_c
    FROM your_staging.your_raw_temp
    GROUP BY (data -> 'location' -> 'country')::VARCHAR
)

SELECT *
FROM avg_temp_per_country;







