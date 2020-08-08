GCC=gcc
GCCOPTS="-Wall -std=gnu99 -fomit-frame-pointer -O2 -pthread"
LINKOPTS=""
/bin/rm -f *.exe *.s
$GCC $GCCOPTS -O2 -c outs.c
$GCC $GCCOPTS -O2 -c utils.c
$GCC $GCCOPTS -O2 -c litmus_rand.c
$GCC $GCCOPTS $LINKOPTS -o mp.exe outs.o utils.o litmus_rand.o mp.c
$GCC $GCCOPTS -S mp.c && awk -f show.awk mp.s > mp.t && /bin/rm mp.s
