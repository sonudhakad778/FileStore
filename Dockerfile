# Don't Remove Credit @VJ_Bots
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10-slim-bullseye

# Install system dependencies
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /VJ-File-Store

# Copy requirements first (better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start bot
CMD ["python", "bot.py"]
