# Analysis

This folder includes all interactivity with the database hosted on Azure.
Primarily the analysis agent implementation using Ollama and SQL MCP Server
via Docker.

Since the database is hosted on the cloud, there is no implementation or interface
within this repository, but instead by VSCode `SQL Server (mssql)` extension.
The `docker-compose.yaml` file contains several services that host the different software
needed for the analysis agent.

## Ollama + OpenWebUI Service

Credit to https://www.bitdoze.com/ollama-docker-install/ for providing the boilerplate for
the Docker containers running Ollama and OpenWebUI.

### Setup

Ollama can run on either the CPU or GPU (NVIDIA). Although AMD GPY is supported, it is not within
the scope of this project. Instructions for that are provided in the credited article. In order to run the local LLM and chat UI on either CPU or GPU, open Docker Desktop then run either of the following commands in a terminal:

```
docker compose --profile cpu up
# OR
docker compose --profile nvidia up
```

Once the container is fully running, open up OpenWebUI through http://localhost:3000 in order to access the Ollama models.

Once logged in, there won't initially be any models loaded, so you must load them manually. Navigate to `Profile > Admin Panel > Settings > Models > Manage` and visit Ollama's page to see
downloadable models. The video shows where to how to navigate.

<video src="../docs/media/ollama-model.mp4" width="640" controls></video>

### Teardown

Docker commands work across various shells. In order to completely clean up the Docker containers, run the following shell commands.

```
docker network disconnect --force analysis_app-net ollama
docker network disconnect --force analysis_app-net openwebui
docker rm -f ollama openwebui
docker compose down
```

## [mssql_mcp_server](/mssql_mcp_server) Service

Credit to https://github.com/RichardHan/mssql_mcp_server# for providing the source code for this software.

The `/mssql_mcp_server` folder contains Python files for managing the SQL MCP Server module, which
is used by our `docker-compose.yaml` and `Dockerfile` to containerize it.