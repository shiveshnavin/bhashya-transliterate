FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

# Install system deps
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install LibreTranslate with HF support
RUN pip install --no-cache-dir libretranslate[all]

# Expose default port
EXPOSE 5000

# Run with HuggingFace backend
CMD ["libretranslate", \
     "--host", "0.0.0.0", \
     "--port", "5000", \
     "--backend", "transformers"]
