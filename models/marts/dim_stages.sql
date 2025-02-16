/* Table: stages */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.slug,
    t.name,
    t.kind,
    t.position,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_stages') }} as t