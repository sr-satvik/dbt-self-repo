{{ config(materialized = 'table') }}
select distinct
   customer_key,
   customer_id,
   customer_name,
   city,
   state_province,
   country_region
from {{ ref('int_sales_enriched') }}
where customer_key is not NULL