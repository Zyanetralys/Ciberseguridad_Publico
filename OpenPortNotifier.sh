#!/usr/bin/env bash
# port_notifier_a.sh – Avísame si un puerto está abierto
# Uso: ./port_notifier_a.sh 127.0.0.1 22

HOST="$1"
PORT="$2"

nc -z -w 2 "$HOST" "$PORT" && echo "[+] Puerto $PORT abierto" || echo "[-] Puerto $PORT cerrado"
