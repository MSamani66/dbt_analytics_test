
-- Use the `ref` function to select from other models

select *
from {{ ref(Us_Covid_tests) }}

