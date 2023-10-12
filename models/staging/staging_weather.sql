WITH temperature_daily AS (
    SELECT ((data -> 'forecast' -> 'forecastday' -> 0 -> 'date')::VARCHAR)::date  AS date,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'maxtemp_c')::VARCHAR)::FLOAT AS maxtemp_c,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'mintemp_c')::VARCHAR)::FLOAT AS mintemp_c,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avgtemp_c')::VARCHAR)::FLOAT AS avgtemp_c,
        (data -> 'location' -> 'name')::VARCHAR  AS city,
        (data -> 'location' -> 'region')::VARCHAR  AS region,
        (data -> 'location' -> 'country')::VARCHAR  AS country,
        ((data -> 'location' -> 'lat')::VARCHAR)::NUMERIC  AS lat, 
        ((data -> 'location' -> 'lon')::VARCHAR)::NUMERIC  AS lon
    FROM {{source("staging", "raw_temp")}})
SELECT * 
FROM temperature_daily