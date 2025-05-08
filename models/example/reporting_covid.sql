
-- Use the `ref` function to select from other models

select *
from {{ ref('Us_State_Covid') }}

