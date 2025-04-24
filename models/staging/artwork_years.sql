{{ config(materialized="view") }}

with
    artworks as (
        select
            objectid,
            title,
            artistdisplayname,
            safe_cast(objectbegindate as int64) as object_start,
            safe_cast(objectenddate as int64) as object_end,
            objectDate,
            classification,
            culture,
            department
        from {{ ref('staging_metropolitan_artworks') }}
        where
            safe_cast(objectbegindate as int64) is not null
            and safe_cast(objectenddate as int64) is not null
            --and safe_cast(artistbegindate as int64) >= 1300
            --and not regexp_contains(objectdate, r'^\d{1,2}th century$')
            and classification like '%aintings%'
            and safe_cast(objectenddate as int64) - safe_cast(objectbegindate as int64) < 15
    )

select objectid, 
    title, 
    artistdisplayname, 
    object_start, 
    object_end, 
    year, 
    objectdate,
    classification,
    culture,
    ifnull(culture, concat('not specified (', department, ')')) as culture_fallback,
    department
from artworks, unnest(generate_array(object_start, object_end)) as year
order by artistdisplayname, objectid, year
