### Pre-requisites
- Git
- Docker

### 1. Checkout code
```
git checkout https://github.com/whyaneel/wiremock.git

cd wiremock
```

### 2. Bring Up
```
./startup.sh

docker ps
```

#### It shows as below  and you're ready to use
```
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS                               NAMES
ba4376c7d98b   rodolpheche/wiremock   "/docker-entrypoint.…"   15 seconds ago   Up 10 seconds   8443/tcp, 0.0.0.0:10001->8080/tcp   mock-runner
```

### 3. Test & Debug
```
curl -X GET http://localhost:10001/ok
```

#### It shows below Output
```
{
  "message": "Wiremock is UP & Running"
}
```

#### Debug with logs
```
docker-compose logs -f

Ctrl + C to exit
```

### 4. Clean Up
`./shutdown.sh`
