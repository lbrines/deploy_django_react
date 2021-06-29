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
docker-compose --env-file .env.dev  up --build
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
