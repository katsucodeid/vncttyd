# Menggunakan Ubuntu 22.04 (Versi ini menggunakan Python 3.10 sebagai bawaan aslinya)
FROM ubuntu:22.04

# Mencegah dialog interaktif yang bisa membuat proses build di Railway tersendat
ENV DEBIAN_FRONTEND=noninteractive

# Menginstal shellinabox (untuk terminal murni), Python 3.10, pip, sudo, git, dan tmux
RUN apt-get update && \
    apt-get install -y shellinabox sudo nano curl wget git tmux python3 python3-pip iputils-ping && \
    apt-get clean

# Membuat user baru bernama 'userweb'
RUN useradd -m -s /bin/bash userweb

# Memberikan akses sudo kepada 'userweb' TANPA password
RUN echo "userweb ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Berpindah ke userweb agar lebih aman
USER userweb
WORKDIR /home/userweb

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan shellinabox untuk tampilan layar hitam terminal dan menahan session agar tidak closed
CMD /usr/bin/shellinaboxd -t -p 8080 -s "/:userweb:userweb:/home/userweb:/bin/bash" && tail -f /dev/null
