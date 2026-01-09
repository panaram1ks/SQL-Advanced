#!/bin/bash
set -e

FLAG_FILE="/var/opt/mssql/.restored"

/opt/mssql/bin/sqlservr &

echo "⏳ Waiting for SQL Server..."

until /opt/mssql-tools18/bin/sqlcmd \
  -S localhost \
  -U sa \
  -P "$MSSQL_SA_PASSWORD" \
  -C \
  -Q "SELECT 1" &> /dev/null
do
  sleep 5
done

echo "✅ SQL Server is ready"

if [ ! -f "$FLAG_FILE" ]; then
  echo "📦 Restoring database..."

  /opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -C \
    -i /scripts/restore-database.sql

  echo "✅ Restore completed successfully"
  touch "$FLAG_FILE"
else
  echo "ℹ Restore already done, skipping"
fi

wait
