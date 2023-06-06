{{ config(materialized='table')}}
-- , alias='fact_customer_purchase', schema='dbt_test', database='analyst_test') }}
SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from snowflake_sample_data.tpch_sf1.customer c
LEFT JOIN snowflake_sample_data.tpch_sf1.orders o
ON c.c_custkey = o.o_custkey
group by 1,2,3
having sum(o.o_totalprice) >0 