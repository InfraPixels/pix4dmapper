FROM ubuntu:16.04
WORKDIR /app

RUN echo deb http://ppa.launchpad.net/beineri/opt-qt562-xenial/ubuntu xenial main > /etc/apt/sources.list.d/beineri.list
RUN apt-get update -y --allow-unauthenticated
RUN apt-get install -y --allow-unauthenticated libcurl3 libexpat1 libfontconfig1 libfreetype6 libgl1 \
    libgomp1 libpng12-0 libssl1.0.0 libtiff5  libx11-6 libxext6 \
    libxrandr2 libxrender1 qt56base qt56declarative qt56location qt56svg qt56webchannel \
    qt56webengine qt56xmlpatterns
COPY . ./
RUN dpkg -i pix4dmapper_4.3.15_amd64.deb
RUN apt-get install -f
