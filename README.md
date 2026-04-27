# RL-plane

## Components

### Plane Simulator in Unity

The plane simulator is developed using Unity 3D. _The plane simulator implementation is not nested within this repository_. The link to the separate repository containing the code can be found at https://github.com/breponte/Plane-Simulator.

### Reinforcement Learning Agent

TODO

### Database

The database is hosted on the cloud through Microsoft Azure. Privileges are handled by this repository's owner, `breponte`. Because of cloud hosting, there is no folder within this repository containing any local data. To access the database via VSCode, refer to the documentation [here](./docs/database.md).

### Learning Analysis Agent

The Learning Analysis Agent implementation uses Ollama + OpenWebUI connected to a SQL MCP Server. Everything resides within Docker containers. The implementation is found within the [analysis folder](./analysis/).

## Setup

TODO

## References

### Plane Simulator

We used several videos to help with implementation and inspiration for the plane simulator:
- [Simple Physics Based Plane Controller in Unity](https://www.youtube.com/watch?v=fThb5M2OBJ8)
- [Creating a Flight Simulator in Unity3D Part 1: Flight](https://github.com/vazgriz/FlightSim)

### Learning Analysis Agent

We used several resouces in implementing the Learning Analysis Agent. For the localized model and interface, we used Ollama + OpenWebUI with the help of the following article:
- https://www.bitdoze.com/ollama-docker-install/

For communication between the localized model and the Azure SQL database we needed a SQL MCP Server, so we decided on using the following repository's setup and implementation for our use:
- https://github.com/RichardHan/mssql_mcp_server#