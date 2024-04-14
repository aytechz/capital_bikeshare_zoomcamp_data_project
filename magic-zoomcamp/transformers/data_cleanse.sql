-- Docs: https://docs.mage.ai/guides/sql-blocks
SELECT * FROM {{ df_1 }} WHERE start_station_name IS NOT NULL OR end_station_name IS NOT NULL