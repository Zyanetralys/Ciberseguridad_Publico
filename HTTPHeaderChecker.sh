#!/usr/bin/env bash
# http_header_checker_a.sh – Obtiene headers HTTP simples
# Uso: ./http_header_checker_a.sh ejemplo.com

DOMAIN="$1"

if [[ -z "$DOMAIN" ]]; then
    echo "Uso: $0 <dominio>"
    exit 1
fi

echo "[*] Obteniendo headers de $DOMAIN..."
curl -I -s "$DOMAIN"
