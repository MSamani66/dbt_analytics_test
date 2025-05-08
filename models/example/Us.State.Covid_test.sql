{{ config(materialized='table') }}

SELECT 
    date,
    province_state AS state, 
    iso3166_2 AS ST,
    SUM(positive) AS positive, 
    SUM(positive_since_previous_day) AS prio_positive, 
    SUM(negative) AS negative, 
    SUM(hospitalized) AS hospitalized,
    SUM(death) AS death
FROM {{ source('pc_dbt_db_raw_date', 'ct_us_covid_tests') }}
GROUP BY 
    date, province_state, iso3166_2
ORDER BY date DESC
