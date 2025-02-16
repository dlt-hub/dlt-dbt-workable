/* Table: members */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.email,
    t.role,
    t.active,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_members') }} as t