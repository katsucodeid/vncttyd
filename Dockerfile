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

# Menjalankan shellinabox dan menambahkan 'tail' agar container tetap hidup di Railway
CMD /usr/bin/shellinaboxd -t -p 8080 -s "/:userweb:userweb:/home/userweb:/bin/bash" && tail -f /dev/null
