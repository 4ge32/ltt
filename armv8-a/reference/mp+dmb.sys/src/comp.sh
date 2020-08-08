GCC=gcc
GCCOPTS="-Wall -std=gnu99 -O2 -pthread"
LINKOPTS=""
/bin/rm -f *.exe *.s
$GCC $GCCOPTS -O2 -c outs.c
$GCC $GCCOPTS -O2 -c utils.c
$GCC $GCCOPTS -O2 -c litmus_rand.c
$GCC $GCCOPTS $LINKOPTS -o mp+dmb.sys.exe outs.o utils.o litmus_rand.o mp+dmb.sys.c
$GCC $GCCOPTS -S mp+dmb.sys.c && awk -f show.awk mp+dmb.sys.s > mp+dmb.sys.t && /bin/rm mp+dmb.sys.s
