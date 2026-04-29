import pymssql
import os
import time
import sys

for attempt in range(10):
    try:
        conn = pymssql.connect(
            server=os.environ['MSSQL_SERVER'],
            user=os.environ['MSSQL_USER'],
            password=os.environ['MSSQL_PASSWORD'],
            database=os.environ['MSSQL_DATABASE'],
        )
        cur = conn.cursor()
        cur.execute('SELECT 1')
        cur.fetchone()
        conn.close()
        print(f'Azure SQL warmed up on attempt {attempt + 1}', flush=True)
        sys.exit(0)
    except Exception as e:
        print(f'Attempt {attempt + 1} failed: {e}, retrying in 30s...', flush=True)
        time.sleep(30)

print('Failed to warm up after 10 attempts', flush=True)
sys.exit(1)