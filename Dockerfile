# Menggunakan sistem operasi Ubuntu dasar
FROM ubuntu:latest

# Menginstal ttyd, sudo, dan beberapa alat dasar
RUN apt-get update && \
    apt-get install -y ttyd sudo nano curl wget iputils-ping

# Membuat user baru bernama 'userweb'
RUN useradd -m -s /bin/bash userweb

# Memberikan akses sudo kepada 'userweb' TANPA password
RUN echo "userweb ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Berpindah dari root ke userweb
USER userweb
WORKDIR /home/userweb

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan ttyd
CMD ["ttyd", "-p", "8080", "bash"]
