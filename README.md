### The exercises for the Part 2 of the course : 

## DevOps with Docker , Helsinki University : https://devopswithdocker.com/part2/

I used some tips from: https://github.com/aanykanen/docker-mooc-2020  
and   
https://github.com/riihikallio/docker

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
```
~>/ex_6$ sudo docker-compose build
redis uses an image, skipping
postgres uses an image, skipping
Building backend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV FRONT_URL="http://localhost:5000"
 ---> Using cache
 ---> fa1253019758
Step 3/10 : RUN apt-get update &&     apt-get install -y git &&     apt-get install -y curl
 ---> Using cache
 ---> 1f3669fd67b9
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Using cache
 ---> 918ed4995b70
Step 5/10 : RUN apt install -y nodejs
 ---> Using cache
 ---> 99c5ec1cdfc2
Step 6/10 : RUN git clone https://github.com/docker-hy/backend-example-docker
 ---> Using cache
 ---> 6b08762bc313
Step 7/10 : WORKDIR /backend-example-docker
 ---> Using cache
 ---> 73d268a1325b
Step 8/10 : RUN npm install
 ---> Using cache
 ---> 570703000363
Step 9/10 : EXPOSE 8000
 ---> Using cache
 ---> 869d8c758d8b
Step 10/10 : CMD ["npm", "start"]
 ---> Using cache
 ---> f3290bbcb4b1

Successfully built f3290bbcb4b1
Successfully tagged ex_6_backend:latest
Building frontend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV API_URL="http://localhost:8000"
 ---> Using cache
 ---> 106543d0a3bb
Step 3/10 : RUN apt-get update &&     apt-get install -y git &&     apt-get install -y curl
 ---> Using cache
 ---> d8dd05e2653c
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Using cache
 ---> 3c6a509f82ea
Step 5/10 : RUN apt install -y nodejs
 ---> Using cache
 ---> ddbc195ecf06
Step 6/10 : RUN git clone https://github.com/docker-hy/frontend-example-docker
 ---> Using cache
 ---> 8d1eaa7898f0
Step 7/10 : WORKDIR /frontend-example-docker
 ---> Using cache
 ---> 1237819e1511
Step 8/10 : RUN npm install
 ---> Using cache
 ---> 759c676136ce
Step 9/10 : EXPOSE 5000
 ---> Using cache
 ---> 2c0253c2d978
Step 10/10 : CMD ["npm", "start"]
 ---> Using cache
 ---> e8ec724996b3

Successfully built e8ec724996b3
Successfully tagged ex_6_frontend:latest
~>/ex_6$ sudo docker-compose up
Starting redis       ... done
Starting postgres_db ... done
Starting backend     ... done
Starting frontend    ... done
Attaching to redis, postgres_db, backend, frontend
backend     | 
backend     | > backend-example-docker@1.0.0 start /backend-example-docker
backend     | > node index.js
backend     | 
postgres_db | 
postgres_db | PostgreSQL Database directory appears to contain a database; Skipping initialization
postgres_db | 
backend     | ENV values set as follows: { DB:
backend     |    { username: 'postgres',
backend     |      password: 'password',
backend     |      database: 'my_postgres',
backend     |      host: 'postgres' },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://localhost:5000',
backend     |   REDIS: 'redis',
backend     |   REDIS_PORT: 6379 }
postgres_db | 2020-11-05 13:13:35.851 UTC [1] LOG:  starting PostgreSQL 13.0 (Debian 13.0-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
postgres_db | 2020-11-05 13:13:35.852 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres_db | 2020-11-05 13:13:35.852 UTC [1] LOG:  listening on IPv6 address "::", port 5432
redis       | 1:C 05 Nov 2020 13:13:35.640 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 05 Nov 2020 13:13:35.640 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 05 Nov 2020 13:13:35.640 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
postgres_db | 2020-11-05 13:13:35.854 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgres_db | 2020-11-05 13:13:35.874 UTC [26] LOG:  database system was shut down at 2020-11-05 13:11:34 UTC
redis       | 1:M 05 Nov 2020 13:13:35.642 * Running mode=standalone, port=6379.
redis       | 1:M 05 Nov 2020 13:13:35.643 # Server initialized
redis       | 1:M 05 Nov 2020 13:13:35.643 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 05 Nov 2020 13:13:35.643 * Loading RDB produced by version 6.0.9
redis       | 1:M 05 Nov 2020 13:13:35.643 * RDB age 121 seconds
redis       | 1:M 05 Nov 2020 13:13:35.643 * RDB memory usage when created 0.77 Mb
redis       | 1:M 05 Nov 2020 13:13:35.643 * DB loaded from disk: 0.000 seconds
redis       | 1:M 05 Nov 2020 13:13:35.643 * Ready to accept connections
postgres_db | 2020-11-05 13:13:35.882 UTC [1] LOG:  database system is ready to accept connections
backend     | Testing database connection
backend     | Redis connection, initating..
backend     | Trying to set cache
backend     | Cache set successfully
backend     | Started on port 8000
backend     | Executing (default): SELECT 1+1 AS result
backend     | Connection ok, syncing database with model.
backend     | Executing (default): CREATE TABLE IF NOT EXISTS "messages" ("id"   SERIAL , "body" VARCHAR(255), "created_at" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));
backend     | Executing (default): SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'messages' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
backend     | Database connection established!
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /frontend-example-docker
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Hash: 0d641c4bad65cc1c02ee
frontend    | Version: webpack 4.42.1
frontend    | Time: 17102ms
frontend    | Built at: 11/05/2020 1:13:56 PM
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
backend     | ::ffff:172.25.0.1 - OPTIONS /messages HTTP/1.1 200 13 - 3.813 ms
backend     | ::ffff:172.25.0.1 - POST /messages HTTP/1.1 201 7 - 6.184 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:172.25.0.1 - OPTIONS /messages HTTP/1.1 200 13 - 0.629 ms
backend     | ::ffff:172.25.0.1 - POST /messages HTTP/1.1 201 7 - 1.300 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:172.25.0.1 - OPTIONS /messages HTTP/1.1 200 13 - 0.468 ms
backend     | ::ffff:172.25.0.1 - POST /messages HTTP/1.1 201 7 - 0.964 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | Executing (default): SELECT "id", "body", "created_at" AS "createdAt", "updated_at" AS "updatedAt" FROM "messages" AS "message";
backend     | ::ffff:172.25.0.1 - GET /messages HTTP/1.1 200 747 - 11.230 ms
^CGracefully stopping... (press Ctrl+C again to force)
Stopping frontend    ... done
Stopping backend     ... done
Stopping redis       ... done
Stopping postgres_db ... done
```
-------------------------------------------------
---------------------------------------------------

