date
LITMUSOPTS="${@:-$LITMUSOPTS}"
SLEEP=0
if [ ! -f mp.no ]; then
cat <<'EOF'
%%%%%%%%%%%%%%%%%%%%%%%%%
% Results for mp.litmus %
%%%%%%%%%%%%%%%%%%%%%%%%%
X86 mp
"PodWW Rfe PodRR Fre"

{}

 P0         | P1          ;
 MOV [x],$1 | MOV EAX,[y] ;
 MOV [y],$1 | MOV EBX,[x] ;

exists (1:EAX=1 /\ 1:EBX=0)
Generated assembler
EOF
cat mp.t
./mp.exe -q $LITMUSOPTS
fi
sleep $SLEEP

cat <<'EOF'
Revision exported, version 7.56
Command line: litmus7 -o mp.litmus.tar mp.litmus
Parameters
#define SIZE_OF_TEST 100000
#define NUMBER_OF_RUN 10
#define AVAIL 1
#define STRIDE (-1)
#define MAX_LOOP 0
/* gcc options: -Wall -std=gnu99 -fomit-frame-pointer -O2 -pthread */
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
