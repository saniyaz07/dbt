{{ config(materialized='table') }}

select distinct *
from {{ ref('order_status_mapping') }}