FROM python:3.11-slim AS base

ENV PATH=/opt/venv/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=True
ENV PYTHONPATH=app
ENV PYTHONUNBUFFERED=True

RUN apt-get update && apt-get upgrade -y && apt-get clean

FROM base AS builder
RUN python -m venv /opt/venv
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip --requirement requirements.txt

FROM base
WORKDIR /app
COPY --from=builder /opt/venv /opt/venv
COPY app app

ARG PORT=5555
ENV PORT=$PORT
EXPOSE $PORT

ARG options
ENV OPTIONS=$options

CMD gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app