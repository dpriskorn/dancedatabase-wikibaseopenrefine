# Stage 1: Builder
FROM python:3.9-slim AS builder

WORKDIR /openrefine-wikibase

COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM python:3.9-slim

COPY --from=builder /install /usr/local

WORKDIR /openrefine-wikibase
ADD . .

EXPOSE 8000
CMD ["python", "app.py"]