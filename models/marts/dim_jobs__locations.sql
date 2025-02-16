/* Table: jobs__locations */
/* Parent: jobs */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.country_code,
    t.country_name,
    t.state_code,
    t.zip_code,
    t.city,
    t.coords,
    t.hidden,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.subregion,
FROM  {{ ref('stg_jobs__locations') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_jobs') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)