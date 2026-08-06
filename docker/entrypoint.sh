#!/bin/sh
set -eu

umask 077

quality_guard_dir=/var/lib/grok2api-quality-guard
mkdir -p "${quality_guard_dir}"
chown grok2api:grok2api "${quality_guard_dir}"
chmod 0700 "${quality_guard_dir}"

chown grok2api:grok2api /app/config.yaml
chmod 0600 /app/config.yaml
RUN sed -i "s/replace-with-at-least-32-characters/${SECRET_KEY}/g" /app/config.yaml && \
    sed -i "s/replace-with-base64-key/${BASE64_KEY}/g" /app/config.yaml && \
    sed -i "s/replace-with-a-strong-password/${API_KEY}/g" /app/config.yaml
  
exec su-exec grok2api:grok2api "$@"
