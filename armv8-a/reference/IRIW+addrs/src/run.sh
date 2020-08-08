date
LITMUSOPTS="${@:-$LITMUSOPTS}"
SLEEP=0
if [ ! -f IRIW+addrs.no ]; then
cat <<'EOF'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Results for IRIW+addrs.litmus %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AArch64 IRIW+addrs
"Rfe DpAddrdR Fre Rfe DpAddrdR Fre"

{0:X1=x; 1:X1=x; 1:X4=y; 2:X1=y; 3:X1=y; 3:X4=x;}

 P0          | P1                  | P2          | P3                  ;
 MOV W0,#1   | LDR W0,[X1]         | MOV W0,#1   | LDR W0,[X1]         ;
 STR W0,[X1] | EOR W2,W0,W0        | STR W0,[X1] | EOR W2,W0,W0        ;
             | LDR W3,[X4,W2,SXTW] |             | LDR W3,[X4,W2,SXTW] ;

exists (1:X0=1 /\ 1:X3=0 /\ 3:X0=1 /\ 3:X3=0)
Generated assembler
EOF
cat IRIW+addrs.t
./IRIW+addrs.exe -q $LITMUSOPTS
fi
sleep $SLEEP

cat <<'EOF'
Revision exported, version 7.56
Command line: litmus7 -o IRIW+addrs.litmus.tar IRIW+addrs.litmus
Parameters
#define SIZE_OF_TEST 100000
#define NUMBER_OF_RUN 10
#define AVAIL 1
#define STRIDE (-1)
#define MAX_LOOP 0
/* gcc options: -Wall -std=gnu99 -O2 -pthread */
/* barrier: user */
/* launch: changing */
/* affinity: none */
/* alloc: dynamic */
/* memory: direct */
/* safer: write */
/* preload: random */
/* speedcheck: no */
EOF
head -1 comp.sh
echo "LITMUSOPTS=$LITMUSOPTS"
date
