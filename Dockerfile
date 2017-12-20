# Pin tag e1677043235c which works with reference docker deployment
FROM jupyter/datascience-notebook:033056e6d164

#### Python 3

# Install meteo-specific libs for Python 3
RUN conda install --yes --channel conda-forge \
    xarray dask iris siphon metpy

#### Python 2

# Create a Python 2.7 conda environment
RUN conda create --yes --name python2 python=2.7 anaconda

# Install IPython kernel for Python 2
RUN conda install --yes --name python2 --channel conda-forge ipykernel

# Reisger IPython kernel for Python 2
COPY register-python2-kernel.sh /tmp
RUN bash /tmp/register-python2-kernel.sh

# Install meteo-specific libs for Python 2
RUN conda install --yes --name python2 --channel conda-forge \
    xarray dask pynio pyngl \
    iris iris-grib \
    siphon metpy

# Downgrade pynio dependencies
RUN conda install --yes --name python2 --channel conda-forge \
    poppler=0.52.0 xerces-c==3.1.4


#### Add logo
COPY files/custom /home/jovyan/.jupyter/custom
