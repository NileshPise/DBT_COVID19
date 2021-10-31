{{
  config(
    materialized='table'
  )
}}
with locations as(
    select LOCATION, 
        sum(TOTAL_ACTIVE_CASES) TOTAL_ACTIVE_CASES,
        sum(TOTAL_CASES) TOTAL_CASES,
        sum(TOTAL_DEATHS) TOTAL_DEATHS,
        sum(TOTAL_RECOVERED) TOTAL_RECOVERED,
        sum(NEW_ACTIVE_CASES) NEW_ACTIVE_CASES,
        sum(NEW_CASES) NEW_CASES,
        sum(NEW_RECOVERED) NEW_RECOVERED,
        sum(NEW_DEATHS) NEW_DEATHS,
        sum(CASE_RECOVERED_RATE) CASE_RECOVERED_RATE 
    from {{ ref('covid19__dataset') }}
    group by LOCATION
),

final as(
    select * from locations
)
select * from final