# ---- Stage 1: Builder (install only non-heavy runtime deps) ----
FROM python:3.11-slim AS builder

WORKDIR /app

# Install system deps needed for building Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        build-essential \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Copy only dependency file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/pip/*

# ---- Stage 2: Final Runtime Image ----
FROM python:3.11-slim AS runtime

WORKDIR /app

# Install minimal runtime system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
    && rm -rf /var/lib/apt/lists/*

# Copy installed Python packages from builder
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy project files
COPY . .

# Optional: install CPU-only torch (if not included in requirements.txt)
RUN pip install --no-cache-dir torch==2.9.1 \
    --index-url https://download.pytorch.org/whl/cpu

ENTRYPOINT ["python", "-m", "bsort.cli"]
