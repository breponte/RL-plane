# mlagents requires specific version
FROM python:3.10.12-slim

WORKDIR /app
ENV PYTHONPATH=/app/src

# Install system dependencies for pymssql
RUN apt-get update && apt-get install -y \
    freetds-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run mlagents-learn to verify installation
CMD ["mlagents-learn", "--force"]