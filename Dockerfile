FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y libav-tools \
    python-numpy \
    python-scipy \
    python-setuptools \
    python-pip \
    libpq-dev \
    libjpeg-dev \
    curl \
    cmake \
    swig \
    python-opengl \
    libboost-all-dev \
    libsdl2-dev \
    wget \
    unzip \
    git \
    golang \
    net-tools \
    iptables \
    libvncserver-dev \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/bin/pip /usr/local/bin/pip \
    && ln -sf /usr/bin/python /usr/local/bin/python \
    && pip install -U pip

# Install gym
RUN pip install gym[all]==0.8.1

# RUN pip install nupic
# RUN pip install htmresearch


# Get the faster VNC driver
RUN pip install go-vncdriver>=0.4.0

# Install pytest (for running test cases)
RUN pip install pytest

# Force the container to use the go vnc driver
ENV UNIVERSE_VNCDRIVER='go'

WORKDIR /usr/local/universe/

# Cachebusting
COPY ./universe/setup.py ./
COPY ./universe/tox.ini ./

RUN pip install -e .

# Upload our actual code
COPY ./universe ./

# NEW
COPY ./numenta/htmresearch ./numenta/htmresearch
COPY ./numenta/htmresearch-core ./numenta/htmresearch-core
COPY ./numenta/nupic ./numenta/nupic
COPY ./numenta/nupic-core ./numenta/nupic-core
COPY ./my-neural-net/src ./my-neural-net/src

ENV NUPIC_CORE=/usr/local/universe/numenta/nupic.core
ENV HTMRESEARCH_CORE=/usr/local/universe/numenta/htmresearch-core
ENV PYTHONPATH=$PYTHONPATH:/usr/local/universe/my_neural_net/


# Just in case any python cache files were carried over from the source directory, remove them
RUN pyclean .
