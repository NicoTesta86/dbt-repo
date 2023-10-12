with temp_daily as (
    select *,
        to_char(timestamp, 'Day') as weekday
    from {{ref("staging_temp")}}
)
select * 
from temp_daily