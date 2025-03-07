/* Table: jobs */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.title,
    t.full_title,
    t.shortcode,
    t.code,
    t.state,
    t.sample,
    t.url,
    t.application_url,
    t.shortlink,
    t.location__location_str,
    t.location__country,
    t.location__country_code,
    t.location__region_code,
    t.location__city,
    t.location__zip_code,
    t.location__telecommuting,
    t.location__workplace_type,
    t.salary__salary_from,
    t.salary__salary_to,
    t.salary__salary_currency,
    t.created_at,
    t._dlt_load_id,
    t._dlt_id,
    t.location__region,
FROM  {{ ref('stg_jobs') }} as t