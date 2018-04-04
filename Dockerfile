# Pin tag e1677043235c which works with reference docker deployment
FROM jupyter/datascience-notebook:033056e6d164

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
    xarray dask pynio \
    iris iris-grib \
    siphon metpy

# Install PyNGL as per http://mailman.ucar.edu/pipermail/pyngl-talk/2017-December/000214.html
RUN conda install --yes --name python2 \
    --channel conda-forge \
    --channel conda-forge/label/broken pyngl \
    poppler=0.52.0 xerces-c==3.1.4 gsl

#### Python 3

# Install meteo-specific libs for Python 3
RUN conda install --yes --channel conda-forge \
    xarray dask iris siphon metpy

# Install dataviz libraries
RUN conda install --yes --channel conda-forge \
    cartopy bokeh ipywidgets ipyleaflet appmode

RUN pip install -e git+https://github.com/weatherforce/geojsoncontour.git#egg=geojsoncontour
