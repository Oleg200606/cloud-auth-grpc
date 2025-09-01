FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x scripts/generate_python.sh
RUN ./scripts/generate_python.sh

EXPOSE 50051

RUN useradd -m -u 1000 appuser
USER appuser

CMD ["python", "grpc_server.py"]