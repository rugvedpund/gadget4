

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
   conda create -n gadget conda python=3.9 gxx_linux-64 mpich-mpicxx libgcc zlib
   ```
1. Clone this repo. It has some changes to allow for automatic installation of the latest prerequisite libraries.
   ```bash
   git clone https://github.com/rugvedpund/gadget4.git
   cd gadget4/
   ```
1. Go to the buildsystem directory and compile the prerequisites:
   ```bash
   cd buildsystem/
   make -f Makefile.lib
   ```
   This will download and compile all the gadget4 dependencies in buildsystem/extlibs. Ignore warnings from hdf5.
1. Go back to the gadget4 directory and compile
   ```bash
   cd ../
   make
   ```
1. Done!
