FROM node:16

ENV DCMTK_VERSION=dcmtk-3.6.6
ENV DCMTK_RELEASE=dcmtk366
ENV DCMTK_PREFIX=/opt/${DCMTK_RELEASE}
ENV PATH=$PATH:${DCMTK_PREFIX}/bin:/opt/conda/bin

RUN apt-get update && apt-get install -y build-essential \
                                         cmake  \
                                         dcm2niix \
                                         pigz \
                                         wget \
                                         vim \
                                         libpng-dev \
                                         libtiff5-dev \
                                         libxml2-dev  \
                                         libjpeg62-turbo-dev \
                                         zlib1g-dev  \
                                         libwrap0-dev \
                                         libssl-dev
# Releases are here http://dicom.offis.de/download/dcmtk/
RUN wget --no-dns-cache --no-check-certificate http://dicom.offis.de/download/dcmtk/${DCMTK_RELEASE}/${DCMTK_VERSION}.tar.gz && \
    tar xzvf ${DCMTK_VERSION}.tar.gz && \
    cd ${DCMTK_VERSION} && \
    cmake -DCMAKE_INSTALL_PREFIX=${DCMTK_PREFIX} && \
    make all && \
    make install
