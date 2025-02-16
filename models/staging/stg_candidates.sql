/* Table: candidates */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'candidates' */
    id,
    name,
    firstname,
    lastname,
    headline,
    account__subdomain,
    account__name,
    job__shortcode,
    job__title,
    stage,
    disqualified,
    sourced,
    profile_url,
    address,
    phone,
    email,
    domain,
    created_at,
    updated_at,
    _dlt_load_id,
    _dlt_id,
    hired_at,
FROM {{ source('raw_data', 'candidates') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )