GCC=gcc
GCCOPTS="-Wall -std=gnu99 -O2 -pthread"
LINKOPTS=""
/bin/rm -f *.exe *.s
$GCC $GCCOPTS -O2 -c outs.c
$GCC $GCCOPTS -O2 -c utils.c
$GCC $GCCOPTS -O2 -c litmus_rand.c
$GCC $GCCOPTS $LINKOPTS -o mp+rel+acq.exe outs.o utils.o litmus_rand.o mp+rel+acq.c
$GCC $GCCOPTS -S mp+rel+acq.c && awk -f show.awk mp+rel+acq.s > mp+rel+acq.t && /bin/rm mp+rel+acq.s