2.7

Configure a machine learning project.

Look into machine learning project created with Python and React and split into three parts: frontend, backend and training

Note that the training requires 2 volumes and backend should share volume /src/model with training.

The frontend will display on http://localhost:3000 and the application will tell if the subject of an image looks more like a cucumber or a moped.

Submit the docker-compose.yml

    This exercise is known to have broken for some attendees based on CPU. The error looks something like “Illegal instruction (core dumped)”. Try downgrading / upgrading the tensorflow found in requirements.txt or join the telegram channel and message with @jakousa.

    Note that the generated model is a toy and will not produce good results.

    It will take SEVERAL minutes to build the docker images, download training pictures and train the classifying model.

This exercise was created by Sasu Mäkinen
-------------------------------------------------
--------------------------------------------------

2.8

Add nginx to example frontend + backend.
Accessing your service from arbitrary port is counter intuitive since browsers use 80 (http) and 443 (https) by default. And having the service refer to two origins in a case where there’s only one backend isn’t desirable either. We will skip the SSL setup for https/443.

Nginx will function as a reverse proxy for us (see the image above). The requests arriving at anything other than /api will be redirected to frontend container and /api will get redirected to backend container.

At the end you should see that the frontend is accessible simply by going to http://localhost and the button works. Other buttons may have stopped working, do not worry about them.

As we will not start configuring reverse proxies on this course you can have a simple config file:

The following file should be set to /etc/nginx/nginx.conf inside the nginx container. You can use a file volume where the contents of the file are the following:

  events { worker_connections 1024; }

  http {
    server {
      listen 80;

      location / {
        proxy_pass _frontend-connection-url_;
      }

      location /api/ {
        proxy_pass _backend-connection-url_;
      }
    }
  }

Note that again inside the docker-compose network the connecting urls are usually form “http://hostname:port” where hostname and port are both known only inside the network.

