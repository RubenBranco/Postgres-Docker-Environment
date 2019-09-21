# Database-Technology-2019

## Executar o projeto

NECESSÁRIO TER DOCKER INSTALADO E A CORRER

### Passo 1: Compilar imagens

Executar o seguinte commando: `bash docker/postgres/build-image.sh && bash docker/pgAdmin/pull-image.sh` num terminal.

Este passo só precisa de ser feito uma vez, após ser feito, podem fazer skip a este passo.

### Passo 2: Arrancar o servidor de PostgreSQL

Para arrancar o servidor de PostgreSQL, executar o seguinte comando num terminal: `bash docker/postgres/start-container.sh --rm`.

Para terminar o servidor é só pressionar CTRL+C no terminal.

### Passo 3: Arrancar pgAdmin (UI para Postgres)

Para arrancar o pgAdmin, executar o seguinte comando num outro terminal:  `bash docker/pgAdmin/start-container.sh --rm <USERNAME> <PASSWORD>`.

Para terminar o servidor é só pressionar CTRL+C no terminal.

Para mexer na base de dados através desta UI é so abrir localhost:8080 num browser e fazer login com o username e password dados no comando. Ao fazer setup do servidor, este encontra-se no host postgres, e utilizem o username postgres sem password na autenticação do servidor.

Para interagir com o servidor PostgreSQL através da command line com psql, o servidor encontra-se no localhost:5432
