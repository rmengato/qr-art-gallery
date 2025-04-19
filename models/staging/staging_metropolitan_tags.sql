{{ config(materialized='view') }}

SELECT
  objectID,
  term,
  AAT_URL,
  Wikidata_URL
FROM {{ source('qr_art_gallery_raw', 'staging_metropolitan_tags') }}
