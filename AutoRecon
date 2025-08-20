#!/usr/bin/env bash
# AutoRecon (A) – Ping sweep + nmap básico
# Uso: ./autorecon_a.sh 192.168.1
# Para entornos autorizados.

set -euo pipefail
NET="${1:-}"
[[ -z "$NET" ]] && { echo "Uso: $0 <prefijo_red>  (ej: 192.168.1)"; exit 1; }

LIVE_HOSTS=()
for i in $(seq 1 254); do
  IP="$NET.$i"
  if ping -c1 -W1 "$IP" &>/dev/null; then
    echo "[+] Host up: $IP"
    LIVE_HOSTS+=("$IP")
  fi
done

for IP in "${LIVE_HOSTS[@]}"; do
  echo -e "\n=== Escaneando $IP ==="
  nmap -Pn -sS -sV -T4 --top-ports 100 "$IP"
done
