@echo off

echo Connecting to Oracle database... > result.log

sqlplus mbuser87/1q2w3e4r@Ora4523 @create_tables.sql >> result.log

echo Tables created successfully! >> result.log

echo Loading data from CSV files... >> result.log

sqlplus mbuser87/1q2w3e4r@Ora4523 @load_data.sql >> result.log

echo Data loaded successfully! >> result.log

pause
