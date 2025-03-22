# Stage 1
FROM python:3.9-slim as builder
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2
FROM python:3.9-slim
WORKDIR /app

COPY --from=builder /install /usr/local

COPY . .

CMD ["python", "main.py"]