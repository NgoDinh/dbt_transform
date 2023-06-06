
-- Use the `ref` function to select from other models

select *, 'HN' as code, '2020-03-01 00:00:00.000'::timestamp as updated_at
from {{ ref('my_first_dbt_model') }}
where id = 1
