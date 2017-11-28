#!/bin/bash

# Exit if an error occurs
set -e

# Create a Python 2.7 conda environment
conda create --yes --name python2 python=2.7 anaconda

# Install useful data science libraries
# Note: pynio currently supported only with Python 2
conda install --yes --name python2 --channel conda-forge \
    xarray dask pynio pyngl \
    iris iris-grib \
    siphon metpy \
    # Install an IPython kernel in this environment
    ipykernel

# Activate the environment
source activate python2

# Register this kernel
ipython kernel install 
