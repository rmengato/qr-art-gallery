{{ config(
    materialized="table",
    alias = "metropolitan_artists_biography") }}


select ay.artistdisplayname, ay.year, aw.title as artwork_title
from {{ ref("artists_years") }} ay
left join
    {{ ref("artwork_years") }} aw on ay.year = aw.year
