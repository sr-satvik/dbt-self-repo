{{ config(materialized = 'view') }}
select
   s.sales_order_line_key,
   -- dates
   s.order_date_key,
   s.due_date_key,
   s.ship_date_key,
   -- customer
   c.customer_key,
   c.customer_id,
   c.customer_name,
   c.city,
   c.state_province,
   c.country_region,
   -- product
   p.product_key,
   p.sku,
   p.product_name,
   p.category,
   p.subcategory,
   p.color,
   p.model,
   -- sales metrics
   s.order_quantity,
   s.unit_price,
   s.unit_price_discount,
   s.extended_amount,
   s.product_standard_cost,
   s.total_product_cost,
   s.sales_amount
from {{ ref('int_stg_clean') }} s
left join {{ ref('stg_customer_data') }} c
   on s.customer_key = c.customer_key
left join {{ ref('stg_product_data') }} p
   on s.product_key = p.product_key