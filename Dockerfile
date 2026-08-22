# Menggunakan sistem operasi Ubuntu
FROM ubuntu:latest

# Menginstal tools dasar dan sudo
RUN apt-get update && \
    apt-get install -y curl wget sudo nano iputils-ping

# Menginstal Code-Server (VS Code Web) secara otomatis
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Membuat user 'userweb' dan memberikannya akses sudo tanpa password
RUN useradd -m -s /bin/bash userweb && \
    echo "userweb ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Berpindah ke userweb agar aman
USER userweb
WORKDIR /home/userweb

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan Code-Server tanpa password agar langsung terbuka
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "--disable-telemetry"]
