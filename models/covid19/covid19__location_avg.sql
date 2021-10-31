{{
  config(
    materialized='table'
  )
}}

with loc_avg as(
    select LOCATION, 
        avg(GROWTH_FACTOR_OF_NEW_DEATHS) GROWTH_FACTOR_OF_NEW_DEATHS,
        avg(GROWTH_FACTOR_OF_NEW_CASES) GROWTH_FACTOR_OF_NEW_CASES,
        avg(NEW_CASES_PER_MILLION) NEW_CASES_PER_MILLION,
        avg(NEW_DEATHS_PER_MILLION) NEW_DEATHS_PER_MILLION,
        avg(TOTAL_CASES_PER_MILLION) TOTAL_CASES_PER_MILLION,
        avg(TOTAL_DEATHS_PER_MILLION) TOTAL_DEATHS_PER_MILLION,
        avg(CASE_RECOVERED_RATE) CASE_RECOVERED_RATE,
        avg(CASE_FATALITY_RATE) CASE_FATALITY_RATE
    from {{ref('covid19__dataset')}}
    group by LOCATION
),

final as (
    select * from loc_avg
)

select * from final