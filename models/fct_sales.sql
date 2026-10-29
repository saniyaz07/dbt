
{{ config(materialized='table') }}

select
    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_date,
    o.status as order_status,
    o.quantity,
    p.product_name,
    p.category,
    p.price_in_cents,
    o.quantity * p.price_in_cents as revenue_in_cents,
    round(o.quantity * p.price_in_cents / 100.0, 2) as revenue
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_products') }} as p
    on o.product_id = p.product_id
