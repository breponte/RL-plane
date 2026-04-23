# RL-plane

## Database (`plane`)

MySQL 8 is defined in [db/compose.yaml](db/compose.yaml). From the `db` directory (so `.env` and paths resolve):

```powershell
docker compose up -d
```

On **first** startup with an empty data volume, [db/schema.sql](db/schema.sql) is applied automatically via `/docker-entrypoint-initdb.d`.

If the volume **already exists** (compose has run before), init scripts do **not** run again. Apply or update schema manually from the repository root:

```powershell
Get-Content db/schema.sql | docker exec -i db-db-1 mysql -uroot -p
```

If your shell’s current directory is `db`, use `./schema.sql` instead of `db/schema.sql`. Enter the root password from `db/.env` when prompted. Alternatively use `-pYourPassword` (avoid in shared environments).

Verify:

```sql
USE plane;
SHOW TABLES;
DESCRIBE learning_data;
DESCRIBE hyperparameters;
```
# RL-plane

## Plane Simulator in Unity

References:
- [Simple Physics Based Plane Controller in Unity](https://www.youtube.com/watch?v=fThb5M2OBJ8)
- [Creating a Flight Simulator in Unity3D Part 1: Flight](https://github.com/vazgriz/FlightSim)