Submit the docker-compose.yml
------------------------------------------------
-------------------------------------------------

```
~>/ex_8$ sudo docker-compose up
Starting backend  ... done
Starting postgres ... done
Starting frontend ... done
Starting redis    ... done
Starting nginx    ... done
Attaching to postgres, redis, frontend, backend, nginx
nginx       | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
nginx       | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
redis       | 1:C 08 Nov 2020 10:01:13.140 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 08 Nov 2020 10:01:13.140 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 08 Nov 2020 10:01:13.140 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
redis       | 1:M 08 Nov 2020 10:01:13.144 * Running mode=standalone, port=6379.
redis       | 1:M 08 Nov 2020 10:01:13.145 # Server initialized
redis       | 1:M 08 Nov 2020 10:01:13.145 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 08 Nov 2020 10:01:13.146 * Loading RDB produced by version 6.0.9
redis       | 1:M 08 Nov 2020 10:01:13.146 * RDB age 157 seconds
redis       | 1:M 08 Nov 2020 10:01:13.146 * RDB memory usage when created 0.79 Mb
redis       | 1:M 08 Nov 2020 10:01:13.146 * DB loaded from disk: 0.001 seconds
redis       | 1:M 08 Nov 2020 10:01:13.146 * Ready to accept connections
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /usr/app
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
postgres    | 
postgres    | PostgreSQL Database directory appears to contain a database; Skipping initialization
postgres    | 
postgres    | 2020-11-08 10:01:13.219 UTC [1] LOG:  starting PostgreSQL 13.0 (Debian 13.0-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
postgres    | 2020-11-08 10:01:13.223 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres    | 2020-11-08 10:01:13.223 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgres    | 2020-11-08 10:01:13.225 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgres    | 2020-11-08 10:01:13.247 UTC [25] LOG:  database system was shut down at 2020-11-08 09:58:36 UTC
postgres    | 2020-11-08 10:01:13.269 UTC [1] LOG:  database system is ready to accept connections
nginx       | 10-listen-on-ipv6-by-default.sh: error: IPv6 listen already enabled
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx       | /docker-entrypoint.sh: Configuration complete; ready for start up
backend     | 
backend     | > backend-example-docker@1.0.0 start /usr/app
backend     | > node index.js
backend     | 
backend     | ENV values set as follows: {
backend     |   DB: {
backend     |     username: 'name',
backend     |     password: 'password',
backend     |     database: 'messages',
backend     |     host: 'postgres'
backend     |   },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://localhost',
backend     |   REDIS: 'redis',
backend     |   REDIS_PORT: 6379
backend     | }
backend     | Testing database connection
backend     | Redis connection, initating..
backend     | Trying to set cache
backend     | Cache set successfully
backend     | Started on port 8000
backend     | Executing (default): SELECT 1+1 AS result
backend     | Connection ok, syncing database with model.
backend     | Executing (default): CREATE TABLE IF NOT EXISTS "messages" ("id"   SERIAL , "body" VARCHAR(255), "created_at" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));
backend     | Executing (default): SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'messages' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
backend     | Database connection established!
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Hash: 5e72b9e8a4c537ea2c72
frontend    | Version: webpack 4.42.1
frontend    | Time: 27431ms
frontend    | Built at: 11/08/2020 10:01:43 AM
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
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /main.css HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /vendors~main-1.css HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /main.js HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /vendors~main.js HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /a3e2211dddcba197b5bbf2aa9d5d9a9a.svg HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:48 +0000] "GET /favicon.ico HTTP/1.1" 200 454 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 172.28.0.1 - - [08/Nov/2020:10:01:52 +0000] "GET /api/ping HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - GET /ping HTTP/1.0 304 - - 6.729 ms
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:02 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 8.976 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:03 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 1.800 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:03 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 2.558 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:03 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 1.869 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:03 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 2.078 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:03 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 1.914 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:04 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - POST /messages HTTP/1.0 201 7 - 1.223 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | Executing (default): SELECT "id", "body", "created_at" AS "createdAt", "updated_at" AS "updatedAt" FROM "messages" AS "message";
nginx       | 172.28.0.1 - - [08/Nov/2020:10:02:05 +0000] "GET /api/messages HTTP/1.1" 200 1633 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:172.28.0.6 - GET /messages HTTP/1.0 200 1633 - 14.644 ms
^CGracefully stopping... (press Ctrl+C again to force)
Stopping nginx    ... done
Stopping postgres ... done
Stopping redis    ... done
Stopping backend  ... done
Stopping frontend ... done
~>/ex_8$ 
```
Exercise 2.8: Working!
--------------------------------
-----------------------------------


