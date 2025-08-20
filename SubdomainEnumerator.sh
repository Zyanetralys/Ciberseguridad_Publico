#!/usr/bin/env bash
# subenum_a.sh – Enumerador básico de subdominios
# Uso: ./subenum_a.sh ejemplo.com

DOMAIN="$1"
SUBS=("www" "mail" "ftp" "dev" "test" "admin")

for s in "${SUBS[@]}"; do
    dig +short "$s.$DOMAIN"
done
