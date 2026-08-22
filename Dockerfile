# Menggunakan base image noVNC Ubuntu LXDE (Focal/20.04) yang stabil
FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Menambahkan repository PPA untuk menginstal Python 3.10
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update

# Menginstal Python 3.10, file header, dan alat kompilasi (build-essential)
RUN apt-get install -y python3.10 python3.10-dev python3.10-distutils curl build-essential

# Mengatur agar perintah 'python' dan 'python3' selalu mengarah ke Python 3.10
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# Mengunduh dan menginstal pip khusus untuk Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.10 get-pip.py && \
    rm get-pip.py

# Mengekspos port 80 (Port default bawaan noVNC)
EXPOSE 80
