The folder is for the theoretical part of the course.
The code in the folder is mostly from Part 2 of the course.
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


