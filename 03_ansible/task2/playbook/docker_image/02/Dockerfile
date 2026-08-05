FROM rockylinux:8

# Убираем DEBIAN_FRONTEND — он для Debian/Ubuntu, в Rocky не нужен

# ВАЖНО: добавляем openssh-clients, где лежит ssh-keygen
RUN dnf install -y epel-release && \
    dnf install -y \
        openssh-server \
        openssh-clients \
        sudo \
        curl \
        wget \
        gcc \
        make \
        zlib-devel \
        bzip2-devel \
        openssl-devel \
        ncurses-devel \
        readline-devel \
        sqlite-devel \
        gdbm-devel \
        libffi-devel \
        python39 \
        python39-pip \
    && dnf clean all

# Создаём пользователя roman
RUN useradd -m -s /bin/bash roman && \
    echo "roman ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/roman && \
    chmod 0440 /etc/sudoers.d/roman

# Подготовка директории .ssh
RUN mkdir -p /home/roman/.ssh && \
    chown -R roman:roman /home/roman/.ssh && \
    chmod 700 /home/roman/.ssh

# Копируем публичный ключ (убедись, что id_rsa.pub лежит рядом с Dockerfile)
COPY id_rsa.pub /home/roman/.ssh/authorized_keys

# Права на authorized_keys — критично для SSH
RUN chown roman:roman /home/roman/.ssh/authorized_keys && \
    chmod 600 /home/roman/.ssh/authorized_keys

# Генерируем хостовые SSH‑ключи (теперь сработает, потому что есть openssh-clients)
RUN /usr/sbin/ssh-keygen -A

# Добавляем репозиторий ClickHouse
RUN curl -fsS https://packages.clickhouse.com/rpm/stable/clickhouse-repo-setup.sh | bash

# Настройка SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]