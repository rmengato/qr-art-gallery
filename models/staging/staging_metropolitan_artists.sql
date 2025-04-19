{{ config(materialized='view') }}

SELECT
  artistmd5id,
  artistDisplayName,
  artistPrefix,
  artistDisplayBio,
  artistSuffix,
  artistAlphaSort,
  artistNationality,
  artistBeginDate,
  artistEndDate,
  artistGender,
  artistWikidata_URL,
  artistULAN_URL,
  BatchTimestamp
FROM {{ source('qr_art_gallery_raw', 'staging_metropolitan_artists') }}