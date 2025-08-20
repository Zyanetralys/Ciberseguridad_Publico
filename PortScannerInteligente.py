#!/usr/bin/env python3
# port_scanner_a.py – Escaneo rápido de puertos comunes
# Uso: python3 port_scanner_a.py 127.0.0.1

import socket, sys

HOST = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
PORTS = [22, 80, 443, 3389, 3306, 8080]

print(f"[*] Escaneando {HOST}...")
for p in PORTS:
    sock = socket.socket()
    sock.settimeout(0.5)
    if sock.connect_ex((HOST, p)) == 0:
        print(f"[+] Puerto abierto: {p}")
    sock.close()
