### The exercises for the Part 2 of the course : 

## DevOps with Docker , Helsinki University : https://devopswithdocker.com/part2/

-------------------------------------------------------
2.1

Exercises in part 2 should be done using docker-compose

Container of devopsdockeruh/first_volume_exercise will create logs into its /usr/app/logs.txt.

Create a docker-compose.yml file that starts devopsdockeruh/first_volume_exercise and saves the logs into your filesystem.

Submit the docker-compose.yml, make sure that it works simply by running docker-compose up if the log file exists.
-------------------------------------------------------
```
~>/ex_1$ ./init
logs.txt created on local machine
Building first_volume_exercise
Step 1/1 : FROM devopsdockeruh/first_volume_exercise
latest: Pulling from devopsdockeruh/first_volume_exercise
1c6172af85ee: Pull complete
b194b0e3c928: Pull complete
1f5ec00f35d5: Pull complete
93b1353672b6: Pull complete
3d7f38db3cca: Pull complete
21e102f9fe89: Pull complete
d851ffed797c: Pull complete
a45031e28c68: Pull complete
ca3c1414856f: Pull complete
f092ecebb4a6: Pull complete
b51567d0861f: Pull complete
Digest: sha256:38dd790d251fa970e338546f1cc698214dbdbfb13a0b6b057177c20f960f31b2
Status: Downloaded newer image for devopsdockeruh/first_volume_exercise:latest
 ---> 7ec953697e38

Successfully built 7ec953697e38
Successfully tagged devopsdockeruh/first_volume_exercise:latest
WARNING: Image for service first_volume_exercise was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating volume_exercise ... done
Attaching to volume_exercise
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
volume_exercise          | Wrote to file /usr/app/logs.txt
^CGracefully stopping... (press Ctrl+C again to force)
Stopping volume_exercise ... done
~>/ex_1$ cat logs.txt
Fri, 25 Sep 2020 13:56:36 GMT
Fri, 25 Sep 2020 13:56:39 GMT
Fri, 25 Sep 2020 13:56:42 GMT
Fri, 25 Sep 2020 13:56:45 GMT
Secret message is:
"Volume bind mount is easy"
Fri, 25 Sep 2020 13:56:51 GMT
Fri, 25 Sep 2020 13:56:54 GMT
Fri, 25 Sep 2020 13:56:57 GMT
Fri, 25 Sep 2020 13:57:00 GMT
Secret message is:
"Volume bind mount is easy"
Fri, 25 Sep 2020 13:57:06 GMT
Fri, 25 Sep 2020 13:57:09 GMT
Fri, 25 Sep 2020 13:57:12 GMT
~>/ex_1$ 
```
----------------------------------------------------


2.2

devopsdockeruh/ports_exercise starts a web service that will answer in port 80

Create a docker-compose.yml and use it to start the service so that you can use it with your browser.

Submit the docker-compose.yml, make sure that it works simply by running docker-compose up
-----------------------------------------------------------
```
~>/ex_2$ sudo docker-compose up 
Creating network "ex_2_default" with the default driver
Pulling port_exercise (devopsdockeruh/ports_exercise:)...
latest: Pulling from devopsdockeruh/ports_exercise
cbdbe7a5bc2a: Pull complete
fb0e3739aee1: Pull complete
738de7869598: Pull complete
ffd68be3d86c: Pull complete
d6a92ac5065d: Pull complete
8deb0960be38: Pull complete
aec7a3bd83e0: Pull complete
8f73392c117e: Pull complete
Digest: sha256:9779e303353ef47da9ea0223bfbb9fbdb8f8fe39178e2e06153027e28e9e5400
Status: Downloaded newer image for devopsdockeruh/ports_exercise:latest
Creating ex_2_port_exercise_1 ... done
Attaching to ex_2_port_exercise_1
port_exercise_1  | 
port_exercise_1  | > ports_exercise@1.0.0 start /usr/app
port_exercise_1  | > node index.js
port_exercise_1  | 
port_exercise_1  | Listening on port 80, this means inside of the container. Use -p to map the port to a port of your local machine.
```

