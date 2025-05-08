{{ config(materialized='table') }}

SELECT 
    c.state,
    c.st, 
    SUM(c.positive) AS positive, 
    SUM(c.negative) AS negative,
    SUM(c.hospitalized) AS hospitalized, 
    SUM(c.death) AS death, 
    SUM(v.total_dose) AS total_vaccinated, 
    SUM(v.total_alloc_moderna) AS total_moderna, 
    SUM(v.total_alloc_pfizer) AS total_pfizer
FROM {{ ref('us_state_covid') }} c
JOIN {{ ref('us_state_vaccinate') }} v 
    ON c.st = v.st
GROUP BY c.state, c.st






