{{ config(materialized="view") }}

with
    artworks as (
        select
            objectid,
            title,
            safe_cast(objectbegindate as int64) as object_start,
            safe_cast(objectenddate as int64) as object_end
        from {{ ref('staging_metropolitan_artworks') }}
        where
            safe_cast(objectbegindate as int64) is not null
            and safe_cast(objectenddate as int64) is not null
            and ishighlight = true
            and safe_cast(artistbegindate as int64) >= 1300
    )

select objectid, title, year
from artworks, unnest(generate_array(object_start, object_end)) as year
