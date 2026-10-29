
{{ config(materialized='table') }}

select
    category,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_units_sold,
    round(sum(revenue), 2) as total_revenue,
    round(avg(revenue), 2) as average_line_revenue
from {{ ref('fct_sales') }}
where order_status = 'completed'
group by category
order by total_revenue desc
