#!/usr/bin/env bash
# dir_fuzzer_a.sh – Prueba directorios comunes
# Uso: ./dir_fuzzer_a.sh ejemplo.com

DOMAIN="$1"
DIRS=("admin" "backup" "test" "dev")

for d in "${DIRS[@]}"; do
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" "http://$DOMAIN/$d/")
    echo "http://$DOMAIN/$d/ -> $STATUS"
done
