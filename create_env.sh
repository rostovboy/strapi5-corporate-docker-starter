#!/bin/bash

# Generate keys
if [ -z "$app_keys" ]; then
  app_keys=$(openssl rand -base64 32 | tr -d '\n' | fold -w 32 | paste -sd ',' -)
fi
if [ -z "$api_token_salt" ]; then
  api_token_salt=$(openssl rand -base64 32)
fi
if [ -z "$admin_jwt_secret" ]; then
  admin_jwt_secret=$(openssl rand -base64 32)
fi
if [ -z "$transfer_token_salt" ]; then
  transfer_token_salt=$(openssl rand -base64 32)
fi
if [ -z "$encryption_key" ]; then
  encryption_key=$(openssl rand -base64 32)
fi
if [ -z "$jwt_secret" ]; then
  jwt_secret=$(openssl rand -base64 32)
fi
if [ -z "$database_password" ]; then
  database_password=$(openssl rand -base64 12)
fi

# Write to .env file
cat > .env <<EOF
# Frontend site url for preview button http://localhost:3000 | sitename.com
FRONTEND_URL=http://localhost:3000

# External port for development not 5432 - remove for production
POSTGRES_PORT=54320

# Docker
APP_NAME=strapi-corporate-backend
APP_NETWORK_NAME=strapi-corporate-network

# Strapi
HOST=0.0.0.0
PORT=1337

# Set Default Locale to Russian
STRAPI_PLUGIN_I18N_INIT_LOCALE_CODE=ru

# Secrets
APP_KEYS=$app_keys
API_TOKEN_SALT=$api_token_salt
ADMIN_JWT_SECRET=$admin_jwt_secret
TRANSFER_TOKEN_SALT=$transfer_token_salt
ENCRYPTION_KEY=$encryption_key
JWT_SECRET=$jwt_secret

# Strapi Database credentials
DATABASE_CLIENT=postgres
DATABASE_HOST=db
DATABASE_PORT=5432
DATABASE_NAME=database
DATABASE_USERNAME=database
DATABASE_PASSWORD=$database_password
DATABASE_SSL=false

# AWS S3 Settings for YandexCloud Object Storage
AWS_ENDPOINT=https://storage.yandexcloud.net
AWS_ACCESS_KEY_ID=
AWS_ACCESS_SECRET=
AWS_REGION=ru-central1
AWS_ACL=public-read
AWS_BUCKET=bucket-name
# For /config/middlewares.ts
AWS_BUCKET_URL=storage.yandexcloud.net

# REST
REST_DEFAULT_LIMIT=20

# MAIL
SMTP_HOST=
SMTP_PORT=
SMTP_USERNAME=
SMTP_PASSWORD=
SMTP_SECURE=
SMTP_TLS=
SMTP_DEFAULT_FROM=
SMTP_DEFAULT_REPLY_TO=

#DEBUG=knex:query,knex:bindings
#DEBUG_SHOW_HIDDEN=enabled
#DEBUG=knex:query

EOF

echo "New .env file generated as .env"