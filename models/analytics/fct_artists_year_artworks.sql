{{ config(
    materialized="table",
    alias = "metropolitan_artists_biography") }}


with biography as (select ay.artistdisplayname, ay.year, aw.title as artwork_title
from {{ ref("artists_years") }} ay
left join
    {{ ref("artwork_years") }} aw on ay.year = aw.year
order by artistdisplayname, year)

select 
  artistdisplayname,
  year,
  STRING_AGG(artwork_title, '; ') as artwork_titles
from biography
group by artistdisplayname, year