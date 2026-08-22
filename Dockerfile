# Menggunakan sistem operasi Ubuntu dasar
FROM ubuntu:latest

# Menginstal shellinabox, sudo, dan beberapa alat dasar
RUN apt-get update && \
    apt-get install -y shellinabox sudo nano curl wget iputils-ping

# Membuat user baru bernama 'userweb'
RUN useradd -m -s /bin/bash userweb

# Memberikan akses sudo kepada 'userweb' TANPA password
RUN echo "userweb ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan shellinabox
# -t (tanpa SSL karena Railway sudah HTTPS)
# -p 8080 (port yang digunakan)
# -s (langsung membuka bash sebagai 'userweb' tanpa perlu login)
CMD ["shellinaboxd", "-t", "-p", "8080", "-s", "/:userweb:userweb:/home/userweb:/bin/bash"]
