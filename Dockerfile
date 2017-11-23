# Pin tag 82b978b3ceeb to get Python 2, which has since been removed
FROM jupyter/datascience-notebook:82b978b3ceeb

RUN conda install --channel conda-forge \
    xarray dask iris siphon metpy

RUN conda install --channel conda-forge --name python2 \
    xarray dask pynio \
    iris iris-grib \
    siphon metpy pynio 
