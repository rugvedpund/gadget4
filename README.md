

GADGET-4
========

![](documentation/img/top.jpg)

GADGET-4 is a massively parallel code for N-body/hydrodynamical
cosmological simulations. It is a flexible code that can be applied to
a variety of different types of simulations, offering a number of
sophisticated simulation algorithms.  An account of the numerical
algorithms employed by the code is given in the original code paper,
subsequent publications, and this documentation.

GADGET-4 was written mainly by
[Volker Springel](mailto:vspringel@mpa-garching.mpg.de), with
important contributions and suggestions being made by numerous people,
including [Ruediger Pakmor](mailto:rpakmor@mpa-garching.mpg.de),
[Oliver Zier](mailto:ozier@mpa-garching.mpg.de), and
[Martin Reinecke](mailto:martin@mpa-garching.mpg.de).


Documentation
=============

For documentation of the code as well as the code paper, please refer
to the [code's web-site](https://wwwmpa.mpa-garching.mpg.de/gadget4).


Instructions for BNL Astro Cluser
=================================

This is how I got it to compile since the default modules are outdated.

1. Create your dir in astro workarea `/gpf02/astro/workarea/yourusername`:
   ```bash
   mkdir /gpfs02/astro/workarea/yourusername
   cd /gpfs02/astro/workarea/yourusername
   ```
1. Make a miniconda folder in your workarea to install all prerequisites. Your home folder has very little space.
   ```bash
   mkdir -p miniconda3
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
   bash miniconda3/miniconda.sh -b -u -p miniconda3
   rm -rf miniconda3/miniconda.sh
   ```
   Follow instructions and ensure ```conda info``` makes sense. You might need to ```source ~/.bashrc``` here.
1. Create a new env for gadget and install dependencies
   ```bash
   conda create -n gadget -c conda-forge python=3.9 mpich-mpicxx gsl fftw hdf5 libhwloc zlib
   conda activate gadget
   ```
1. Clone this repo. It has some changes to address an older glibc on BNL astro cluster
   ```bash
   git clone https://github.com/rugvedpund/gadget4.git
   ```
1. We can now try compiling. This is just a test compile to check if everything works.
   ```bash
   cd gadget4/
   make DIR=examples/test
   ```
   Note that this directory is a copy of the official examples/DM-L50-N128, except the Config.sh file has an extra `OLDSTYLE_SHARED_MEMORY_ALLOCATION` flag. The Config.sh file should not be modified after compiling. If a different Config.sh is needed, it is recommended to create a new directory with the newConfig.sh and run make in that dir. For more details on the recommended practices, refer to the [code's web-site](https://wwwmpa.mpa-garching.mpg.de/gadget4).
1. We can now run the executable with the included params.txt (and outputs.txt, which is called internally for saving snapshots). We will run this directly on the login node for now.
   ```bash
   cd examples/test
   mpiexec -np 8 ./Gadget4 params.txt 0
   ```
   Note that the params.txt can be modified and the code can be rerun, just ensure that the output of any previous runs is cleared. The code will save a copy of the params.txt as parameters-usedvalues with every output for later reference. 