At port 80 : "Ports configured correctly!!"
------------------------------------------------------

2.3

This exercise is mandatory

As we saw previously, starting an application with two programs was not trivial and the commands got a bit long.

Since we already created working Dockerfiles for both frontend and backend we can go step further and simplify the usage into one docker-compose.yml.

Configure the backend and frontend from part 1 to work in docker-compose.

Submit the docker-compose.yml
---------------------------------------------------
```
~>/ex_3$ docker-compose up
ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?

If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.
~>/ex_3$ sudo docker-compose up
[sudo] password for dmitri: 
Starting frontend ... done
Starting backend  ... done
Attaching to frontend, backend
backend     | 
backend     | > backend-example-docker@1.0.0 start /app_server
backend     | > node index.js
backend     | 
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /app
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
backend     | ENV values set as follows: {
backend     |   DB: {
backend     |     username: undefined,
backend     |     password: undefined,
backend     |     database: undefined,
backend     |     host: 'localhost'
backend     |   },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://127.0.0.1:5000',
backend     |   REDIS: undefined,
backend     |   REDIS_PORT: 6379
backend     | }
backend     | [Exercise 2.6+] DB_USERNAME and/or DB_PASSWORD are not defined, skipping db connection
backend     | [Exercise 2.5+] REDIS is not defined, skipping redis connection
backend     | Started on port 8000
frontend    | Hash: ba6918cd3cf33e14d775
frontend    | Version: webpack 4.42.1
frontend    | Time: 26031ms
frontend    | Built at: 09/27/2020 4:17:14 PM
frontend    |                                  Asset       Size  Chunks                    Chunk Names
frontend    | 0ab54153eeeca0ce03978cc463b257f7.woff2   39.2 KiB          [emitted]         
frontend    |   13db00b7a34fee4d819ab7f9838cc428.eot   96.3 KiB          [emitted]         
frontend    |   701ae6abd4719e9c2ada3535a497b341.eot   30.4 KiB          [emitted]         
frontend    |   82f60bd0b94a1ed68b1e6e309ce2e8c3.svg    105 KiB          [emitted]         
frontend    |   8e3c7f5520f5ae906c6cf6d7f3ddcd19.eot    104 KiB          [emitted]         
frontend    |   962a1bf31c081691065fe333d9fa8105.svg    382 KiB          [emitted]  [big]  
frontend    |   9c74e172f87984c48ddf5c8108cabe67.png   27.5 KiB          [emitted]         
frontend    |  a046592bac8f2fd96e994733faf3858c.woff   62.2 KiB          [emitted]         
frontend    |   a1a749e89f578a49306ec2b055c073da.svg    496 KiB          [emitted]  [big]  
frontend    |   a3e2211dddcba197b5bbf2aa9d5d9a9a.svg   3.19 KiB          [emitted]         
frontend    |   ad97afd3337e8cda302d10ff5a4026b8.ttf   30.2 KiB          [emitted]         
frontend    |   b87b9ba532ace76ae9f6edfe9f72ded2.ttf    103 KiB          [emitted]         
frontend    |   bff6c47a9da5c7cfa2e8a552e2df3a78.svg    3.2 KiB          [emitted]         
frontend    |   c5ebe0b32dc1b5cc449a76c4204d13bb.ttf   96.1 KiB          [emitted]         
frontend    | cd6c777f1945164224dee082abaea03a.woff2     12 KiB          [emitted]         
frontend    | e8c322de9658cbeb8a774b6624167c2c.woff2   53.2 KiB          [emitted]         
frontend    |  ef60a4f6c25ef7f39f2d25a748dbecfe.woff   14.4 KiB          [emitted]         
frontend    |  faff92145777a3cbaf8e7367b4807987.woff   49.3 KiB          [emitted]         
frontend    |                             index.html  454 bytes          [emitted]         
frontend    |                               main.css  127 bytes       0  [emitted]         main
frontend    |                                main.js   21.8 KiB       0  [emitted]         main
frontend    |                     vendors~main-1.css    602 KiB       1  [emitted]  [big]  vendors~main
frontend    |                        vendors~main.js    342 KiB       1  [emitted]  [big]  vendors~main
frontend    |            vendors~main.js.LICENSE.txt   1.37 KiB          [emitted]         
frontend    | Entrypoint main [big] = vendors~main-1.css vendors~main.js main.css main.js
frontend    |   [7] ./node_modules/semantic-ui-react/dist/es/lib/index.js + 1 modules 2.94 KiB {1} [built]
frontend    |       |    2 modules
frontend    |  [51] ./node_modules/semantic-ui-react/dist/es/elements/Icon/Icon.js + 1 modules 6.22 KiB {1} [built]
frontend    |       |    2 modules
frontend    |  [80] ./node_modules/react-redux/es/index.js + 19 modules 37 KiB {1} [built]
frontend    |       |    20 modules
frontend    |  [93] ./node_modules/semantic-ui-react/dist/es/elements/Label/Label.js + 2 modules 10.6 KiB {1} [built]
frontend    |       |    3 modules
frontend    | [212] (webpack)/buildin/global.js 472 bytes {1} [built]
frontend    | [251] ./src/assets/toscalogo_color.svg 82 bytes {0} [built]
frontend    | [252] ./src/assets/toscalogo_grayscale.svg 82 bytes {0} [built]
frontend    | [270] multi @babel/polyfill ./src 40 bytes {0} [built]
frontend    | [464] (webpack)/buildin/harmony-module.js 573 bytes {1} [built]
frontend    | [466] ./src/assets/custom.css 39 bytes {0} [built]
frontend    | [602] ./src/index.js + 18 modules 42.1 KiB {0} [built]
frontend    |       | ./src/index.js 609 bytes [built]
frontend    |       | ./src/util/store.js 481 bytes [built]
frontend    |       | ./util/common.js 117 bytes [built]
frontend    |       | ./src/util/apiConnection.js 4.57 KiB [built]
frontend    |       | ./src/util/redux/index.js 219 bytes [built]
frontend    |       | ./src/util/redux/messageReducer.js 2.15 KiB [built]
frontend    |       | ./src/util/redux/simpleReducer.js 1.86 KiB [built]
frontend    |       | ./src/util/common.js 221 bytes [built]
frontend    |       |     + 11 hidden modules
frontend    | [603] ./node_modules/semantic-ui-react/dist/es/elements/Button/Button.js + 3 modules 17.7 KiB {1} [built]
frontend    |       |    4 modules
frontend    | [612] ./node_modules/react-router-dom/es/BrowserRouter.js + 12 modules 41 KiB {1} [built]
frontend    |       |    13 modules
frontend    | [614] ./node_modules/react-router-dom/es/Switch.js + 1 modules 3.35 KiB {1} [built]
frontend    |       |    2 modules
frontend    | [615] ./node_modules/react-router-dom/es/Route.js + 1 modules 5.9 KiB {1} [built]
frontend    |       |    2 modules
frontend    |     + 989 hidden modules
frontend    | 
frontend    | WARNING in asset size limit: The following asset(s) exceed the recommended size limit (244 KiB).
frontend    | This can impact web performance.
frontend    | Assets: 
frontend    |   962a1bf31c081691065fe333d9fa8105.svg (382 KiB)
frontend    |   a1a749e89f578a49306ec2b055c073da.svg (496 KiB)
frontend    |   vendors~main-1.css (602 KiB)
frontend    |   vendors~main.js (342 KiB)
frontend    | 
frontend    | WARNING in entrypoint size limit: The following entrypoint(s) combined asset size exceeds the recommended limit (244 KiB). This can impact web performance.
frontend    | Entrypoints:
frontend    |   main (966 KiB)
frontend    |       vendors~main-1.css
frontend    |       vendors~main.js
frontend    |       main.css
frontend    |       main.js
frontend    | 
frontend    | 
frontend    | WARNING in webpack performance recommendations: 
frontend    | You can limit the size of your bundles by using import() or require.ensure to lazy load some parts of your application.
frontend    | For more info visit https://webpack.js.org/guides/code-splitting/
frontend    | Child html-webpack-plugin for "index.html":
frontend    |      1 asset
frontend    |     Entrypoint undefined = index.html
frontend    |     [2] (webpack)/buildin/global.js 472 bytes {0} [built]
frontend    |     [3] (webpack)/buildin/module.js 497 bytes {0} [built]
frontend    |         + 2 hidden modules
frontend    | Child mini-css-extract-plugin node_modules/css-loader/index.js!node_modules/semantic-ui-css/semantic.min.css:
frontend    |     Entrypoint mini-css-extract-plugin = *
frontend    |        19 modules
frontend    | Child mini-css-extract-plugin node_modules/css-loader/index.js!src/assets/custom.css:
frontend    |     Entrypoint mini-css-extract-plugin = *
frontend    |     [0] ./node_modules/css-loader!./src/assets/custom.css 340 bytes {0} [built]
frontend    |         + 1 hidden module
frontend    | UPDATE AVAILABLE The latest version of `serve` is 11.3.2
frontend    | INFO: Accepting connections at http://localhost:5000

```
---------------------------------------
Type in browser : http://127.0.0.1:5000

