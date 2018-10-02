# hiprice-web
Web for Hiprice.

## Build Docker Image
```
docker build -f Dockerfile -t hiprice-web .

// default CHATBOT_SERVER is localhost:6200, either ip or domain is accepted,
// if you want to use HiPrice on phone or other devices, a valid CHATBOT_SERVER must be specified.
docker build -f Dockerfile -t hiprice-web --build-arg CHATBOT_SERVER=192.168.1.100 .

// if you do not want to build yourself, a default image is ready in use
docker pull wf2030/hiprice-web:0.1.0
```

## Env(used by `docker run`)
- `HOST`: listening host, default is `0.0.0.0`
- `PORT`: listening port, default is `6100`

## Run In Docker
`docker run -d --name hiprice-web -p 6100:6100 hiprice-web`
