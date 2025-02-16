/* Table: events */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.title,
    t.description,
    t.type,
    t.starts_at,
    t.ends_at,
    t.cancelled,
    t.job__shortcode,
    t.job__title,
    t.candidate__id,
    t.candidate__name,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_events') }} as t