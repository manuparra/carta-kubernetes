FROM ubuntu:22.04

ENV CARTA_AUTH_TOKEN CARTA_TEST
ENV CARTAROOTFOLDER /images/

# Install the basic packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y apt-utils autoconf bison build-essential cmake curl fftw3-dev flex gcc g++ \
    gdb gfortran git git-lfs libgmock-dev googletest libblas-dev libcfitsio-dev \
    libgsl-dev libgtest-dev libhdf5-dev liblapack-dev libncurses-dev \
    libprotobuf-dev libpugixml-dev libreadline-dev libssl-dev libstarlink-ast-dev \
    libtool libxml2-dev libxslt1-dev libzstd-dev pkg-config protobuf-compiler \
    python3-numpy python3-astropy software-properties-common unzip wcslib-dev wget uuid-dev

# Get carta dependencies carta-casacore, fits2idia, and zfp from the cartavis-team PPA
RUN \
  add-apt-repository -y ppa:cartavis-team/carta-testing && \
  apt-get update && \
  apt-get -y install carta-casacore-dev fits2idia libzfp-dev

# Install carta within the carta-backend
RUN apt-get -y install carta

# carta images folder set-up
RUN mkdir ${CARTAROOTFOLDER} 
WORKDIR ${CARTAROOTFOLDER}
COPY ./NVSS_M51.fits ${CARTAROOTFOLDER}

# Default port for carta
EXPOSE 3002

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD carta --no_browser ${CARTAROOTFOLDER}