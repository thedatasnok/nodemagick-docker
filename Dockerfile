FROM node:lts-alpine

RUN apk add --no-cache \
        shadow \
        autoconf \
        g++ \
        make \
        git \
        glib \
        glib-dev \ 
        curl \ 
        libpng-dev \
        libxml2-dev

RUN git clone https://github.com/carlobaldassi/liblqr && \
  cd liblqr && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -R liblqr

RUN curl https://codeload.github.com/ImageMagick/ImageMagick/tar.gz/7.1.0-62 | tar -xz && \
  cd ImageMagick-7.1.0-62 && \
  ./configure --with-lqr && \
  make && \
  make install && \
  cd .. && \
  rm -R ImageMagick-7.1.0-62

LABEL org.opencontainers.image.source="https://github.com/thedatasnok/nodemagick-docker"
LABEL org.opencontainers.image.description="Node LTS with ImageMagick and liblqr"
LABEL org.opencontainers.image.licenses="MIT"