Then : "Press to Test"; Reply : Working! (and change color to green) 
--------------------------------------------------------


2.4

A project over at https://github.com/docker-hy/scaling-exercise has a hardly working application. Go ahead and clone it for yourself. The project already includes docker-compose.yml so you can start it by running docker-compose up.

Application should be accessible through http://localhost:3000. However it doesn’t work well enough and I’ve added a load balancer for scaling. Your task is to scale the compute containers so that the button in the application turns green.

This exercise was created with Sasu Mäkinen

Please return the used commands for this exercise.
---------------------------------------------------------
```
~>/scaling-exercise$ sudo docker-compose up --scale compute=2
Creating load-balancer              ... done
Creating scaling-exercise_compute_1 ... done
Creating scaling-exercise_compute_2 ... done
Creating calculator                 ... done
Attaching to load-balancer, calculator, scaling-exercise_compute_1, scaling-exercise_compute_2
load-balancer    | WARNING: /etc/nginx/dhparam/dhparam.pem was not found. A pre-generated dhparam.pem will be used for now while a new one
load-balancer    | is being generated in the background.  Once the new dhparam.pem is in place, nginx will be reloaded.
load-balancer    | forego     | starting dockergen.1 on port 5000
load-balancer    | forego     | starting nginx.1 on port 5100
load-balancer    | dockergen.1 | 2020/09/28 18:38:59 Generated '/etc/nginx/conf.d/default.conf' from 4 containers
load-balancer    | dockergen.1 | 2020/09/28 18:38:59 Running 'nginx -s reload'
load-balancer    | dockergen.1 | 2020/09/28 18:38:59 Watching docker events
load-balancer    | dockergen.1 | 2020/09/28 18:38:59 Contents of /etc/nginx/conf.d/default.conf did not change. Skipping notification 'nginx -s reload'
compute_2        | I just connected on port 3000!
compute_1        | I just connected on port 3000!
calculator       | 
calculator       | > calc@1.0.0 start /usr/app
calculator       | > serve -s -l 3000 dist
calculator       | 
calculator       | UPDATE AVAILABLE The latest version of `serve` is 11.3.2
calculator       | INFO: Accepting connections at http://localhost:3000
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:22 +0000] "OPTIONS / HTTP/1.1" 204 0 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Added to que
compute_1        | Started resolving loop
compute_1        | Started calculations for 3 + 3
compute_2        | Added to que
compute_2        | Started resolving loop
compute_2        | Started calculations for 6 + 6
compute_2        | Added to que
compute_1        | Added to que
compute_2        | Added to que
compute_1        | Added to que
compute_2        | Calculated 6 + 6: 12
compute_2        | Started calculations for 4 + 4
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:25 +0000] "POST / HTTP/1.1" 200 40 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_2        | Added to que
compute_1        | Calculated 3 + 3: 6
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:25 +0000] "POST / HTTP/1.1" 200 39 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Started calculations for 5 + 5
compute_1        | Added to que
compute_1        | Calculated 5 + 5: 10
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:28 +0000] "POST / HTTP/1.1" 200 40 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Started calculations for 2 + 2
compute_2        | Added to que
compute_2        | Calculated 4 + 4: 8
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:29 +0000] "POST / HTTP/1.1" 200 39 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_2        | Started calculations for 1 + 1
compute_1        | Added to que
compute_1        | Calculated 2 + 2: 4
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:32 +0000] "POST / HTTP/1.1" 200 39 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Started calculations for 9 + 9
compute_2        | Calculated 1 + 1: 2
compute_2        | Started calculations for 7 + 7
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:32 +0000] "POST / HTTP/1.1" 200 39 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Calculated 9 + 9: 18
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:36 +0000] "POST / HTTP/1.1" 200 40 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Started calculations for 10 + 10
compute_2        | Calculated 7 + 7: 14
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:36 +0000] "POST / HTTP/1.1" 200 40 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_2        | Started calculations for 8 + 8
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:39 +0000] "POST / HTTP/1.1" 200 42 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
compute_1        | Calculated 10 + 10: 20
compute_2        | Calculated 8 + 8: 16
load-balancer    | nginx.1    | compute.localtest.me 172.22.0.1 - - [28/Sep/2020:18:39:40 +0000] "POST / HTTP/1.1" 200 40 "http://localhost:3000/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0"
load-balancer    | 2020/09/28 18:40:30 [notice] 53#53: signal process started
load-balancer    | Generating DH parameters, 2048 bit long safe prime, generator 2
load-balancer    | This is going to take a long time
load-balancer    | dhparam generation complete, reloading nginx
```

