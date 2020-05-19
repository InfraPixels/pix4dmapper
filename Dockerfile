FROM ubuntu:16.04
WORKDIR /app

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:beineri/opt-qt562-xenial && \
    apt-get update -y && \
    apt-get install -y \
    libcurl3 libexpat1 libfontconfig1 libfreetype6 libgl1 \
    libgomp1 libpng12-0 libssl1.0.0 libtiff5  libx11-6 libxext6 \
    libxrandr2 libxrender1 \
        qt56base qt56declarative qt56location qt56svg qt56webchannel \
        qt56webengine qt56xmlpatterns
COPY . ./
RUN dpkg -i pix4dmapper_4.5.6_amd64.deb
RUN apt-get install -f
