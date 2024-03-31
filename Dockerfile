# syntax=docker/dockerfile:1
# =========================

ARG PYTHON_VERSION=3.11.8
FROM python:${PYTHON_VERSION}-slim as base
LABEL maintainer="Vedansh <https://github.com/offensive-vk>"
LABEL repository_name="AwesomeScripts"
LABEL url="https://github.com/offensive-vk/AwesomeScripts"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

USER appuser
COPY . .
EXPOSE 8000
CMD ["python" ,"main.py"]
# =========================