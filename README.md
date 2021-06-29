# Instrucciones para deploy de Bakend y Frotend

El deploy se realizar con Docker Compose.

## Requisito

* Docker Engine >=v20.10.7
* Docker Compose >=1.27.4

## Instalacio de requisitos

Utilice el siguiente enlace para conocer instalacion de los requisitos: 
Docker: <https://docs.docker.com/engine/install/>
Compose: <https://docs.docker.com/compose/install/>

## Clonar repositorio
```bash
git clone https://github.com/lbrines/deploy_django_react.git
```

## Deploy en desarrollo

```bash
docker-compose --env-file .env.dev  up -d --build
```

<details>
  <summary>Resultado</summary>

  ```bash
  Building backend
  Step 1/8 : FROM python:3.6
  ---> b58bb3901b01
  Step 2/8 : ENV PYTHONUNBUFFERED=1
  ---> Using cache
  ---> 7a44527d38cb
  Step 3/8 : RUN apt-get update && apt-get install graphviz graphviz-dev postgresql-client -y && rm -rf /var/lib/apt/lists/*
  ---> Using cache
  ---> cdeaf9142f85
  Step 4/8 : RUN pip install psycopg2 && pip install psycopg2-binary
  ---> Using cache
  ---> ba1aaa52ed0f
  Step 5/8 : WORKDIR /code
  ---> Using cache
  .
  .
  .
  .
  Starting prueba02_db_1 ... done
Starting prueba02_backend_1 ... done
Starting prueba02_frontend_1 ... done

  ```
</details>

## Deploy en produccion

```bash
docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml --env-file .env.prod  up -d --build
```

<details>
  <summary>Resultado</summary>

  ```bash
.
.
.
 ---> d09e31a283f4
Step 5/12 : RUN npm install
 ---> Using cache
 ---> 1e459afb81d4
Step 6/12 : RUN npm run build
 ---> Running in e824d9b7a7bb

> frontendpublic@0.1.0 build /app
> node scripts/build.js

Creating an optimized production build..
  .
  .
  .
Creating prueba02_db_1 ... done
Creating prueba02_backend_1 ... done
Creating prueba02_frontend_1 ... done

  ```
</details>

## Verificion de container

```bash
docker ps
```
<details>
  <summary>Resultado</summary>
```bash  
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS          PORTS                                                                          NAMES
83eabdd1c8f9   prueba02_frontend   "/docker-entrypoint.…"   56 seconds ago   Up 54 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   prueba02_frontend_1
15c594cb431a   prueba02_backend    "sh start.sh db"         56 seconds ago   Up 55 seconds   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp                                      prueba02_backend_1
3346e6f6eb7a   postgres            "docker-entrypoint.s…"   57 seconds ago   Up 56 seconds   5432/tcp                                                                       prueba02_db_1
```
</details>