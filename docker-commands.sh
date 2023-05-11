docker pull postgres:12.12
docker run --name my_postgres -e POSTGRES_PASSWORD=my_password -p 5432:5432 -d postgres:12.12
docker ps
docker exec -it my_postgres psql -U postgres
