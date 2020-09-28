#### Theoretical part of the course https://devopswithdocker.com/part2/ 
#### DevOps with Docker 2020 of University of Helsinki (part 2)


```
~>/web_and_scaling$ sudo docker run -d -p 8000:8000 jwilder/whoami 
c036f36776d6c6a4c34e43075c5b5cc638c05a8ed05c654a9bca67603b53cfa2
~>/web_and_scaling$ curl localhost:8000
I'm c036f36776d6
~>/web_and_scaling$ sudo docker stop c0
c0
~>/web_and_scaling$ sudo docker rm c0
c0
```
----------------------------------------------
# we use the docker-compose.yml

version: '3.3'

services:
    whoami:
        image: jwilder/whoami
        ports:
            - 8000:8000
----------------------------------------
```
~>/web_and_scaling$ sudo docker-compose up -d
[sudo] password for dmitri: 
Creating network "web_and_scaling_default" with the default driver
Creating web_and_scaling_whoami_1 ... done
~>/web_and_scaling$ curl localhost:8000
I'm 6d96fd9c5184
~>/web_and_scaling$ sudo docker stop 6d
6d
~>/web_and_scaling$ sudo docker compose rm 6d
docker: 'compose' is not a docker command.
See 'docker --help'
~>/web_and_scaling$ sudo docker rm 6d
6d
~>/web_and_scaling$ 
```
----------------------------------------------------
version: '3.5' 

services: 
    whoami: 
      image: jwilder/whoami 
      environment: 
       - VIRTUAL_HOST=whoami.colasloth.com 
    proxy: 
      image: jwilder/nginx-proxy 
      volumes: 
        - /var/run/docker.sock:/tmp/docker.sock:ro 
      ports: 
        - 80:80 
-------------------------------------------

-------------------------------------------------

version: '3.3'

services:
    hello:
      image: nginx
      volumes:
        - ./hello.html:/usr/share/nginx/html/index.html:ro
      environment:
        - VIRTUAL_HOST=hello.colasloth.com
    world:
      image: nginx
      volumes:
        - ./world.html:/usr/share/nginx/html/index.html:ro
      environment:
        - VIRTUAL_HOST=world.colasloth.com
    whoami:
      image: jwilder/whoami
      environment:
       - VIRTUAL_HOST=whoami.colasloth.com
    proxy:
      image: jwilder/nginx-proxy
      volumes:
        - /var/run/docker.sock:/tmp/docker.sock:ro
      ports:
        - 80:80
----------------------------------------------
```

~>/web_and_scaling$ sudo docker-compose up -d --scale whoami=3 
Pulling hello (nginx:)...
latest: Pulling from library/nginx
d121f8d1c412: Pull complete
ebd81fc8c071: Pull complete
655316c160af: Pull complete
d15953c0e0f8: Pull complete
2ee525c5c3cc: Pull complete
Digest: sha256:c628b67d21744fce822d22fdcc0389f6bd763daac23a6b77147d0712ea7102d0
Status: Downloaded newer image for nginx:latest
web_and_scaling_whoami_1 is up-to-date
web_and_scaling_whoami_2 is up-to-date
web_and_scaling_whoami_3 is up-to-date
web_and_scaling_proxy_1 is up-to-date
Creating web_and_scaling_world_1 ... done
Creating web_and_scaling_hello_1 ... done
~>/web_and_scaling$ curl hello.colasloth.com 
hello
~>/web_and_scaling$ curl world.colasloth.com
world
~>/web_and_scaling$ curl whoami.colasloth.com
I'm be003f5ee231
~>/web_and_scaling$ curl whoami.colasloth.com
I'm c3c08e162864
~>/web_and_scaling$ 

```
