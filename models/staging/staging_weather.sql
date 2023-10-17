WITH temperature_daily AS (
        SELECT ((data -> 'forecast' -> 'forecastday' -> 0 -> 'date')::VARCHAR)::date AS date,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'maxtemp_c')::VARCHAR)::FLOAT AS maxtemp_c,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'mintemp_c')::VARCHAR)::FLOAT AS mintemp_c,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avgtemp_c')::VARCHAR)::FLOAT AS avgtemp_c,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'maxwind_kph')::VARCHAR)::FLOAT AS maxwind_kph,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avgvis_km')::VARCHAR)::FLOAT AS avgvis_km,
        ((data -> 'forecast' -> 'forecastday' -> 0 -> 'day' -> 'avghumidity')::VARCHAR)::FLOAT AS avghumidity,
        REPLACE((data -> 'location' -> 'name')::VARCHAR, '"', '') AS city,
        REPLACE((data -> 'location' -> 'region')::VARCHAR, '"', '') AS region,
        REPLACE((data -> 'location' -> 'country')::VARCHAR, '"', '') AS country,
        ((data -> 'location' -> 'lat')::VARCHAR)::NUMERIC AS lat,
        ((data -> 'location' -> 'lon')::VARCHAR)::NUMERIC AS lon
    FROM {{source("staging", "raw_temp")}})
SELECT *
FROM temperature_daily