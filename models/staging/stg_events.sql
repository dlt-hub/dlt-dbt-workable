/* Table: events */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'events' */
    id,
    title,
    description,
    type,
    starts_at,
    ends_at,
    cancelled,
    job__shortcode,
    job__title,
    candidate__id,
    candidate__name,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'events') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )