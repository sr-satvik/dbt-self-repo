{{ config(materialized = 'table') }}
select
   sales_order_line_key,
   -- foreign keys
   customer_key,
   product_key,
   -- dates
   order_date_key,
   due_date_key,
   ship_date_key,
   -- measures
   order_quantity,
   unit_price,
   unit_price_discount,
   extended_amount,
   product_standard_cost,
   total_product_cost,
   sales_amount
from {{ ref('int_sales_enriched') }}
where customer_key is not null and product_key is not null