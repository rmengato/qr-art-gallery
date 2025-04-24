{{ config(materialized='view') }}

SELECT
  md5id,
  objectID,
  primaryImage,
  primaryImageSmall,
  additionalImages,
  concat('gs://qr_art_gallery_zoom_bucket/qr_codes/', objectID, '.png') as qrCodeBucketUri,
  BatchTimestamp
FROM {{ source('qr_art_gallery_raw', 'staging_metropolitan_images') }}
