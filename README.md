# Why Wiremock?
You've a requirement where your application needs to be integrated with External APIs, and
- When External APIs are not always available
- When External APIs incur cost on every hit
- And to simulate faults including all 5XX errors, you require downtime for External APIs
- When your application needs Integration Tests with External APIs

Then, Wiremock comes into action to act as Mock Server which can serve all the External APIs without downtime, and in a cost effective manner.

# Scope
We'll explore simple way to mocking webservices/ APIs with WireMock. The whole setup in this exercise is purely file (JSON) based, won't uses any code. Focus will be more on how to use **mappings** and **__files**. To know more about running Wiremock as standalone process may refer to http://wiremock.org/docs/running-standalone/

Here I'll walk you through with help of Docker Technologies, as the demand for Containerization is High. Follow readme, once you checkout branch for each section.

## Exercise APIs
Import Postman Collection for quick links https://www.getpostman.com/collections/acffac443a2bb5110a33

## Boilerplate
This section focuses on minimalistic setup of Wiremock. Developers who are exploring for the first time go with this.
```
git checkout https://github.com/whyaneel/wiremock.git

cd wiremock

git checkout boilerplate
```

- You'll have Wiremock UP & RUNNING
- You'll run GET mock
- You'll run POST mock (Simulate 200, 400, 500)
- [x] You'll see the need for dynamic responses, first go though http://wiremock.org/docs/response-templating/ and then follow **Response Templating** section below for examples.


## Response Templating
This section gives you examples with the power of Response Templating. Developers who want to tweak to get most out of Wiremock go with this. Observe **mappings** and **__files** from **rt** folder.
```
git checkout https://github.com/whyaneel/wiremock.git

cd wiremock

git checkout response-templating
```

- You'll run GET mock with dynamic response with `now`
- You'll run GET mock with dynamic response from a file with `bodyFileName`
- You'll run POST mock with dynamic response with `jsonPath` against a `request.body`
- You'll run POST mock with dynamic response from a file with `bodyFileName`
- You'll run POST mock with fault simulation with `fixedDelayMilliseconds`, for more go though http://wiremock.org/docs/simulating-faults/

## Bonus
Let's say your application uses Docker for your `N` microservices [ms] architecture and only 1 or few ms (`consumer-service`) need to connect with External APIs (i.e. Wiremock server, `mock-runner`) and rest of ms should be isolated, then take the advantage of Bridge Network.
```
git checkout https://github.com/whyaneel/wiremock.git

cd wiremock

git checkout docker2docker
```

- You'll run GET mock with response templating feature `proxyBaseUrl`, this is just to simulate a call to `mock-runner`, Ideally you can use RestTemplate (http) for Java application, or Curl for shell application from your `consumer-service`
- You'll see `consumer-service` communicating with `mock-runner` using internal port via `mockrunner_bridge` network

## You've questions? 
Check out Google Group https://groups.google.com/g/wiremock-user/, most of the use cases are present, otherwise I'm happy to help.

👏 Hope you learnt some basics of Wiremock
