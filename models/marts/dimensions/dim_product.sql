{{ config(materialized = 'table') }}
select distinct
   product_key,
   sku,
   product_name,
   category,
   subcategory,
   color,
   model
from {{ ref('int_sales_enriched') }}
WHERE product_key is not null