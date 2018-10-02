# hiprice-web
Web for Hiprice.

## Build & Run

```
yarn install // or npm install
yarn run build // or npm run build
cd dist
mv static/favicon.ico ./
mkdir web
mv static/ web/
mv index.html web/
mv web/static/help.html web/
```

Upload everything in dist to CDN(keep directory structure).

Or use a static server(eg. http-server).

## Docker

Usually you should use previous step to build and deploy files to CDN, but for convenience, here is a docker image out-of-box.

```
// build
docker build -f Dockerfile -t hiprice-web .

// default CHATBOT_SERVER is localhost:6200, either ip or domain is accepted,
// if you want to use HiPrice out of localhost, a valid CHATBOT_SERVER must be specified.
docker build -f Dockerfile -t hiprice-web --build-arg CHATBOT_SERVER=192.168.1.100 .

// run
docker run -d --name hiprice-web -p 6100:6100 hiprice-web

// if you do not want to build image yourself, a default image is ready in use
docker run -d --name hiprice-web -p 6100:6100 wf2030/hiprice-web:0.1.0
```

### Env(used by `docker run`)

- `HOST`: listening host, default is `0.0.0.0`
- `PORT`: listening port, default is `6100`
