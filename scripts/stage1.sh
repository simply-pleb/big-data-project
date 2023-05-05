#!/bin/bash
#!/bin/bash

# Draft: Create the table
# TODO: Note: Do not forget, that the file .sql should not return errors when you run it for the second time, 
#       so you should clear/drop the objects before creating new database objects.

# PostgreSQL connection details
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="project"
DB_USER="postgres"
DB_PASSWORD="your_password" # TODO: change password

# SQL statement to create the table
SQL_STATEMENT="
CREATE TABLE IF NOT EXISTS trips (
    trip_id VARCHAR(30) PRIMARY KEY,
    call_type VARCHAR(10) NOT NULL,
    origin_call INTEGER NULL,
    origin_stand INTEGER NULL,
    taxi_id INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    day_type VARCHAR(10) NOT NULL,
    missing_data BOOLEAN NOT NULL,
    polyline TEXT NOT NULL
);
"

# Create the database
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c "CREATE DATABASE $DB_NAME;" || exit 1

# Connect to the database
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c "$SQL_STATEMENT" || exit 1

echo "Database and table created successfully."

# TODO: Add the constraints.

# TODO: Load data from csv files.
PGPASSWORD=$DB_PASSWORD psql -U $DB_USER -d $DB_NAME -f sql/load_csv.sql
