echo "Microservice are shutting down"
docker-compose down -v --remove-orphans

cd mock-runner
echo "Wiremock mock-runner is shutting down"
docker-compose down -v --remove-orphans