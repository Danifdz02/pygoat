FROM python:3.11-slim

WORKDIR /app

# Instalar dependencias básicas (sin versiones fijas)
RUN apt-get update && apt-get install -y \
    dnsutils \
    libpq-dev \
    python3-dev \
    && apt-get clean

# Copiar proyecto
COPY . .

# Instalar dependencias Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt || true

EXPOSE 8000

CMD ["python", "pygoat.py"]
