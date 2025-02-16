/* Table: jobs */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'jobs' */
    id,
    title,
    full_title,
    shortcode,
    code,
    state,
    sample,
    url,
    application_url,
    shortlink,
    location__location_str,
    location__country,
    location__country_code,
    location__region_code,
    location__city,
    location__zip_code,
    location__telecommuting,
    location__workplace_type,
    salary__salary_from,
    salary__salary_to,
    salary__salary_currency,
    created_at,
    _dlt_load_id,
    _dlt_id,
    location__region,
FROM {{ source('raw_data', 'jobs') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )