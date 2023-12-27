
# Instalation
1. navagate to root directory
1. run with docker ```docker-compose up -d```
1. find out mysql container id ```docker ps```
1. enter into the mysql docker container ```docker exec -it <CONTAINER ID> bash```
1. migrate the database ```mysql -u root -ptest mydb < /host-machine/schema_dump.sql```
1. exit out of of the container ```exit```