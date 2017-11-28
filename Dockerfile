# Pin tag e1677043235c which works with reference docker deployment
FROM jupyter/datascience-notebook:latest

RUN conda install --yes --channel conda-forge \
    xarray dask iris siphon metpy

COPY install-python2-environment.sh /tmp
RUN bash /tmp/install-python2-environment.sh
