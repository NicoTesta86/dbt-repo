WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_moon_info AS (
    SELECT *,
        (extracted_data -> 'moonrise')::TEXT AS moonrise,
        (extracted_data -> 'moonset')::TEXT AS moonset
    FROM temp_daily
)
SELECT *
FROM add_moon_info;
