{{ config(materialized="view") }}

with
    artists as (
        select
            artistdisplayname,
            department,
            artistNationality,
            safe_cast(artistbegindate as int64) as begin_year,
        case
            when
                safe_cast(artistenddate as int64) > extract(year from current_date())
            then
                extract(year from current_date())
            else
               safe_cast(artistenddate as int64)
            end as end_year,
        case
            when safe_cast(artistenddate as int64) > extract(year from current_date())
            then false
            else true
        end as isAlive
        from {{ source("qr_art_gallery_raw", "staging_metropolitan") }}
        where
            safe_cast(artistbegindate as int64) is not null
            and safe_cast(artistenddate as int64) is not null
            and ishighlight = true
            and safe_cast(artistbegindate as int64) >= 1300
    )

select artistdisplayname, department, artistNationality, year
from artists, unnest(generate_array(begin_year, end_year)) as year
