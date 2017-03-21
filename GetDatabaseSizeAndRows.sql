SELECT table_schema "Database Name", SUM(data_length+index_length)/1024/1024
"Database Size (MB)"  FROM information_schema.TABLES GROUP BY table_schema;

SELECT table_name "Table Name", table_rows "Rows Count", ROUND(((data_length + index_length)/1024/1024),2)
"Table Size (MB)" FROM information_schema.TABLES WHERE table_schema = "labtech";

