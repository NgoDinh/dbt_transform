select
    c_custkey,
    sum(total_order_price) as total_amount
from {{ ref('customer_purchase' )}}
group by 1
having not(total_amount >= 0)