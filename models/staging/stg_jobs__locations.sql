/* Table: jobs__locations */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_jobs') }}

SELECT
/* select which columns will be available for table 'jobs__locations' */
    country_code,
    country_name,
    state_code,
    zip_code,
    city,
    coords,
    hidden,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    subregion,
FROM {{ source('raw_data', 'jobs__locations') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_jobs') }} )
