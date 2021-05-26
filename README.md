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

#### Observe Docker Networks
```
docker network ls
```
```
NETWORK ID     NAME                DRIVER    SCOPE
8cf36fa57675   bridge              bridge    local
55e646cf286a   consumer_network    bridge    local
8853fea08272   host                host      local
e0277c7da9cd   mockrunner_bridge   bridge    local
003cd1cb6ca5   none                null      local

```

You can try to inspect
```
docker network inspect mockrunner_bridge
docker network inspect consumer_network
```
#### Mock Runner  (10001 external port, 8080 internal port)
```
curl -X GET http://localhost:10001/ok
```

Mock Runner Output
```
{
  "message": "Wiremock is UP & Running"
}
```

#### Consumer Service (9000) which depends on Mock Runner
```
curl -X GET http://localhost:9000/ok
```

It also shows below Output, as it is able to reach http://mock-runner:8080/ok with help of `mockrunner_bridge`
```
{
  "message": "Wiremock is UP & Running"
}
```

#### Consumer Service Isolated (9001) which can't reach Mock Runner (because it's not connected to `mockrunner_bridge`, intentionally)
```
curl -X GET http://localhost:9001/ok
```

It shows error, as it can't reach http://mock-runner:8080/ok
```
Network failure trying to make a proxied request from WireMock to http://mock-runner:8080/ok
mock-runner: Name or service not known
```

#### Debug with logs
```
docker-compose logs -f

Ctrl + C to exit
```

### 4. Clean Up
`./shutdown.sh`
