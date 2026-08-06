#!/bin/sh
set -eu

umask 077

sed -i "s|replace-with-at-least-32-characters|${SECRET_KEY}|g" /app/config.yaml
sed -i "s|replace-with-base64-key|${BASE64_KEY}|g" /app/config.yaml
sed -i "s|replace-with-a-strong-password|${API_KEY}|g" /app/config.yaml 

exec "$@"
