# Database

This folder includes all interactivity with the database hosted on Azure.
Primarily the analysis agent implementation using Ollama and SQL MCP Server
via Docker.

Since the database is hosted on the cloud, there is no implementation or interface
within this repository, but instead by VSCode `SQL Server (mssql)` extension.

## [mssql_mcp_server](/mssql_mcp_server)

The `/mssql_mcp_server` folder contains Python files for managing the SQL MCP Server module, which
is used by our `docker-compose.yaml` and `Dockerfile` to containerize it. The source of this code
is found at https://github.com/RichardHan/mssql_mcp_server#.