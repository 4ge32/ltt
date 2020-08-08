date
LITMUSOPTS="${@:-$LITMUSOPTS}"
SLEEP=0
if [ ! -f mp+dmb.sys.no ]; then
cat <<'EOF'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Results for mp+dmb.sys.litmus %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AArch64 mp+dmb.sys
"DMB.SYdWW Rfe DMB.SYdRR Fre"

{0:X1=x; 0:X3=y; 1:X1=y; 1:X3=x;}

 P0          | P1          ;
 MOV W0,#1   | LDR W0,[X1] ;
 STR W0,[X1] | DMB SY      ;
 DMB SY      | LDR W2,[X3] ;
 MOV W2,#1   |             ;
 STR W2,[X3] |             ;

exists (1:X0=1 /\ 1:X2=0)
Generated assembler
EOF
cat mp+dmb.sys.t
./mp+dmb.sys.exe -q $LITMUSOPTS
fi
sleep $SLEEP

cat <<'EOF'
Revision exported, version 7.56
Command line: litmus7 -o mp+dmb.sys.litmus.tar mp+dmb.sys.litmus
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
