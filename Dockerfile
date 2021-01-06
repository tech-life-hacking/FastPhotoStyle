FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ENV ANACONDA /opt/anaconda3
ENV CUDA_PATH /usr/local/cuda
ENV PATH ${ANACONDA}/bin:${CUDA_PATH}/bin:$PATH
ENV LD_LIBRARY_PATH ${ANACONDA}/lib:${CUDA_PATH}/bin64:$LD_LIBRARY_PATH
ENV C_INCLUDE_PATH ${CUDA_PATH}/include
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    wget \
    axel \
    imagemagick \
    libopencv-dev \
    python-opencv \
    build-essential \
    cmake \
    git \
    curl \
    ca-certificates \
    libjpeg-dev \
    libpng-dev \
    axel \
    zip \
    unzip
RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -P /tmp
RUN bash /tmp/Anaconda3-5.0.1-Linux-x86_64.sh -b -p $ANACONDA
RUN rm /tmp/Anaconda3-5.0.1-Linux-x86_64.sh -rf
RUN conda install pytorch==1.5.0 torchvision==0.6.0 cudatoolkit=10.2 -c pytorch
RUN pip install -U pip
RUN pip install scikit-build cmake
RUN pip install opencv-python
RUN pip install scikit-umfpack
RUN pip install cupy-cuda102
RUN pip install pynvrtc
RUN pip install scipy==1.2.0
RUN pip install labelme