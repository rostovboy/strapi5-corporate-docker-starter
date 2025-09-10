# 🚀 Начало работы

Клонируем репозиторий, запускаем create_env.sh чтобы создать .env file
```
bash create_env.sh
```

Для продакшена очишаем значение POSTGRES_PORT, а для разработки его можно указать, например 54320,
чтобы подключаться к БД из IDE, когда на локальной машине крутится несколько баз


Разворачиваем контейнеры с приложением

```
docker compose build --pull --no-cache
```

В режиме разработки:

```
docker compose up -d
```

В продакшене:

```
docker compose -f docker-compose.prod.yml up -d
```

## Сделать бэкап
Сделать дамп базы данных
```
docker exec -it strapi-backend-db pg_dump -U database_user -F c -Z 9 -f /tmp/database.dump database_name
```

Скопировать дамп базы в директорию проекта
```
docker cp strapi-backend-db:/tmp/database.dump ./database.dump
```

## Развернуть бэкап
Копируем из проекта в контейнер дамп с базой
```
docker cp ./database.dump strapi-backend-db:/tmp/database.dump
```

Восстанавливаем из дампа
```
docker exec -it strapi-backend-db bash

pg_restore -U database_user -d database_name --no-owner --role=bastdb --clean --if-exists /tmp/database.dump
```

После восстановления из дампа, возможно нужно будет войти в админ. панель и в настройках перегенерировать токены доступа к API для фронтенд-приложений
