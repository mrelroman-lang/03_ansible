FROM almalinux:8

# Установка пакетов. openssh-clients в AlmaLinux 8 обычно уже есть, но явно запрашиваем openssh-server.
# Главное — не полагаться на /usr/sbin, а искать утилиту правильно.
RUN dnf install -y epel-release \
  && dnf install -y \
    openssh-server \
    sudo \
    curl \
    python39 \
    python39-pip \
  && dnf clean all

# Создаём пользователя roman
RUN useradd -m -s /bin/bash roman \
  && echo "roman ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/roman \
  && chmod 0440 /etc/sudoers.d/roman

# Готовим .ssh
RUN mkdir -p /home/roman/.ssh \
  && chown -R roman:roman /home/roman/.ssh \
  && chmod 700 /home/roman/.ssh

# Копируем ключ (убедись, что id_rsa.pub лежит рядом с Dockerfile)
COPY id_rsa.pub /home/roman/.ssh/authorized_keys

# Права на authorized_keys — обязательно
RUN chown roman:roman /home/roman/.ssh/authorized_keys \
  && chmod 600 /home/roman/.ssh/authorized_keys

# Генерируем хостовые SSH ключи. В AlmaLinux ssh-keygen находится в /usr/bin
RUN /usr/bin/ssh-keygen -A

# Добавляем репозиторий ClickHouse
RUN curl -fsS https://packages.clickhouse.com/rpm/stable/clickhouse-repo-setup.sh | bash

# Настройка SSH: только ключи, без паролей
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config \
  && sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
