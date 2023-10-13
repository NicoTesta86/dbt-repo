with weekday_avg_temp as (
    select 
        city,
        avg(temperature_daily) as avgtemp_c,
    
    from {{ref('prep_temp')}}
    group by city
)

select *
from weekday_avg_temp