2.9

Postgres image uses a volume by default. Manually define volumes for the database in convenient location such as in ./database . Use the image documentations (postgres) to help you with the task. You may do the same for redis as well.

After you have configured the volume:

    Save a few messages through the frontend
    Run docker-compose down
    Run docker-compose up and see that the messages are available after refreshing browser
    Run docker-compose down and delete the volume folder manually
    Run docker-compose up and the data should be gone

Maybe it would be simpler to back them up now that you know where they are.

    TIP: To save you the trouble of testing all of those steps, just look into the folder before trying the steps. If it’s empty after docker-compose up then something is wrong.

    TIP: Since you may have broken the buttons in nginx exercise you should test with docker-compose.yml from before it

Submit the docker-compose.yml
--------------------------------------
--------------------------------------
```
~>/ex_9$ sudo docker-compose build
redis uses an image, skipping
postgres uses an image, skipping
proxy uses an image, skipping
Building back
Step 1/5 : FROM alpine
 ---> d6e46aa2470d
Step 2/5 : WORKDIR /usr/app
 ---> Using cache
 ---> ba1c514d1f4d
Step 3/5 : RUN apk add --no-cache git nodejs nodejs-npm &&     git clone https://github.com/docker-hy/backend-example-docker.git . &&     npm install
 ---> Using cache
 ---> c0265685cd33
Step 4/5 : EXPOSE 8000
 ---> Using cache
 ---> f2299ed3961e
Step 5/5 : CMD npm start
 ---> Using cache
 ---> f6c171ab9b78

Successfully built f6c171ab9b78
Successfully tagged ex_9_back:latest
Building front
Step 1/5 : FROM alpine
 ---> d6e46aa2470d
Step 2/5 : WORKDIR /usr/app
 ---> Using cache
 ---> ba1c514d1f4d
Step 3/5 : RUN apk add --no-cache git nodejs nodejs-npm &&     git clone https://github.com/docker-hy/frontend-example-docker.git . &&     npm install
 ---> Using cache
 ---> b4f9096f130d
Step 4/5 : EXPOSE 5000
 ---> Using cache
 ---> dade8899523c
Step 5/5 : CMD npm start
 ---> Using cache
 ---> eed6fd57ce71

Successfully built eed6fd57ce71
Successfully tagged ex_9_front:latest
~>/ex_9$ sudo docker-compose up
Creating network "ex_9_default" with the default driver
Creating postgres ... done
Creating redis    ... done
Creating frontend ... done
Creating backend  ... done
Creating nginx    ... done
Attaching to postgres, redis, frontend, backend, nginx
backend     | 
backend     | > backend-example-docker@1.0.0 start /usr/app
backend     | > node index.js
backend     | 
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /usr/app
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
nginx       | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
nginx       | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
postgres    | 
postgres    | PostgreSQL Database directory appears to contain a database; Skipping initialization
postgres    | 
postgres    | 2020-11-08 12:14:00.198 UTC [1] LOG:  starting PostgreSQL 13.0 (Debian 13.0-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
postgres    | 2020-11-08 12:14:00.207 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres    | 2020-11-08 12:14:00.207 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgres    | 2020-11-08 12:14:00.209 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
redis       | 1:C 08 Nov 2020 12:14:00.162 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 08 Nov 2020 12:14:00.162 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 08 Nov 2020 12:14:00.162 # Configuration loaded
postgres    | 2020-11-08 12:14:00.244 UTC [27] LOG:  database system was shut down at 2020-11-08 12:03:13 UTC
postgres    | 2020-11-08 12:14:00.255 UTC [1] LOG:  database system is ready to accept connections
redis       | 1:M 08 Nov 2020 12:14:00.164 * Running mode=standalone, port=6379.
redis       | 1:M 08 Nov 2020 12:14:00.165 # Server initialized
redis       | 1:M 08 Nov 2020 12:14:00.165 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 08 Nov 2020 12:14:00.165 * Ready to accept connections
nginx       | 10-listen-on-ipv6-by-default.sh: Getting the checksum of /etc/nginx/conf.d/default.conf
nginx       | 10-listen-on-ipv6-by-default.sh: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx       | /docker-entrypoint.sh: Configuration complete; ready for start up
backend     | ENV values set as follows: {
backend     |   DB: {
backend     |     username: 'name',
backend     |     password: 'password',
backend     |     database: 'messages',
backend     |     host: 'postgres'
backend     |   },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://localhost',
backend     |   REDIS: 'redis',
backend     |   REDIS_PORT: 6379
backend     | }
backend     | Testing database connection
backend     | Redis connection, initating..
backend     | Trying to set cache
backend     | Cache set successfully
backend     | Started on port 8000
backend     | Executing (default): SELECT 1+1 AS result
backend     | Connection ok, syncing database with model.
backend     | Executing (default): CREATE TABLE IF NOT EXISTS "messages" ("id"   SERIAL , "body" VARCHAR(255), "created_at" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));
backend     | Executing (default): SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'messages' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
backend     | Database connection established!
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Hash: 5e72b9e8a4c537ea2c72
frontend    | Version: webpack 4.42.1
frontend    | Time: 35849ms
frontend    | Built at: 11/08/2020 12:14:39 PM
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
nginx       | 192.168.80.1 - - [08/Nov/2020:12:14:59 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.80.6 - POST /messages HTTP/1.0 201 7 - 17.421 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:192.168.80.6 - POST /messages HTTP/1.0 201 7 - 2.489 ms
nginx       | 192.168.80.1 - - [08/Nov/2020:12:14:59 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.80.1 - - [08/Nov/2020:12:15:00 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.80.6 - POST /messages HTTP/1.0 201 7 - 2.419 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:192.168.80.6 - POST /messages HTTP/1.0 201 7 - 1.809 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.80.1 - - [08/Nov/2020:12:15:00 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.80.1 - - [08/Nov/2020:12:15:00 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.80.6 - POST /messages HTTP/1.0 201 7 - 1.577 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | Executing (default): SELECT "id", "body", "created_at" AS "createdAt", "updated_at" AS "updatedAt" FROM "messages" AS "message";
nginx       | 192.168.80.1 - - [08/Nov/2020:12:15:01 +0000] "GET /api/messages HTTP/1.1" 200 2124 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.80.6 - GET /messages HTTP/1.0 200 2124 - 17.944 ms
backend     | Executing (default): SELECT "id", "body", "created_at" AS "createdAt", "updated_at" AS "updatedAt" FROM "messages" AS "message";
nginx       | 192.168.80.1 - - [08/Nov/2020:12:19:47 +0000] "GET /api/messages HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.80.6 - GET /messages HTTP/1.0 304 - - 19.909 ms
postgres    | 2020-11-08 12:21:17.339 UTC [1] LOG:  received fast shutdown request
postgres    | 2020-11-08 12:21:17.340 UTC [1] LOG:  aborting any active transactions
postgres    | 2020-11-08 12:21:17.345 UTC [1] LOG:  background worker "logical replication launcher" (PID 33) exited with exit code 1
postgres    | 2020-11-08 12:21:17.347 UTC [28] LOG:  shutting down
redis       | 1:signal-handler (1604838077) Received SIGTERM scheduling shutdown...
redis       | 1:M 08 Nov 2020 12:21:17.377 # User requested shutdown...
redis       | 1:M 08 Nov 2020 12:21:17.378 * Calling fsync() on the AOF file.
redis       | 1:M 08 Nov 2020 12:21:17.378 # Redis is now ready to exit, bye bye...
postgres    | 2020-11-08 12:21:17.388 UTC [1] LOG:  database system is shut down
backend     | events.js:292
backend     |       throw er; // Unhandled 'error' event
backend     |       ^
backend     | 
backend     | Error: Redis connection to redis:6379 failed - getaddrinfo ENOTFOUND redis
backend     |     at GetAddrInfoReqWrap.onlookup [as oncomplete] (dns.js:66:26)
backend     | Emitted 'error' event on RedisClient instance at:
backend     |     at RedisClient.on_error (/usr/app/node_modules/redis/index.js:341:14)
backend     |     at Socket.<anonymous> (/usr/app/node_modules/redis/index.js:222:14)
backend     |     at Socket.emit (events.js:315:20)
backend     |     at emitErrorNT (internal/streams/destroy.js:92:8)
backend     |     at emitErrorAndCloseNT (internal/streams/destroy.js:60:3)
backend     |     at processTicksAndRejections (internal/process/task_queues.js:84:21) {
backend     |   errno: 'ENOTFOUND',
backend     |   code: 'ENOTFOUND',
backend     |   syscall: 'getaddrinfo',
backend     |   hostname: 'redis'
backend     | }
backend     | npm ERR! code ELIFECYCLE
backend     | npm ERR! errno 1
backend     | npm ERR! backend-example-docker@1.0.0 start: `node index.js`
backend     | npm ERR! Exit status 1
backend     | npm ERR! 
backend     | npm ERR! Failed at the backend-example-docker@1.0.0 start script.
backend     | npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
backend     | 
backend     | npm ERR! A complete log of this run can be found in:
backend     | npm ERR!     /root/.npm/_logs/2020-11-08T12_21_17_674Z-debug.log
redis exited with code 0
postgres exited with code 0
nginx exited with code 0
frontend    | 
frontend    | INFO: Gracefully shutting down. Please wait...
backend exited with code 1
frontend exited with code 0
~>/ex_9$ 
```
---------------------------------------------------
----------------------------------------------------

