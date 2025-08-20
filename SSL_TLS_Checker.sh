#!/usr/bin/env bash
# ssl_check_a.sh – Muestra información básica del certificado
# Uso: ./ssl_check_a.sh ejemplo.com

HOST="$1"

if [[ -z "$HOST" ]]; then
    echo "Uso: $0 <host>"
    exit 1
fi

echo "[*] Verificando SSL/TLS de $HOST..."
echo | openssl s_client -connect "$HOST:443" 2>/dev/null | openssl x509 -noout -dates -issuer -subject
