sed 's|{{IMAGE_NAME}}|${IMAGE_NAME}|' docker-compose.template.yml > docker-compose.yml
docker stop $(docker ps -aq)
docker-compose up -d
docker ps -a

