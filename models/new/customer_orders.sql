{{ config(materialized='table') }}

select
    o.order_id,
    o.customer_id,
    o.product_id,
    o.quantity,
    o.order_date,
    o.status as order_status,
   c.first_name,
c.last_name,
c.email,
c.city,
c.country,
c.created_at as customer_created_at
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.customer_id