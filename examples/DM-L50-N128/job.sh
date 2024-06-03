#!/bin/bash -l

if [[ -n $_CONDOR_SCRATCH_DIR ]]; then
    # the condor system creates a scratch directory for us,
    # and cleans up afterward
    echo "using condor scratch at $_CONDOR_SCRATCH_DIR"
    tmpdir=$_CONDOR_SCRATCH_DIR
    export TMPDIR=$tmpdir
else
    # otherwise use the TMPDIR
    echo "using my tmp dir at $TMPDIR"
    tmpdir=$TMPDIR
fi

echo
echo "Current working directory is `pwd`"
echo

mpiexec -np 16 ./Gadget4 param.txt 1

