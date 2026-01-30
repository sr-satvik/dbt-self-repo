{{
    config(
        materialized='view'
    )
}}
select
   PRODUCT_KEY        as product_key,
   SKU               as sku,
   PRODUCT_name           as product_name,
   COLOR             as color,
   MODEL             as model,
   SUBCATEGORY       as subcategory,
   CATEGORY          as category,
   try_to_number(replace(STANDARD_COST, '$', '')) as standard_cost,
   try_to_number(replace(LIST_PRICE, '$', ''))    as list_price
from {{ source('snowflake_source', 'PRODUCT_DATA') }}