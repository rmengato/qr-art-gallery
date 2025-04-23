{{ config(materialized="view") }}

with
    artworks as (
        select
            objectid,
            title,
            artistdisplayname,
            safe_cast(objectbegindate as int64) as object_start,
            safe_cast(objectenddate as int64) as object_end,
            objectDate
        from {{ ref('staging_metropolitan_artworks') }}
        where
            safe_cast(objectbegindate as int64) is not null
            and safe_cast(objectenddate as int64) is not null
            and ishighlight = true
            and safe_cast(artistbegindate as int64) >= 1300
            and not regexp_contains(objectdate, r'^\d{1,2}th century$')
    )

select objectid, title, artistdisplayname, object_start, object_end, year, objectdate
from artworks, unnest(generate_array(object_start, object_end)) as year
order by objectid, year
