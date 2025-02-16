{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_candidates') }}
-- depends_on: {{ ref('dim_events') }}
-- depends_on: {{ ref('dim_jobs') }}
-- depends_on: {{ ref('dim_stages') }}
-- depends_on: {{ ref('dim_members') }}
-- depends_on: {{ ref('dim_jobs__locations') }}
-- depends_on: {{ ref('dim_events__members') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}