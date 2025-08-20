#!/usr/bin/env bash
# Secret Hunter (A) – Greps de alto valor
# Uso: ./secrets_a.sh /ruta/proyecto

set -euo pipefail
DIR="${1:-.}"
cd "$DIR"

PATTERNS=(
  "aws_access_key_id"
  "aws_secret_access_key"
  "apikey"
  "api_key"
  "authorization:"
  "password"
  "passwd"
  "private_key"
  "BEGIN RSA PRIVATE KEY"
  "BEGIN OPENSSH PRIVATE KEY"
  "google_api_key"
  "slack_token"
  "token"
  "secret"
)

for p in "${PATTERNS[@]}"; do
  echo -e "\n=== Pattern: $p ==="
  rg -n --hidden -S -i "$p" || true
done
