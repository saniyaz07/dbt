{{ config(materialized='table') }}

select distinct *
from {{ ref('raw_orders') }}