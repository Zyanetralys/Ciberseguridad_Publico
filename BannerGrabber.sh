#!/usr/bin/env bash
# banner_grabber_a.sh – Obtiene banners simples de servicios
# Uso: ./banner_grabber_a.sh 127.0.0.1 80

HOST="$1"
PORT="$2"

if [[ -z "$HOST" || -z "$PORT" ]]; then
    echo "Uso: $0 <IP> <PUERTO>"
    exit 1
fi

echo "[*] Conectando a $HOST:$PORT..."
echo -e "\n" | nc -w 3 "$HOST" "$PORT"
