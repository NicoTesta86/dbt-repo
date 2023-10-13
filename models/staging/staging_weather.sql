WITH temperature_daily AS (
        SELECT ((data -> 'forecast' -> 'forecastday' -> 0 -> 'date')::VARCHAR)::date AS date,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'maxtemp_c')::VARCHAR)::NUMERIC, 2) AS maxtemp_c,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'mintemp_c')::VARCHAR)::NUMERIC, 2) AS mintemp_c,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avgtemp_c')::VARCHAR)::NUMERIC, 2) AS avgtemp_c,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'maxwind_kph')::VARCHAR)::NUMERIC, 2) AS maxwind_kph,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avgvis_km')::VARCHAR)::NUMERIC, 2) AS avgvis_km,
        ROUND(((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avghumidity')::VARCHAR)::NUMERIC, 2) AS avghumidity,
        (data -> 'location' -> 'name')::VARCHAR AS city,
        (data -> 'location' -> 'region')::VARCHAR AS region,
        (data -> 'location' -> 'country')::VARCHAR AS country,
        ((data -> 'location' -> 'lat')::VARCHAR)::NUMERIC AS lat,
        ((data -> 'location' -> 'lon')::VARCHAR)::NUMERIC AS lon
    FROM {{source("staging", "raw_temp")}})
SELECT *
FROM temperature_daily
