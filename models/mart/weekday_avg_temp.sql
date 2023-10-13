with weekday_avg_temp as (
    select 
        city,
        avg(avgtemp_c) as avgtemp_c,
    
    from {{ref('prep_temp')}}
    group by city
)

select *
from weekday_avg_temp