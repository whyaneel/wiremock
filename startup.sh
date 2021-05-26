cd mock-runner
echo "Wiremock mock-runner is booting up"
docker-compose up -d

cd ..
echo "Microservice are booting up"
docker-compose up -d
