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

#### Boilerplate
```
curl -X GET http://localhost:10001/ok
```

##### It shows below Output
```
{
  "message": "Wiremock is UP & Running"
}
```

#### Response Templating
```
curl -X GET http://localhost:10001/rt/ok
```

##### It shows below Output (date is dynamic)
```
{
    "message": "Wiremock is UP & Running 2021-05-25T14:13:34Z"
}
```

#### Debug with logs (Verbose enabled, see docker-compose.yml)
```
docker-compose logs -f

Ctrl + C to exit
```

### 4. Clean Up
`./shutdown.sh`
