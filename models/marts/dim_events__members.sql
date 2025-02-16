/* Table: events__members */
/* Parent: events */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.status,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_events__members') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_events') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)