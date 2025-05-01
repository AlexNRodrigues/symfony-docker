# Makefile para facilitar o uso de Docker + Symfony


# Nome do serviço docker-compose (se você usar outro arquivo, ajuste a variável)
DC = docker-compose
PHP = $(DC) exec php
NGINX = $(DC) exec nginx
DB = $(DC) exec db
PHP_CONTAINER=symfony_php
WORKDIR=/var/www/html

# ----------------------
# Comandos principais
# ----------------------

# Executa bin/console com um comando arbitrário
console:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console $(cmd)

# Executa Composer com um comando arbitrário
composer:
	docker exec -it $(PHP_CONTAINER) composer $(cmd)

# Abre o bash do contêiner PHP
bash:
	docker exec -it $(PHP_CONTAINER) bash

# Instala dependências do Composer
install:
	docker exec -it $(PHP_CONTAINER) composer install

# Atualiza dependências do Composer
update:
	docker exec -it $(PHP_CONTAINER) composer update

# Limpa o cache do Symfony
cache-clear:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console cache:clear

# ----------------------
# Banco de dados
# ----------------------

# Executa as migrations
migrate:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console doctrine:migrations:migrate --no-interaction

# Atualiza o schema do banco de dados com base nas entidades
schema-update:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console doctrine:schema:update --force

# Carrega os fixtures (é necessário ter DoctrineFixturesBundle instalado)
fixtures:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console doctrine:fixtures:load --no-interaction

# ----------------------
# Testes
# ----------------------

# Executa os testes com PHPUnit (certifique-se que o phpunit está instalado no projeto)
test:
	docker exec -it $(PHP_CONTAINER) ./vendor/bin/phpunit

# Executa testes com cobertura de código
coverage:
	docker exec -it $(PHP_CONTAINER) ./vendor/bin/phpunit --coverage-text

# ----------------------
# Seeders personalizados (opcional)
# ----------------------

# Exemplo: rodar um seeder customizado (ajuste o nome do comando conforme sua lógica)
seed:
	docker exec -it $(PHP_CONTAINER) php $(WORKDIR)/bin/console app:seed



# ----------------------
# Comandos do Docker Compose
# ----------------------

## 🛠 build: (re)constrói as imagens
build:
	$(DC) build --no-cache

## ▶ up: sobe os containers em background
up:
	$(DC) up -d

## ■ stop: para os containers sem remover volumes
stop:
	$(DC) stop

## ✖ down: para e remove containers, redes e volumes
down:
	$(DC) down -v

## 🔄 restart: reinicia todos os containers
restart: down up

## 📦 ps: lista os container
ps: $(DC) ps

## 📦 logs: exibe os logs dos container
logs: $(DC) logs

## 📦 logs-f: exibe os logs dos container em tempo rea
logs-f: $(DC) logs -fl

