{{ config(materialized="view") }}

with
    artists as (
        select
            artistdisplayname,
            safe_cast(artistbegindate as int64) as begin_year,
            safe_cast(artistenddate as int64) as end_year
        from {{ source("qr_art_gallery_raw", "staging_metropolitan") }}
        where
            safe_cast(artistbegindate as int64) is not null
            and safe_cast(artistenddate as int64) is not null
            and ishighlight = true
            and safe_cast(artistbegindate as int64) >= 1300
    )

select artistdisplayname, year
from artists, unnest(generate_array(begin_year, end_year)) as year
