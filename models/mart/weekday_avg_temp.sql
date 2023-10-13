WITH weekday_avg_temp AS (
    SELECT
        city,
        AVG('Berlin') AS avg_avgtemp_c
    FROM {{ref('prep_temp')}}
    GROUP BY city
)

SELECT *
FROM weekday_avg_temp;




