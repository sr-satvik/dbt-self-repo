{{ config(materialized = 'view') }}
select
   sales_order_line_key,
   reseller_key,
   customer_key,
   product_key,
   order_date_key,
   due_date_key,
   ship_date_key,
   sales_territory_key,
   -- quantities
   cast(order_quantity as integer) as order_quantity,
   -- prices
   unit_price,
   unit_price_discount,
   extended_amount,
   product_standard_cost,
   total_product_cost,
   sales_amount
from {{ ref('stg_sales_data') }}