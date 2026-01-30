{{ config(materialized='view') }}
select
   customer_key                 as customer_key,
   customer_id                  as customer_id,
   customer_name                as customer_name,
   city                          as city,
   state_province                as state_province,
   country_region                as country_region,
   postal_code                   as postal_code
from {{ source('snowflake_source', 'CUSTOMER_DATA') }}