FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Базовые пакеты + инструменты для сборки Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    sudo \
    curl \
    wget \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    libssl-dev \
    libgdbm-dev \
    libdb-dev \
    libffi-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Создаём пользователя ubuntu и даём sudo без пароля
RUN useradd -m -s /bin/bash ubuntu \
    && echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu

# Готовим директории для SSH
RUN mkdir -p /var/run/sshd \
    && mkdir -p /home/ubuntu/.ssh \
    && chown -R ubuntu:ubuntu /home/ubuntu/.ssh \
    && chmod 700 /home/ubuntu/.ssh

# Копируем публичный ключ (рядом с Dockerfile должен лежать id_ed25519.pub)
COPY id_rsa.pub /home/ubuntu/.ssh/authorized_keys
RUN chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys \
    && chmod 600 /home/ubuntu/.ssh/authorized_keys

# Устанавливаем Python 3.11.9 из исходников
WORKDIR /tmp
RUN curl -LO https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz \
    && tar -xzf Python-3.11.9.tgz \
    && cd Python-3.11.9 \
    && ./configure --prefix=/usr/local --enable-optimizations \
    && make -j$(nproc) \
    && make install \
    && cd /tmp \
    && rm -rf Python-3.11.9 Python-3.11.9.tgz

# Проверка версии
RUN /usr/local/bin/python3.11 --version

EXPOSE 22

# Запуск SSHD в foreground (стандарт для контейнеров)
CMD ["/usr/sbin/sshd", "-D"]