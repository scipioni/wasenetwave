# wasenetwave


dockerized wasenetwave

- copy env.sample in .env
- task download (download *.dev packages)

## publish to registry

build and publish to registry specified in .env
```
task buildx
```
## run local wise

```
task build
task start
```

open browser on http://localhost:7001