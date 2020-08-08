GCC=gcc
GCCOPTS="-Wall -std=gnu99 -O2 -pthread"
LINKOPTS=""
/bin/rm -f *.exe *.s
$GCC $GCCOPTS -O2 -c outs.c
$GCC $GCCOPTS -O2 -c utils.c
$GCC $GCCOPTS -O2 -c litmus_rand.c
$GCC $GCCOPTS $LINKOPTS -o IRIW+addrs.exe outs.o utils.o litmus_rand.o IRIW+addrs.c
$GCC $GCCOPTS -S IRIW+addrs.c && awk -f show.awk IRIW+addrs.s > IRIW+addrs.t && /bin/rm IRIW+addrs.s
