# Analysis Agent

## Overview

The LLM-SQL interactions will be handled using SQL MCP Server to interact with the Azure SQL database.
Ollama will be used to run localized LLMs to avoid costs of using agentic AI like Claude Code, Codex, etc.
Docker will be used for ease of build and tear down, containerizing the SQL MCP Server, Ollama, etc.
This analysis agent is implemented in [db](../db/) folder of this project.

The following image descibes the architecture of how the analysis agent is implemented.

![Pipeline](./media/sql-llm-pipeline.png)

The pipeline is as follows:
1. The user sends a question to the mcphost.
2. Before the LLM receives the question, the mcphost appends the available tools for the LLM to use.
3. With the question and available tools, the LLM will build a JSON containing the tools it wants to use as well as what information it wants to query for. 
4. The mcphost passes that information to the SQL MCP Server which will convert that into literal SQL code and query the database.
5. The database will respond with the queried information and the information is passed back through the modules back to the LLM.
6. The LLM will format the answer to be more conversational and then send it back to the user.

If using Claude Code, Codex, or other agentic AI that has access to its own suite of MCP tools, only the SQL MCP Server would be needed.

## Setup

There are some nuances with using Docker and Ollama's computation.
Certain hardware has difficulty using the GPUs when using Ollama and Docker. 
Therefore, there will be two different setups to address these hardware difference.
The main setup instructions will use Docker for everything, but the secondary
setup instructions will require users to locally install and setup Ollama on
their own devices.

### Fully Dockerized

Check the [secondary setup instructions](#native-ollama--dockerized-sql-mcp-server) to see if you need to install Ollama natively.

TODO

### Native Ollama + Dockerized SQL MCP Server

Some of the hardware that potentially requires native Ollama include:
- Mac + Docker
- AMD GPU + WSL2
- AMD GPU on Windows

This is not an exhaustive list and has not been thoroughly tested, but is a potential solution in case the full dockerization does not work.

TODO