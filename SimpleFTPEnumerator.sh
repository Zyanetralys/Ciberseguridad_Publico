#!/usr/bin/env bash
# ftp_enum_a.sh – Recon FTP simple (educativo)
# Uso: ./ftp_enum_a.sh 192.168.1.100

HOST="$1"

if [[ -z "$HOST" ]]; then
    echo "Uso: $0 <IP_FTP>"
    exit 1
fi

echo "[*] Listando archivos FTP en $HOST..."
ftp -inv "$HOST" <<EOF
user anonymous ""
ls
bye
EOF
