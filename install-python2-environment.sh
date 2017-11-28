#!/bin/bash

# Exit if an error occurs
set -e

# Create a Python 2.7 conda environment
conda create --yes --name python2 python=2.7

# Activate the environment
source activate python2

# Install base anaconda
conda install anaconda

# Install an IPython kernel in this environment
conda install ipykernel

# Install useful data science libraries
# Note: pynio currently supported only with Python 2
conda install --yes --channel conda-forge \
    xarray dask pynio pyngl \
    iris iris-grib \
    siphon metpy

# Register this kernel
ipython kernel install 
