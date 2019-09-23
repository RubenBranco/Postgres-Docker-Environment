# Postgres Docker Environment

## Documentação em Português

## Executar o projeto

O environment foi testado em Linux e MacOS (bash scripts). É possível que em Windows seja mais difícil de fazer correr, mas talvez com Windows Linux Subsystem (<https://docs.microsoft.com/en-us/windows/wsl/install-win10>) seja igualmente simples.

É necessário ter o docker instalado e a correr para isto funcionar. Instalação: <https://docs.docker.com/install/>


### Passo 1: Compilar imagens

Executar o seguinte commando: `bash docker/postgres/build-image.sh && bash docker/pgAdmin/pull-image.sh` num terminal.

Este passo só precisa de ser feito uma vez, após ser feito, podem fazer skip a este passo.

### Passo 2: Arrancar o servidor de PostgreSQL

Para arrancar o servidor de PostgreSQL, executar o seguinte comando num terminal: `bash docker/postgres/start-container.sh --rm`.

Para terminar o servidor é só pressionar CTRL+C no terminal.

Para saber mais informações sobre os parâmetros, corra `bash docker/postgres/start-container --help`.

### Passo 3: Arrancar pgAdmin (UI para Postgres)

Para arrancar o pgAdmin, executar o seguinte comando num outro terminal:  `bash docker/pgAdmin/start-container.sh --rm <USERNAME> <PASSWORD>`.

Para terminar o servidor é só pressionar CTRL+C no terminal.

Para saber mais informações sobre os parâmetros, corra `bash docker/pgAdmin/start-container --help`.

Para mexer na base de dados através desta UI é so abrir localhost:8080 num browser e fazer login com o username e password dados no comando. Ao fazer setup do servidor, este encontra-se no host postgres, e utilizem o username postgres sem password na autenticação do servidor.

Para interagir com o servidor PostgreSQL através da command line com psql, o servidor encontra-se no localhost:5432

### Dados

Os dados do servidor PostgreSQL são guardados em ficheiros binários, mas para efeitos de persistencia, os dados são guardados no diretório do projeto em `volumes/postgres`. Esta diretoria é criada na primeira vez que o comando start-container é corrido.

O mesmo se aplica ao pgAdmin, os seus dados são guardados em `volumes/pgadmin`.

The data for PostgreSQL is stored in binary files, however for persistence the data is saved in the project directory under `volumes/postgres`. This directory is created on the first start-container run.

Likewise for pgAdmin, its data is saved under `volumes/pgadmin`.

## English Documentation

## Running the project

The environment was tested in Linux and MacOS (bash scripts). It's possible that using windows might offer a bit more of a challenge, but maybe with Windows Linux Subsystem (<https://docs.microsoft.com/en-us/windows/wsl/install-win10>) it might work just as easily.

Docker is a requirement so you have to have it installed and running. Install: <https://docs.docker.com/install/>

### Step 1: Compiling the images

Execute the following command: `bash docker/postgres/build-image.sh && bash docker/pgAdmin/pull-image.sh` in a terminal.

This step only needs to be done once, after doing it, you can skip this step.

### Step 2: Running the PostgreSQL Server

To run the PostgreSQL server, run the following command in a terminal: `bash docker/postgres/start-container.sh --rm`.

For more information of extra options, run `bash docker/postgres/start-container.sh --help`.

To stop the server, press CTRL+C with the terminal in focus.

### Step 3: Run pgAdmin Server (UI for Postgres)

To run the pgAdmin server, run the following command in a seperate window:  `bash docker/pgAdmin/start-container.sh --rm <USERNAME> <PASSWORD>`.

To stop the server, press CTRL+C with the terminal in focus.

For more information of extra options, run `bash docker/pgAdmin/start-container.sh --help`.

To manipulate the database through the UI, open localhost:8080 in a browser and login with the username and password provided in the start-container command. During the server setup process inside pgAdmin, you will find the postgres server in the host postgres, and you can use postgres as a username. By default postgres runs with no password, so no need to supply one.

To interact with the PostgreSQL through the command line with psql, you can find the server at localhost:5432.

### Data

The data for PostgreSQL is stored in binary files, however for persistence the data is saved in the project directory under `volumes/postgres`. This directory is created on the first start-container run.

Likewise for pgAdmin, its data is saved under `volumes/pgadmin`.