2.10

Some buttons may have stopped working in the frontend + backend project. Make sure that every button for exercises works.

This may need a peek into the browsers developer consoles again like back part 1. The buttons of nginx exercise and the first button behave differently but you want them to match.

If you had to do any changes explain what you had to change.

Submit the docker-compose yml and both dockerfiles.
---------------------------------------------
----------------------------------------------
```
~>/ex_10$ sudo docker-compose build
redis uses an image, skipping
postgres uses an image, skipping
proxy uses an image, skipping
Building back
Step 1/5 : FROM alpine
 ---> d6e46aa2470d
Step 2/5 : WORKDIR /usr/app
 ---> Running in e058e5a45d74
Removing intermediate container e058e5a45d74
 ---> e1c5e147782f
Step 3/5 : RUN apk add --no-cache git nodejs nodejs-npm &&     git clone https://github.com/docker-hy/backend-example-docker.git . &&     npm install
 ---> Running in 3e56bb22bc63
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
(1/13) Installing ca-certificates (20191127-r4)
(2/13) Installing nghttp2-libs (1.41.0-r0)
(3/13) Installing libcurl (7.69.1-r1)
(4/13) Installing expat (2.2.9-r1)
(5/13) Installing pcre2 (10.35-r0)
(6/13) Installing git (2.26.2-r0)
(7/13) Installing brotli-libs (1.0.9-r1)
(8/13) Installing c-ares (1.16.1-r0)
(9/13) Installing libgcc (9.3.0-r2)
(10/13) Installing libstdc++ (9.3.0-r2)
(11/13) Installing libuv (1.38.1-r0)
(12/13) Installing nodejs (12.18.4-r0)
(13/13) Installing npm (12.18.4-r0)
Executing busybox-1.31.1-r19.trigger
Executing ca-certificates-20191127-r4.trigger
OK: 80 MiB in 27 packages
Cloning into '.'...

> nodemon@2.0.4 postinstall /usr/app/node_modules/nodemon
> node bin/postinstall || exit 0

Love nodemon? You can now support the project via the open collective:
 > https://opencollective.com/nodemon/donate

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.3 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 210 packages from 176 contributors and audited 211 packages in 8.452s

10 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

Removing intermediate container 3e56bb22bc63
 ---> b94c752d7d5b
Step 4/5 : EXPOSE 8000
 ---> Running in d3b46a9dd3a8
Removing intermediate container d3b46a9dd3a8
 ---> d15f529ec991
Step 5/5 : CMD npm start
 ---> Running in 9defd47da3f1
Removing intermediate container 9defd47da3f1
 ---> 59fbcd1ca747

Successfully built 59fbcd1ca747
Successfully tagged ex_10_back:latest
Building front
Step 1/5 : FROM alpine
 ---> d6e46aa2470d
Step 2/5 : WORKDIR /usr/app
 ---> Using cache
 ---> e1c5e147782f
Step 3/5 : RUN apk add --no-cache git nodejs nodejs-npm &&     git clone https://github.com/docker-hy/frontend-example-docker.git . &&     npm install
 ---> Running in 8869ccb46b1c
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
(1/13) Installing ca-certificates (20191127-r4)
(2/13) Installing nghttp2-libs (1.41.0-r0)
(3/13) Installing libcurl (7.69.1-r1)
(4/13) Installing expat (2.2.9-r1)
(5/13) Installing pcre2 (10.35-r0)
(6/13) Installing git (2.26.2-r0)
(7/13) Installing brotli-libs (1.0.9-r1)
(8/13) Installing c-ares (1.16.1-r0)
(9/13) Installing libgcc (9.3.0-r2)
(10/13) Installing libstdc++ (9.3.0-r2)
(11/13) Installing libuv (1.38.1-r0)
(12/13) Installing nodejs (12.18.4-r0)
(13/13) Installing npm (12.18.4-r0)
Executing busybox-1.31.1-r19.trigger
Executing ca-certificates-20191127-r4.trigger
OK: 80 MiB in 27 packages
Cloning into '.'...

> core-js@2.6.11 postinstall /usr/app/node_modules/core-js
> node -e "try{require('./postinstall')}catch(e){}"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.12 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.12: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 1462 packages from 472 contributors and audited 1532 packages in 47.892s

28 packages are looking for funding
  run `npm fund` for details

found 271 vulnerabilities (263 low, 2 moderate, 6 high)
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container 8869ccb46b1c
 ---> f64eb950584a
Step 4/5 : EXPOSE 5000
 ---> Running in 263c072b8b2e
Removing intermediate container 263c072b8b2e
 ---> 3adb2e93af0a
Step 5/5 : CMD npm start
 ---> Running in 377af09df9bd
Removing intermediate container 377af09df9bd
 ---> fd3f8f7a4e1c

Successfully built fd3f8f7a4e1c
Successfully tagged ex_10_front:latest
~>/ex_10$ sudo docker-compose up
Creating backend  ... done
Creating frontend ... done
Creating redis    ... done
Creating postgres ... done
Creating nginx    ... done
Attaching to redis, backend, postgres, frontend, nginx
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /usr/app
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
nginx       | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
nginx       | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
postgres    | 
postgres    | PostgreSQL Database directory appears to contain a database; Skipping initialization
postgres    | 
postgres    | 2020-11-08 13:03:12.885 UTC [1] LOG:  starting PostgreSQL 13.0 (Debian 13.0-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
postgres    | 2020-11-08 13:03:12.891 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres    | 2020-11-08 13:03:12.891 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgres    | 2020-11-08 13:03:12.912 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgres    | 2020-11-08 13:03:12.923 UTC [25] LOG:  database system was shut down at 2020-11-08 12:21:17 UTC
postgres    | 2020-11-08 13:03:12.972 UTC [1] LOG:  database system is ready to accept connections
redis       | 1:C 08 Nov 2020 13:03:12.311 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 08 Nov 2020 13:03:12.311 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 08 Nov 2020 13:03:12.311 # Configuration loaded
redis       | 1:M 08 Nov 2020 13:03:12.315 * Running mode=standalone, port=6379.
redis       | 1:M 08 Nov 2020 13:03:12.316 # Server initialized
redis       | 1:M 08 Nov 2020 13:03:12.316 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 08 Nov 2020 13:03:12.317 * DB loaded from append only file: 0.001 seconds
redis       | 1:M 08 Nov 2020 13:03:12.317 * Ready to accept connections
nginx       | 10-listen-on-ipv6-by-default.sh: Getting the checksum of /etc/nginx/conf.d/default.conf
nginx       | 10-listen-on-ipv6-by-default.sh: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
nginx       | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx       | /docker-entrypoint.sh: Configuration complete; ready for start up
backend     | 
backend     | > backend-example-docker@1.0.0 start /usr/app
backend     | > node index.js
backend     | 
backend     | ENV values set as follows: {
backend     |   DB: {
backend     |     username: 'name',
backend     |     password: 'password',
backend     |     database: 'messages',
backend     |     host: 'postgres'
backend     |   },
backend     |   PORT: 8000,
backend     |   FRONT_URL: 'http://localhost',
backend     |   REDIS: 'redis',
backend     |   REDIS_PORT: 6379
backend     | }
backend     | Testing database connection
backend     | Redis connection, initating..
backend     | Trying to set cache
backend     | Cache set successfully
backend     | Started on port 8000
backend     | Executing (default): SELECT 1+1 AS result
backend     | Connection ok, syncing database with model.
backend     | Executing (default): CREATE TABLE IF NOT EXISTS "messages" ("id"   SERIAL , "body" VARCHAR(255), "created_at" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));
backend     | Executing (default): SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'messages' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
backend     | Database connection established!
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Browserslist: caniuse-lite is outdated. Please run:
frontend    | npx browserslist@latest --update-db
frontend    | Hash: 5e72b9e8a4c537ea2c72
frontend    | Version: webpack 4.42.1
frontend    | Time: 41504ms
frontend    | Built at: 11/08/2020 1:03:57 PM
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
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /vendors~main-1.css HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /main.css HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /vendors~main.js HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /main.js HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /a3e2211dddcba197b5bbf2aa9d5d9a9a.svg HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:51 +0000] "GET /favicon.ico HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | Got from redis pong
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:55 +0000] "GET /api/slow HTTP/1.1" 200 4 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - GET /slow HTTP/1.0 200 4 - 10.799 ms
nginx       | 192.168.16.1 - - [08/Nov/2020:13:06:59 +0000] "GET /api/ping HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - GET /ping HTTP/1.0 304 - - 1.024 ms
backend     | ::ffff:192.168.16.6 - GET /ping HTTP/1.0 304 - - 0.718 ms
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:01 +0000] "GET /api/ping HTTP/1.1" 304 0 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:41 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 10.837 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:41 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 2.376 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:41 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.977 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.688 ms
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:42 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.917 ms
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:42 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.659 ms
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:42 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:42 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.400 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:42 +0000] "POST /api/messages HTTP/1.1" 201 7 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - POST /messages HTTP/1.0 201 7 - 1.744 ms
backend     | Executing (default): INSERT INTO "messages" ("id","body","created_at","updated_at") VALUES (DEFAULT,$1,$2,$3) RETURNING "id","body","created_at","updated_at";
backend     | Executing (default): SELECT "id", "body", "created_at" AS "createdAt", "updated_at" AS "updatedAt" FROM "messages" AS "message";
nginx       | 192.168.16.1 - - [08/Nov/2020:13:07:43 +0000] "GET /api/messages HTTP/1.1" 200 3068 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
backend     | ::ffff:192.168.16.6 - GET /messages HTTP/1.0 200 3068 - 18.074 ms
redis       | 1:signal-handler (1604841135) Received SIGTERM scheduling shutdown...
postgres    | 2020-11-08 13:12:15.840 UTC [1] LOG:  received fast shutdown request
postgres    | 2020-11-08 13:12:15.843 UTC [1] LOG:  aborting any active transactions
postgres    | 2020-11-08 13:12:15.845 UTC [1] LOG:  background worker "logical replication launcher" (PID 31) exited with exit code 1
postgres    | 2020-11-08 13:12:15.851 UTC [26] LOG:  shutting down
postgres    | 2020-11-08 13:12:15.898 UTC [1] LOG:  database system is shut down
redis       | 1:M 08 Nov 2020 13:12:15.934 # User requested shutdown...
redis       | 1:M 08 Nov 2020 13:12:15.934 * Calling fsync() on the AOF file.
redis       | 1:M 08 Nov 2020 13:12:15.934 # Redis is now ready to exit, bye bye...
redis exited with code 0
postgres exited with code 0
nginx exited with code 0
frontend    | 
frontend    | INFO: Gracefully shutting down. Please wait...
backend exited with code 0
frontend exited with code 0
~>/ex_10$ 
```
#### All buttons are working !!! (from initial configuration....)
Part 1
Exercise 1.10: Congratulations! You configured your ports correctly!
Exercise 1.12: Working!
Part 2
Exercise 2.5: Working! It took 0.049 seconds.
Exercise 2.6:
Hello from EX_10 !!!
Hello !
Hello !
Hello !
Hello !
Hello !
Hello !
Hello !
Hello !
Hello !
Hello !
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
Hello from EX_10 !!!
New message : hello!
New message : hello!
New message : hello!
New message : hello!
New new message : hello!
New new message : hello!
New new message : hello!
New new message : hello!
New new message : hello!
Exercise 2.8: Working!

