{{ config(materialized='table') }}

select  province_state state, stabbr ST,
sum(doses_alloc_total) total_dose,  
sum(doses_alloc_moderna) total_alloc_moderna, 
sum(doses_alloc_pfizer) total_alloc_pfizer, 
sum(doses_alloc_johnson_and_johnson) total_alloc_johnson

FROM {{ source('covid', 'jhu_vaccines') }}
group by all
order by 1 desc 