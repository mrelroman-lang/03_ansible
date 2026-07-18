#!/bin/bash

# Путь к каталогу /var
PROJECT_DIR="/var/tasks5_2"

# 1. Клонируем репозиторий (если уже есть — подтягиваем обновления, иначе — скачиваем)
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Клонирую репозиторий в $PROJECT_DIR..."
    git clone https://github.com/mrelroman-lang/shvirtd-example-python.git "$PROJECT_DIR"
else
    echo "Репозиторий уже существует, обновляю..."
    cd "$PROJECT_DIR"
    git pull
fi

# 2. Переходим в каталог проекта
cd "$PROJECT_DIR"

# 3. Запускаем проект целиком
echo "Запуск проекта..."

docker-compose up -d


case "$(uname)" in
    Linux)
        # Для системных сервисов или демонов
        exec docker-compose -f docker-compose.yaml up -d
        ;;

esac

echo "Проект запущен!"
