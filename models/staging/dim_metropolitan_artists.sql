{{ config(materialized='view') }}

SELECT
  artistmd5id,
  ANY_VALUE(artistDisplayName) as artistDisplayName,
  ANY_VALUE(artistPrefix) as artistPrefix,
  ANY_VALUE(artistDisplayBio) as artistDisplayBio,
  ANY_VALUE(artistSuffix) as artistSuffix,
  ANY_VALUE(artistAlphaSort) as artistAlphaSort,
  ANY_VALUE(artistNationality) as artistNationality,
  ANY_VALUE(artistBeginDate) as artistBeginDate,
  ANY_VALUE(artistEndDate) as artistEndDate,
  ANY_VALUE(artistGender) as artistGender,
  ANY_VALUE(artistWikidata_URL) as artistWikidata_URL,
  ANY_VALUE(artistULAN_URL) as artistULAN_URL,
  MIN(BatchTimestamp) as first_loaded_at
FROM {{ ref('staging_metropolitan_artists') }}
GROUP BY artistmd5id