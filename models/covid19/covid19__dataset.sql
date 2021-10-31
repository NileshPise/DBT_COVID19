{{
  config(
    materialized='table'
  )
}}

with dataset as (
    select * from {{ source('FIVETRAN_INTERVIEW_DB', 'COVID_19_INDONESIA_NILESH_PISE') }}
),

final as (
    select * from dataset
)

select * from final