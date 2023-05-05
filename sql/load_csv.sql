SET datestyle TO iso, ymd;

\COPY trips FROM ''../ data /trips.tsv '' DELIMITER E'\t' CSV HEADER NULL AS '""';
