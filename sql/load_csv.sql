SET datestyle TO iso, ymd;

\COPY trips FROM 'data/train.csv' DELIMITER ',' CSV HEADER NULL AS 'null';