-------------------------------------------------------------------
2.5

Add redis to example backend.

Redis is used to speed up some operations. Backend uses a slow api to get information. You can test the slow api by requesting /slow with curl. The frontend program has a button to test this. Before configuring redis it should take 10 to 20 seconds to get a response.

Configure a redis container to cache information for the backend. Use the documentation if needed when configuring: https://hub.docker.com/_/redis/

The backend README should have all the information needed to connect.

When you’ve correctly configured it should take less than a second to get a response and the button will turn green.

Submit the docker-compose.yml

-------------------------------------------------

```
~>/dev_ops$ cd ex_5
~>/ex_5$ sudo docker-compose build
[sudo] password for dmitri: 
redis uses an image, skipping
Building backend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV FRONT_URL="http://localhost:5000"
 ---> Using cache
 ---> fa1253019758
Step 3/10 : RUN apt-get update &&     apt-get install -y curl &&     apt-get install -y git
 ---> Using cache
 ---> 53e98c282e1a
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Using cache
 ---> ed624598a076
Step 5/10 : RUN apt install -y nodejs
 ---> Using cache
 ---> 0dbf15c52925
Step 6/10 : RUN git clone https://github.com/docker-hy/backend-example-docker
 ---> Using cache
 ---> 6bd959f5dd71
Step 7/10 : WORKDIR /backend-example-docker
 ---> Using cache
 ---> ce8aa258f9c7
Step 8/10 : RUN npm install
 ---> Using cache
 ---> 4a05ba9164ed
Step 9/10 : EXPOSE 8000
 ---> Using cache
 ---> b3cc459bc2e5
Step 10/10 : CMD npm start
 ---> Using cache
 ---> 23127e55fb86

Successfully built 23127e55fb86
Successfully tagged ex_5_backend:latest
Building frontend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV API_URL="http://localhost:8000"
 ---> Using cache
 ---> 106543d0a3bb
Step 3/10 : RUN apt-get update &&     apt-get install -y curl &&     apt-get install -y git
 ---> Using cache
 ---> 11dfcc580453
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Using cache
 ---> c73ef5ad8955
Step 5/10 : RUN apt install -y nodejs
 ---> Using cache
 ---> 98463046e1a7
Step 6/10 : RUN git clone https://github.com/docker-hy/frontend-example-docker
 ---> Using cache
 ---> 75533c17e41b
Step 7/10 : WORKDIR /frontend-example-docker
 ---> Using cache
 ---> 5c2c007bedad
Step 8/10 : RUN npm install
 ---> Using cache
 ---> 1fce318a3c01
Step 9/10 : EXPOSE 5000
 ---> Using cache
 ---> a1fe76be7783
Step 10/10 : CMD npm start
 ---> Using cache
 ---> 48bd62438b4f

Successfully built 48bd62438b4f
Successfully tagged ex_5_frontend:latest
~>/ex_5$ sudo docker-compose up
Starting backend  ... done
Starting redis    ... done
Starting frontend ... done
Attaching to backend, redis, frontend
redis       | 1:C 05 Nov 2020 10:03:53.016 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 05 Nov 2020 10:03:53.016 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 05 Nov 2020 10:03:53.016 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
redis       | 1:M 05 Nov 2020 10:03:53.023 * Running mode=standalone, port=6379.
redis       | 1:M 05 Nov 2020 10:03:53.024 # Server initialized
redis       | 1:M 05 Nov 2020 10:03:53.024 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 05 Nov 2020 10:03:53.025 * Loading RDB produced by version 6.0.9
redis       | 1:M 05 Nov 2020 10:03:53.025 * RDB age 887 seconds
redis       | 1:M 05 Nov 2020 10:03:53.026 * RDB memory usage when created 0.79 Mb
redis       | 1:M 05 Nov 2020 10:03:53.026 * DB loaded from disk: 0.001 seconds
redis       | 1:M 05 Nov 2020 10:03:53.026 * Ready to accept connections
backend     | 
backend     | > backend-example-docker@1.0.0 start /backend-example-docker
backend     | > node index.js
backend     | 
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /frontend-example-docker
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
backend     | ENV values set as follows: { DB:
backend     |    { username: undefined,
backend     |      password: undefined,
backend     |      database: undefined,
backend     |      host: 'localhost' },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://localhost:5000',
backend     |   REDIS: 'redis',
backend     |   REDIS_PORT: 6379 }
backend     | [Exercise 2.6+] DB_USERNAME and/or DB_PASSWORD are not defined, skipping db connection
backend     | Redis connection, initating..
backend     | Trying to set cache
backend     | Cache set successfully
backend     | Started on port 8000
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Hash: 0d641c4bad65cc1c02ee
frontend    | Version: webpack 4.42.1
frontend    | Time: 17244ms
frontend    | Built at: 11/05/2020 10:04:12 AM
frontend    |                                  Asset       Size  Chunks                    Chunk Names
frontend    | 0ab54153eeeca0ce03978cc463b257f7.woff2   39.2 KiB          [emitted]         
frontend    |   13db00b7a34fee4d819ab7f9838cc428.eot   96.3 KiB          [emitted]         
frontend    |   701ae6abd4719e9c2ada3535a497b341.eot   30.4 KiB          [emitted]         
frontend    |   82f60bd0b94a1ed68b1e6e309ce2e8c3.svg    105 KiB          [emitted]         
frontend    |   8e3c7f5520f5ae906c6cf6d7f3ddcd19.eot    104 KiB          [emitted]         
frontend    |   962a1bf31c081691065fe333d9fa8105.svg    382 KiB          [emitted]  [big]  
frontend    |   9c74e172f87984c48ddf5c8108cabe67.png   27.5 KiB          [emitted]         
frontend    |  a046592bac8f2fd96e994733faf3858c.woff   62.2 KiB          [emitted]         
frontend    |   a1a749e89f578a49306ec2b055c073da.svg    496 KiB          [emitted]  [big]  
frontend    |   a3e2211dddcba197b5bbf2aa9d5d9a9a.svg   3.19 KiB          [emitted]         
frontend    |   ad97afd3337e8cda302d10ff5a4026b8.ttf   30.2 KiB          [emitted]         
frontend    |   b87b9ba532ace76ae9f6edfe9f72ded2.ttf    103 KiB          [emitted]         
frontend    |   bff6c47a9da5c7cfa2e8a552e2df3a78.svg    3.2 KiB          [emitted]         
frontend    |   c5ebe0b32dc1b5cc449a76c4204d13bb.ttf   96.1 KiB          [emitted]         
frontend    | cd6c777f1945164224dee082abaea03a.woff2     12 KiB          [emitted]         
frontend    | e8c322de9658cbeb8a774b6624167c2c.woff2   53.2 KiB          [emitted]         
frontend    |  ef60a4f6c25ef7f39f2d25a748dbecfe.woff   14.4 KiB          [emitted]         
frontend    |  faff92145777a3cbaf8e7367b4807987.woff   49.3 KiB          [emitted]         
frontend    |                             index.html  454 bytes          [emitted]         
frontend    |                               main.css  127 bytes       0  [emitted]         main
frontend    |                                main.js   21.8 KiB       0  [emitted]         main
frontend    |                     vendors~main-1.css    602 KiB       1  [emitted]  [big]  vendors~main
frontend    |                        vendors~main.js    342 KiB       1  [emitted]  [big]  vendors~main
frontend    |            vendors~main.js.LICENSE.txt   1.37 KiB          [emitted]         
frontend    | Entrypoint main [big] = vendors~main-1.css vendors~main.js main.css main.js
frontend    |   [7] ./node_modules/semantic-ui-react/dist/es/lib/index.js + 1 modules 2.94 KiB {1} [built]
frontend    |       |    2 modules
frontend    |  [51] ./node_modules/semantic-ui-react/dist/es/elements/Icon/Icon.js + 1 modules 6.22 KiB {1} [built]
frontend    |       |    2 modules
frontend    |  [80] ./node_modules/react-redux/es/index.js + 19 modules 37 KiB {1} [built]
frontend    |       |    20 modules
frontend    |  [93] ./node_modules/semantic-ui-react/dist/es/elements/Label/Label.js + 2 modules 10.6 KiB {1} [built]
frontend    |       |    3 modules
frontend    | [212] (webpack)/buildin/global.js 472 bytes {1} [built]
frontend    | [251] ./src/assets/toscalogo_color.svg 82 bytes {0} [built]
frontend    | [252] ./src/assets/toscalogo_grayscale.svg 82 bytes {0} [built]
frontend    | [270] multi @babel/polyfill ./src 40 bytes {0} [built]
frontend    | [464] (webpack)/buildin/harmony-module.js 573 bytes {1} [built]
frontend    | [466] ./src/assets/custom.css 39 bytes {0} [built]
frontend    | [602] ./src/index.js + 18 modules 42.1 KiB {0} [built]
frontend    |       | ./src/index.js 609 bytes [built]
frontend    |       | ./src/util/store.js 481 bytes [built]
frontend    |       | ./util/common.js 117 bytes [built]
frontend    |       | ./src/util/apiConnection.js 4.57 KiB [built]
frontend    |       | ./src/util/redux/index.js 219 bytes [built]
frontend    |       | ./src/util/redux/messageReducer.js 2.15 KiB [built]
frontend    |       | ./src/util/redux/simpleReducer.js 1.86 KiB [built]
frontend    |       | ./src/util/common.js 221 bytes [built]
frontend    |       |     + 11 hidden modules
frontend    | [603] ./node_modules/semantic-ui-react/dist/es/elements/Button/Button.js + 3 modules 17.7 KiB {1} [built]
frontend    |       |    4 modules
frontend    | [612] ./node_modules/react-router-dom/es/BrowserRouter.js + 12 modules 41 KiB {1} [built]
frontend    |       |    13 modules
frontend    | [614] ./node_modules/react-router-dom/es/Switch.js + 1 modules 3.35 KiB {1} [built]
frontend    |       |    2 modules
frontend    | [615] ./node_modules/react-router-dom/es/Route.js + 1 modules 5.9 KiB {1} [built]
frontend    |       |    2 modules
frontend    |     + 989 hidden modules
frontend    | 
frontend    | WARNING in asset size limit: The following asset(s) exceed the recommended size limit (244 KiB).
frontend    | This can impact web performance.
frontend    | Assets: 
frontend    |   962a1bf31c081691065fe333d9fa8105.svg (382 KiB)
frontend    |   a1a749e89f578a49306ec2b055c073da.svg (496 KiB)
frontend    |   vendors~main-1.css (602 KiB)
frontend    |   vendors~main.js (342 KiB)
frontend    | 
frontend    | WARNING in entrypoint size limit: The following entrypoint(s) combined asset size exceeds the recommended limit (244 KiB). This can impact web performance.
frontend    | Entrypoints:
frontend    |   main (966 KiB)
frontend    |       vendors~main-1.css
frontend    |       vendors~main.js
frontend    |       main.css
frontend    |       main.js
frontend    | 
frontend    | 
frontend    | WARNING in webpack performance recommendations: 
frontend    | You can limit the size of your bundles by using import() or require.ensure to lazy load some parts of your application.
frontend    | For more info visit https://webpack.js.org/guides/code-splitting/
frontend    | Child html-webpack-plugin for "index.html":
frontend    |      1 asset
frontend    |     Entrypoint undefined = index.html
frontend    |     [2] (webpack)/buildin/global.js 472 bytes {0} [built]
frontend    |     [3] (webpack)/buildin/module.js 497 bytes {0} [built]
frontend    |         + 2 hidden modules
frontend    | Child mini-css-extract-plugin node_modules/css-loader/index.js!node_modules/semantic-ui-css/semantic.min.css:
frontend    |     Entrypoint mini-css-extract-plugin = *
frontend    |        19 modules
frontend    | Child mini-css-extract-plugin node_modules/css-loader/index.js!src/assets/custom.css:
frontend    |     Entrypoint mini-css-extract-plugin = *
frontend    |     [0] ./node_modules/css-loader!./src/assets/custom.css 340 bytes {0} [built]
frontend    |         + 1 hidden module
frontend    | UPDATE AVAILABLE The latest version of `serve` is 11.3.2
frontend    | INFO: Accepting connections at http://localhost:5000
backend     | Got from redis pong
backend     | ::ffff:172.23.0.1 - GET /slow HTTP/1.1 304 - - 5.896 ms

```
Reply from server: "Press to Test! Working! It took 0.034 seconds."
--------------------------------------------------------
-----------------------------------------------------------
2.6

Add database to example backend.

Lets use a postgres database to save messages. We won’t need to configure a volume since the official postgres image sets a default volume for us. Lets use the postgres image documentation to our advantage when configuring: https://hub.docker.com/_/postgres/. Especially part Environment Variables is of interest.

The backend README should have all the information needed to connect.

The button won’t turn green but you can send messages to yourself.

Submit the docker-compose.yml

    TIP: When configuring the database, you might need to destroy the automatically created volumes. Use command docker volume prune, docker volume ls and docker volume rm to remove unused volumes when testing. Make sure to remove containers that depend on them beforehand.

    restart: unless-stopped can help if the postgres takes a while to get ready
------------------------------------------------
----------------------------------
