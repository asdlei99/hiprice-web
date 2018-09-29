# hiprice-web

## Build
```
docker build -f Dockerfile -t hiprice-web .

// default CHATBOT_SERVER is hiprice-chatbot, either ip or domain is accepted
docker build -f Dockerfile -t hiprice-web --build-arg CHATBOT_SERVER=192.168.1.100 .

// if you do not want to build yourself, a default image is ready in use
docker pull wf2030/hiprice-web:0.1.0
```

## Env(used by `docker run`)
- `HOST`: listening host, default is `0.0.0.0`
- `PORT`: listening port, default is `8080`

## Run
`docker run -d --name hiprice-web -e PORT=6000 -p 6000:6000 hiprice-web`
