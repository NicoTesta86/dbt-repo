WITH avg_avgtemp_c AS (
    SELECT
        (data -> 'location' -> 'country')::VARCHAR AS country,
        AVG(((data -> 'forecast' -> 'day' -> 'avgtemp_c')::VARCHAR)::FLOAT) AS avg_avgtemp_c
    FROM {{source("staging", "raw_temp")}}
    GROUP BY (data -> 'location' -> 'country')::VARCHAR
)

SELECT *
FROM avg_avgtemp_c;








