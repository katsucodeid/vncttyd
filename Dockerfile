# Menggunakan sistem operasi Ubuntu dasar
FROM ubuntu:latest

# Menginstal ttyd dan beberapa alat dasar (nano, curl, wget)
RUN apt-get update && \
    apt-get install -y ttyd nano curl wget iputils-ping

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan ttyd di port 8080 tanpa password, langsung membuka 'bash'
CMD ["ttyd", "-p", "8080", "bash"]
