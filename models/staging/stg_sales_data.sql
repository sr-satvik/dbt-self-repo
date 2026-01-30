{{ config(materialized='view') }}
select
   sales_order_line_key                               as sales_order_line_key,
   reseller_key                                       as reseller_key,
   customer_key                                       as customer_key,
   product_key                                        as product_key,
   order_date_key                                     as order_date_key,
   due_date_key                                       as due_date_key,
   ship_date_key                                      as ship_date_key,
   sales_territory_key                                as sales_territory_key,
   -- quantities
   order_quantity::int                                as order_quantity,
   -- remove $ and convert to number
   try_to_number(replace(unit_price, '$', ''))        as unit_price,
   try_to_number(replace(extended_amount, '$', ''))   as extended_amount,
   try_to_number(replace(unit_price_discount, '$', ''))
                                                       as unit_price_discount,
   try_to_number(replace(product_standard_cost, '$', ''))
                                                       as product_standard_cost,
   try_to_number(replace(total_product_cost, '$', ''))
                                                       as total_product_cost,
   try_to_number(replace(sales_amount, '$', ''))      as sales_amount
from {{ source('snowflake_source', 'SALES_DATA') }}