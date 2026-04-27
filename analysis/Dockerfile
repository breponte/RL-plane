FROM python:3.11-slim

WORKDIR /app
ENV PYTHONPATH=/app/src

# Install system dependencies for pymssql
RUN apt-get update && apt-get install -y \
    freetds-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Open port 8000 for OpenWebUI to send HTTP to stdin
EXPOSE 8000

# Run the MCP-to-OpenAPI proxy server to connect OpenWebUI HTTP requests to MCP server's stdin
# Run the MCP server
CMD ["mcpo", "--host", "0.0.0.0", "--port", "8000", "--api-key", "top-secret", "--", \
    "python", "-m", "mssql_mcp_server"]