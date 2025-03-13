{{
    config(
        materialized='incremental',
        meta={
            'incrementality': {
                'start_date': '2023-07-31',
                'days_max': 60,
                'days_back_from_today': 1
            }
        }
    )
}}

select distinct
    user_id,
    "timestamp",
    type_id,
    {{ updated_at() }},
    "date"
from
    {{ ref("events_prep") }}
where
    {{ incremental_date_condition(
        model=this,
        date=var('date', none),
        start_date=var('start_date', '2023-07-31'),
        days_max=var('days_max', 60)
    ) }}