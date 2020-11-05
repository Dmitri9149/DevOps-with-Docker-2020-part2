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
~>/ex_5$ sudo docker-compose build
redis uses an image, skipping
Building backend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV FRONT_URL="http://localhost:5000"
 ---> Running in 79b55980cf6a
Removing intermediate container 79b55980cf6a
 ---> fa1253019758
Step 3/10 : RUN apt-get update &&     apt-get install -y curl &&     apt-get install -y git
 ---> Running in 457370cc573f
Get:1 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-backports InRelease [107 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages [1558 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial/restricted amd64 Packages [14.1 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages [9827 kB]
Get:8 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [1841 kB]
Get:9 http://security.ubuntu.com/ubuntu xenial-security/restricted amd64 Packages [15.9 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial/multiverse amd64 Packages [176 kB]
Get:11 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [968 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages [2353 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/restricted amd64 Packages [16.4 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 Packages [1512 kB]
Get:15 http://security.ubuntu.com/ubuntu xenial-security/multiverse amd64 Packages [9249 B]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/multiverse amd64 Packages [26.7 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-backports/main amd64 Packages [10.9 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial-backports/universe amd64 Packages [12.6 kB]
Fetched 18.9 MB in 4s (4102 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  ca-certificates krb5-locales libasn1-8-heimdal libcurl3-gnutls libffi6
  libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal
  libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal
  libidn11 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3
  libkrb5support0 libldap-2.4-2 libnettle6 libp11-kit0 libroken18-heimdal
  librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0
  libssl1.0.0 libtasn1-6 libwind0-heimdal openssl
Suggested packages:
  gnutls-bin krb5-doc krb5-user libsasl2-modules-otp libsasl2-modules-ldap
  libsasl2-modules-sql libsasl2-modules-gssapi-mit
  | libsasl2-modules-gssapi-heimdal
The following NEW packages will be installed:
  ca-certificates curl krb5-locales libasn1-8-heimdal libcurl3-gnutls libffi6
  libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal
  libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal
  libidn11 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3
  libkrb5support0 libldap-2.4-2 libnettle6 libp11-kit0 libroken18-heimdal
  librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0
  libssl1.0.0 libtasn1-6 libwind0-heimdal openssl
0 upgraded, 34 newly installed, 0 to remove and 1 not upgraded.
Need to get 5332 kB of archives.
After this operation, 19.0 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libffi6 amd64 3.2.1-4 [17.8 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgmp10 amd64 2:6.1.0+dfsg-2 [240 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libnettle6 amd64 3.2-1ubuntu0.16.04.1 [93.5 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhogweed4 amd64 3.2-1ubuntu0.16.04.1 [136 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libidn11 amd64 1.32-3ubuntu1.2 [46.5 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libp11-kit0 amd64 0.23.2-5~ubuntu16.04.1 [105 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libtasn1-6 amd64 4.7-3ubuntu0.16.04.3 [43.5 kB]
Get:8 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgnutls30 amd64 3.4.10-4ubuntu1.8 [548 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsqlite3-0 amd64 3.11.0-1ubuntu1.5 [398 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libssl1.0.0 amd64 1.0.2g-1ubuntu4.17 [1082 kB]
Get:11 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 openssl amd64 1.0.2g-1ubuntu4.17 [492 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 ca-certificates all 20201027ubuntu0.16.04.1 [155 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 krb5-locales all 1.13.2+dfsg-5ubuntu2.1 [13.6 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libroken18-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [41.4 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libasn1-8-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [174 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5support0 amd64 1.13.2+dfsg-5ubuntu2.1 [31.2 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libk5crypto3 amd64 1.13.2+dfsg-5ubuntu2.1 [81.3 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial/main amd64 libkeyutils1 amd64 1.5.9-8ubuntu1 [9904 B]
Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5-3 amd64 1.13.2+dfsg-5ubuntu2.1 [273 kB]
Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgssapi-krb5-2 amd64 1.13.2+dfsg-5ubuntu2.1 [120 kB]
Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhcrypto4-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [85.0 kB]
Get:22 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libheimbase1-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [29.3 kB]
Get:23 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libwind0-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [47.8 kB]
Get:24 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhx509-5-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [107 kB]
Get:25 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5-26-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [202 kB]
Get:26 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libheimntlm0-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [15.1 kB]
Get:27 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgssapi3-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [96.1 kB]
Get:28 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-modules-db amd64 2.1.26.dfsg1-14ubuntu0.2 [14.5 kB]
Get:29 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-2 amd64 2.1.26.dfsg1-14ubuntu0.2 [48.7 kB]
Get:30 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libldap-2.4-2 amd64 2.4.42+dfsg-2ubuntu3.9 [159 kB]
Get:31 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 librtmp1 amd64 2.4+20151223.gitfa8646d-1ubuntu0.1 [54.4 kB]
Get:32 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libcurl3-gnutls amd64 7.47.0-1ubuntu2.16 [184 kB]
Get:33 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-modules amd64 2.1.26.dfsg1-14ubuntu0.2 [47.7 kB]
Get:34 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 curl amd64 7.47.0-1ubuntu2.16 [139 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 5332 kB in 1s (4437 kB/s)
Selecting previously unselected package libffi6:amd64.
(Reading database ... 4780 files and directories currently installed.)
Preparing to unpack .../libffi6_3.2.1-4_amd64.deb ...
Unpacking libffi6:amd64 (3.2.1-4) ...
Selecting previously unselected package libgmp10:amd64.
Preparing to unpack .../libgmp10_2%3a6.1.0+dfsg-2_amd64.deb ...
Unpacking libgmp10:amd64 (2:6.1.0+dfsg-2) ...
Selecting previously unselected package libnettle6:amd64.
Preparing to unpack .../libnettle6_3.2-1ubuntu0.16.04.1_amd64.deb ...
Unpacking libnettle6:amd64 (3.2-1ubuntu0.16.04.1) ...
Selecting previously unselected package libhogweed4:amd64.
Preparing to unpack .../libhogweed4_3.2-1ubuntu0.16.04.1_amd64.deb ...
Unpacking libhogweed4:amd64 (3.2-1ubuntu0.16.04.1) ...
Selecting previously unselected package libidn11:amd64.
Preparing to unpack .../libidn11_1.32-3ubuntu1.2_amd64.deb ...
Unpacking libidn11:amd64 (1.32-3ubuntu1.2) ...
Selecting previously unselected package libp11-kit0:amd64.
Preparing to unpack .../libp11-kit0_0.23.2-5~ubuntu16.04.1_amd64.deb ...
Unpacking libp11-kit0:amd64 (0.23.2-5~ubuntu16.04.1) ...
Selecting previously unselected package libtasn1-6:amd64.
Preparing to unpack .../libtasn1-6_4.7-3ubuntu0.16.04.3_amd64.deb ...
Unpacking libtasn1-6:amd64 (4.7-3ubuntu0.16.04.3) ...
Selecting previously unselected package libgnutls30:amd64.
Preparing to unpack .../libgnutls30_3.4.10-4ubuntu1.8_amd64.deb ...
Unpacking libgnutls30:amd64 (3.4.10-4ubuntu1.8) ...
Selecting previously unselected package libsqlite3-0:amd64.
Preparing to unpack .../libsqlite3-0_3.11.0-1ubuntu1.5_amd64.deb ...
Unpacking libsqlite3-0:amd64 (3.11.0-1ubuntu1.5) ...
Selecting previously unselected package libssl1.0.0:amd64.
Preparing to unpack .../libssl1.0.0_1.0.2g-1ubuntu4.17_amd64.deb ...
Unpacking libssl1.0.0:amd64 (1.0.2g-1ubuntu4.17) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.2g-1ubuntu4.17_amd64.deb ...
Unpacking openssl (1.0.2g-1ubuntu4.17) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20201027ubuntu0.16.04.1_all.deb ...
Unpacking ca-certificates (20201027ubuntu0.16.04.1) ...
Selecting previously unselected package krb5-locales.
Preparing to unpack .../krb5-locales_1.13.2+dfsg-5ubuntu2.1_all.deb ...
Unpacking krb5-locales (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libroken18-heimdal:amd64.
Preparing to unpack .../libroken18-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libroken18-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libasn1-8-heimdal:amd64.
Preparing to unpack .../libasn1-8-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libasn1-8-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libkrb5support0:amd64.
Preparing to unpack .../libkrb5support0_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libkrb5support0:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libk5crypto3:amd64.
Preparing to unpack .../libk5crypto3_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libk5crypto3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libkeyutils1:amd64.
Preparing to unpack .../libkeyutils1_1.5.9-8ubuntu1_amd64.deb ...
Unpacking libkeyutils1:amd64 (1.5.9-8ubuntu1) ...
Selecting previously unselected package libkrb5-3:amd64.
Preparing to unpack .../libkrb5-3_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libkrb5-3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libgssapi-krb5-2:amd64.
Preparing to unpack .../libgssapi-krb5-2_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libgssapi-krb5-2:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libhcrypto4-heimdal:amd64.
Preparing to unpack .../libhcrypto4-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libhcrypto4-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libheimbase1-heimdal:amd64.
Preparing to unpack .../libheimbase1-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libheimbase1-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libwind0-heimdal:amd64.
Preparing to unpack .../libwind0-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libwind0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libhx509-5-heimdal:amd64.
Preparing to unpack .../libhx509-5-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libhx509-5-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libkrb5-26-heimdal:amd64.
Preparing to unpack .../libkrb5-26-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libkrb5-26-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libheimntlm0-heimdal:amd64.
Preparing to unpack .../libheimntlm0-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libheimntlm0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libgssapi3-heimdal:amd64.
Preparing to unpack .../libgssapi3-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libgssapi3-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libsasl2-modules-db:amd64.
Preparing to unpack .../libsasl2-modules-db_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-modules-db:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package libsasl2-2:amd64.
Preparing to unpack .../libsasl2-2_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-2:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package libldap-2.4-2:amd64.
Preparing to unpack .../libldap-2.4-2_2.4.42+dfsg-2ubuntu3.9_amd64.deb ...
Unpacking libldap-2.4-2:amd64 (2.4.42+dfsg-2ubuntu3.9) ...
Selecting previously unselected package librtmp1:amd64.
Preparing to unpack .../librtmp1_2.4+20151223.gitfa8646d-1ubuntu0.1_amd64.deb ...
Unpacking librtmp1:amd64 (2.4+20151223.gitfa8646d-1ubuntu0.1) ...
Selecting previously unselected package libcurl3-gnutls:amd64.
Preparing to unpack .../libcurl3-gnutls_7.47.0-1ubuntu2.16_amd64.deb ...
Unpacking libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.16) ...
Selecting previously unselected package libsasl2-modules:amd64.
Preparing to unpack .../libsasl2-modules_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-modules:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package curl.
Preparing to unpack .../curl_7.47.0-1ubuntu2.16_amd64.deb ...
Unpacking curl (7.47.0-1ubuntu2.16) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Setting up libffi6:amd64 (3.2.1-4) ...
Setting up libgmp10:amd64 (2:6.1.0+dfsg-2) ...
Setting up libnettle6:amd64 (3.2-1ubuntu0.16.04.1) ...
Setting up libhogweed4:amd64 (3.2-1ubuntu0.16.04.1) ...
Setting up libidn11:amd64 (1.32-3ubuntu1.2) ...
Setting up libp11-kit0:amd64 (0.23.2-5~ubuntu16.04.1) ...
Setting up libtasn1-6:amd64 (4.7-3ubuntu0.16.04.3) ...
Setting up libgnutls30:amd64 (3.4.10-4ubuntu1.8) ...
Setting up libsqlite3-0:amd64 (3.11.0-1ubuntu1.5) ...
Setting up libssl1.0.0:amd64 (1.0.2g-1ubuntu4.17) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up openssl (1.0.2g-1ubuntu4.17) ...
Setting up ca-certificates (20201027ubuntu0.16.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up krb5-locales (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libroken18-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libasn1-8-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libkrb5support0:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libk5crypto3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libkeyutils1:amd64 (1.5.9-8ubuntu1) ...
Setting up libkrb5-3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libgssapi-krb5-2:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libhcrypto4-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libheimbase1-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libwind0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libhx509-5-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libkrb5-26-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libheimntlm0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libgssapi3-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libsasl2-modules-db:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up libsasl2-2:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up libldap-2.4-2:amd64 (2.4.42+dfsg-2ubuntu3.9) ...
Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d-1ubuntu0.1) ...
Setting up libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.16) ...
Setting up libsasl2-modules:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up curl (7.47.0-1ubuntu2.16) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for ca-certificates (20201027ubuntu0.16.04.1) ...
Updating certificates in /etc/ssl/certs...
138 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  git-man ifupdown iproute2 isc-dhcp-client isc-dhcp-common less libatm1
  libbsd0 libdns-export162 libedit2 liberror-perl libexpat1 libgdbm3
  libisc-export160 libmnl0 libperl5.22 libpopt0 libx11-6 libx11-data libxau6
  libxcb1 libxdmcp6 libxext6 libxmuu1 libxtables11 netbase openssh-client
  patch perl perl-base perl-modules-5.22 rename rsync xauth
Suggested packages:
  gettext-base git-daemon-run | git-daemon-sysvinit git-doc git-el git-email
  git-gui gitk gitweb git-arch git-cvs git-mediawiki git-svn ppp rdnssd
  iproute2-doc resolvconf avahi-autoipd isc-dhcp-client-ddns apparmor
  ssh-askpass libpam-ssh keychain monkeysphere ed diffutils-doc perl-doc
  libterm-readline-gnu-perl | libterm-readline-perl-perl make openssh-server
The following NEW packages will be installed:
  git git-man ifupdown iproute2 isc-dhcp-client isc-dhcp-common less libatm1
  libbsd0 libdns-export162 libedit2 liberror-perl libexpat1 libgdbm3
  libisc-export160 libmnl0 libperl5.22 libpopt0 libx11-6 libx11-data libxau6
  libxcb1 libxdmcp6 libxext6 libxmuu1 libxtables11 netbase openssh-client
  patch perl perl-modules-5.22 rename rsync xauth
The following packages will be upgraded:
  perl-base
1 upgraded, 34 newly installed, 0 to remove and 0 not upgraded.
Need to get 15.4 MB of archives.
After this operation, 79.7 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl-base amd64 5.22.1-9ubuntu0.9 [1287 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libatm1 amd64 1:2.5.1-1.5 [24.2 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial/main amd64 libmnl0 amd64 1.0.3-5 [12.0 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial/main amd64 libpopt0 amd64 1.16-10 [26.0 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgdbm3 amd64 1.8.3-13.1 [16.9 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxau6 amd64 1:1.0.8-1 [8376 B]
Get:7 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxdmcp6 amd64 1:1.1.2-1.1 [11.0 kB]
Get:8 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxcb1 amd64 1.11.1-1ubuntu1 [40.0 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libx11-data all 2:1.6.3-1ubuntu2.2 [114 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libx11-6 amd64 2:1.6.3-1ubuntu2.2 [572 kB]
Get:11 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxext6 amd64 2:1.3.3-1 [29.4 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl-modules-5.22 all 5.22.1-9ubuntu0.9 [2634 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libperl5.22 amd64 5.22.1-9ubuntu0.9 [3360 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl amd64 5.22.1-9ubuntu0.9 [237 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 iproute2 amd64 4.3.0-1ubuntu3.16.04.5 [523 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 ifupdown amd64 0.8.10ubuntu1.4 [54.9 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libisc-export160 amd64 1:9.10.3.dfsg.P4-8ubuntu1.17 [153 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libdns-export162 amd64 1:9.10.3.dfsg.P4-8ubuntu1.17 [667 kB]
Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 isc-dhcp-client amd64 4.3.3-5ubuntu12.10 [224 kB]
Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 isc-dhcp-common amd64 4.3.3-5ubuntu12.10 [105 kB]
Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 less amd64 481-2.1ubuntu0.2 [110 kB]
Get:22 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libbsd0 amd64 0.8.2-1ubuntu0.1 [42.0 kB]
Get:23 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libexpat1 amd64 2.1.0-7ubuntu0.16.04.5 [71.5 kB]
Get:24 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxtables11 amd64 1.6.0-2ubuntu3 [27.2 kB]
Get:25 http://archive.ubuntu.com/ubuntu xenial/main amd64 netbase all 5.3 [12.9 kB]
Get:26 http://archive.ubuntu.com/ubuntu xenial/main amd64 libedit2 amd64 3.1-20150325-1ubuntu2 [76.5 kB]
Get:27 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxmuu1 amd64 2:1.1.2-2 [9674 B]
Get:28 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 openssh-client amd64 1:7.2p2-4ubuntu2.10 [590 kB]
Get:29 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 rsync amd64 3.1.1-3ubuntu1.3 [329 kB]
Get:30 http://archive.ubuntu.com/ubuntu xenial/main amd64 xauth amd64 1:1.0.9-1ubuntu2 [22.7 kB]
Get:31 http://archive.ubuntu.com/ubuntu xenial/main amd64 liberror-perl all 0.17-1.2 [19.6 kB]
Get:32 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 git-man all 1:2.7.4-0ubuntu1.9 [736 kB]
Get:33 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 git amd64 1:2.7.4-0ubuntu1.9 [3176 kB]
Get:34 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 patch amd64 2.7.5-1ubuntu0.16.04.2 [90.8 kB]
Get:35 http://archive.ubuntu.com/ubuntu xenial/main amd64 rename all 0.20-4 [12.0 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 15.4 MB in 2s (5634 kB/s)
(Reading database ... 5287 files and directories currently installed.)
Preparing to unpack .../perl-base_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking perl-base (5.22.1-9ubuntu0.9) over (5.22.1-9ubuntu0.6) ...
Setting up perl-base (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package libatm1:amd64.
(Reading database ... 5287 files and directories currently installed.)
Preparing to unpack .../libatm1_1%3a2.5.1-1.5_amd64.deb ...
Unpacking libatm1:amd64 (1:2.5.1-1.5) ...
Selecting previously unselected package libmnl0:amd64.
Preparing to unpack .../libmnl0_1.0.3-5_amd64.deb ...
Unpacking libmnl0:amd64 (1.0.3-5) ...
Selecting previously unselected package libpopt0:amd64.
Preparing to unpack .../libpopt0_1.16-10_amd64.deb ...
Unpacking libpopt0:amd64 (1.16-10) ...
Selecting previously unselected package libgdbm3:amd64.
Preparing to unpack .../libgdbm3_1.8.3-13.1_amd64.deb ...
Unpacking libgdbm3:amd64 (1.8.3-13.1) ...
Selecting previously unselected package libxau6:amd64.
Preparing to unpack .../libxau6_1%3a1.0.8-1_amd64.deb ...
Unpacking libxau6:amd64 (1:1.0.8-1) ...
Selecting previously unselected package libxdmcp6:amd64.
Preparing to unpack .../libxdmcp6_1%3a1.1.2-1.1_amd64.deb ...
Unpacking libxdmcp6:amd64 (1:1.1.2-1.1) ...
Selecting previously unselected package libxcb1:amd64.
Preparing to unpack .../libxcb1_1.11.1-1ubuntu1_amd64.deb ...
Unpacking libxcb1:amd64 (1.11.1-1ubuntu1) ...
Selecting previously unselected package libx11-data.
Preparing to unpack .../libx11-data_2%3a1.6.3-1ubuntu2.2_all.deb ...
Unpacking libx11-data (2:1.6.3-1ubuntu2.2) ...
Selecting previously unselected package libx11-6:amd64.
Preparing to unpack .../libx11-6_2%3a1.6.3-1ubuntu2.2_amd64.deb ...
Unpacking libx11-6:amd64 (2:1.6.3-1ubuntu2.2) ...
Selecting previously unselected package libxext6:amd64.
Preparing to unpack .../libxext6_2%3a1.3.3-1_amd64.deb ...
Unpacking libxext6:amd64 (2:1.3.3-1) ...
Selecting previously unselected package perl-modules-5.22.
Preparing to unpack .../perl-modules-5.22_5.22.1-9ubuntu0.9_all.deb ...
Unpacking perl-modules-5.22 (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package libperl5.22:amd64.
Preparing to unpack .../libperl5.22_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking libperl5.22:amd64 (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package perl.
Preparing to unpack .../perl_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking perl (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package iproute2.
Preparing to unpack .../iproute2_4.3.0-1ubuntu3.16.04.5_amd64.deb ...
Unpacking iproute2 (4.3.0-1ubuntu3.16.04.5) ...
Selecting previously unselected package ifupdown.
Preparing to unpack .../ifupdown_0.8.10ubuntu1.4_amd64.deb ...
Unpacking ifupdown (0.8.10ubuntu1.4) ...
Selecting previously unselected package libisc-export160.
Preparing to unpack .../libisc-export160_1%3a9.10.3.dfsg.P4-8ubuntu1.17_amd64.deb ...
Unpacking libisc-export160 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Selecting previously unselected package libdns-export162.
Preparing to unpack .../libdns-export162_1%3a9.10.3.dfsg.P4-8ubuntu1.17_amd64.deb ...
Unpacking libdns-export162 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Selecting previously unselected package isc-dhcp-client.
Preparing to unpack .../isc-dhcp-client_4.3.3-5ubuntu12.10_amd64.deb ...
Unpacking isc-dhcp-client (4.3.3-5ubuntu12.10) ...
Selecting previously unselected package isc-dhcp-common.
Preparing to unpack .../isc-dhcp-common_4.3.3-5ubuntu12.10_amd64.deb ...
Unpacking isc-dhcp-common (4.3.3-5ubuntu12.10) ...
Selecting previously unselected package less.
Preparing to unpack .../less_481-2.1ubuntu0.2_amd64.deb ...
Unpacking less (481-2.1ubuntu0.2) ...
Selecting previously unselected package libbsd0:amd64.
Preparing to unpack .../libbsd0_0.8.2-1ubuntu0.1_amd64.deb ...
Unpacking libbsd0:amd64 (0.8.2-1ubuntu0.1) ...
Selecting previously unselected package libexpat1:amd64.
Preparing to unpack .../libexpat1_2.1.0-7ubuntu0.16.04.5_amd64.deb ...
Unpacking libexpat1:amd64 (2.1.0-7ubuntu0.16.04.5) ...
Selecting previously unselected package libxtables11:amd64.
Preparing to unpack .../libxtables11_1.6.0-2ubuntu3_amd64.deb ...
Unpacking libxtables11:amd64 (1.6.0-2ubuntu3) ...
Selecting previously unselected package netbase.
Preparing to unpack .../archives/netbase_5.3_all.deb ...
Unpacking netbase (5.3) ...
Selecting previously unselected package libedit2:amd64.
Preparing to unpack .../libedit2_3.1-20150325-1ubuntu2_amd64.deb ...
Unpacking libedit2:amd64 (3.1-20150325-1ubuntu2) ...
Selecting previously unselected package libxmuu1:amd64.
Preparing to unpack .../libxmuu1_2%3a1.1.2-2_amd64.deb ...
Unpacking libxmuu1:amd64 (2:1.1.2-2) ...
Selecting previously unselected package openssh-client.
Preparing to unpack .../openssh-client_1%3a7.2p2-4ubuntu2.10_amd64.deb ...
Unpacking openssh-client (1:7.2p2-4ubuntu2.10) ...
Selecting previously unselected package rsync.
Preparing to unpack .../rsync_3.1.1-3ubuntu1.3_amd64.deb ...
Unpacking rsync (3.1.1-3ubuntu1.3) ...
Selecting previously unselected package xauth.
Preparing to unpack .../xauth_1%3a1.0.9-1ubuntu2_amd64.deb ...
Unpacking xauth (1:1.0.9-1ubuntu2) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../liberror-perl_0.17-1.2_all.deb ...
Unpacking liberror-perl (0.17-1.2) ...
Selecting previously unselected package git-man.
Preparing to unpack .../git-man_1%3a2.7.4-0ubuntu1.9_all.deb ...
Unpacking git-man (1:2.7.4-0ubuntu1.9) ...
Selecting previously unselected package git.
Preparing to unpack .../git_1%3a2.7.4-0ubuntu1.9_amd64.deb ...
Unpacking git (1:2.7.4-0ubuntu1.9) ...
Selecting previously unselected package patch.
Preparing to unpack .../patch_2.7.5-1ubuntu0.16.04.2_amd64.deb ...
Unpacking patch (2.7.5-1ubuntu0.16.04.2) ...
Selecting previously unselected package rename.
Preparing to unpack .../archives/rename_0.20-4_all.deb ...
Unpacking rename (0.20-4) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for systemd (229-4ubuntu21.29) ...
Setting up libatm1:amd64 (1:2.5.1-1.5) ...
Setting up libmnl0:amd64 (1.0.3-5) ...
Setting up libpopt0:amd64 (1.16-10) ...
Setting up libgdbm3:amd64 (1.8.3-13.1) ...
Setting up libxau6:amd64 (1:1.0.8-1) ...
Setting up libxdmcp6:amd64 (1:1.1.2-1.1) ...
Setting up libxcb1:amd64 (1.11.1-1ubuntu1) ...
Setting up libx11-data (2:1.6.3-1ubuntu2.2) ...
Setting up libx11-6:amd64 (2:1.6.3-1ubuntu2.2) ...
Setting up libxext6:amd64 (2:1.3.3-1) ...
Setting up perl-modules-5.22 (5.22.1-9ubuntu0.9) ...
Setting up libperl5.22:amd64 (5.22.1-9ubuntu0.9) ...
Setting up perl (5.22.1-9ubuntu0.9) ...
update-alternatives: using /usr/bin/prename to provide /usr/bin/rename (rename) in auto mode
Setting up iproute2 (4.3.0-1ubuntu3.16.04.5) ...
Setting up ifupdown (0.8.10ubuntu1.4) ...
Creating /etc/network/interfaces.
Setting up libisc-export160 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Setting up libdns-export162 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Setting up isc-dhcp-client (4.3.3-5ubuntu12.10) ...
Setting up isc-dhcp-common (4.3.3-5ubuntu12.10) ...
Setting up less (481-2.1ubuntu0.2) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
Setting up libbsd0:amd64 (0.8.2-1ubuntu0.1) ...
Setting up libexpat1:amd64 (2.1.0-7ubuntu0.16.04.5) ...
Setting up libxtables11:amd64 (1.6.0-2ubuntu3) ...
Setting up netbase (5.3) ...
Setting up libedit2:amd64 (3.1-20150325-1ubuntu2) ...
Setting up libxmuu1:amd64 (2:1.1.2-2) ...
Setting up openssh-client (1:7.2p2-4ubuntu2.10) ...
Setting up rsync (3.1.1-3ubuntu1.3) ...
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of restart.
Setting up xauth (1:1.0.9-1ubuntu2) ...
Setting up liberror-perl (0.17-1.2) ...
Setting up git-man (1:2.7.4-0ubuntu1.9) ...
Setting up git (1:2.7.4-0ubuntu1.9) ...
Setting up patch (2.7.5-1ubuntu0.16.04.2) ...
Setting up rename (0.20-4) ...
update-alternatives: using /usr/bin/file-rename to provide /usr/bin/rename (rename) in auto mode
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for systemd (229-4ubuntu21.29) ...
Removing intermediate container 457370cc573f
 ---> 53e98c282e1a
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Running in 56f72a972e9b

## Installing the NodeSource Node.js 10.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu xenial-backports InRelease
Reading package lists...

## Installing packages required for setup: apt-transport-https lsb-release...

+ apt-get install -y apt-transport-https lsb-release > /dev/null 2>&1

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_10.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js 10.x repo...

+ echo 'deb https://deb.nodesource.com/node_10.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_10.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu xenial-backports InRelease
Get:5 https://deb.nodesource.com/node_10.x xenial InRelease [4584 B]
Get:6 https://deb.nodesource.com/node_10.x xenial/main amd64 Packages [769 B]
Fetched 5353 B in 1s (2886 B/s)
Reading package lists...

## Run `sudo apt-get install -y nodejs` to install Node.js 10.x and npm
## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make
## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn


Removing intermediate container 56f72a972e9b
 ---> ed624598a076
Step 5/10 : RUN apt install -y nodejs
 ---> Running in cf510bd256db

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python
  python-minimal python2.7 python2.7-minimal
Suggested packages:
  python-doc python-tk python2.7-doc binutils binfmt-support
The following NEW packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib nodejs python
  python-minimal python2.7 python2.7-minimal
0 upgraded, 8 newly installed, 0 to remove and 0 not upgraded.
Need to get 20.1 MB of archives.
After this operation, 97.9 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-minimal amd64 2.7.12-1ubuntu0~16.04.13 [337 kB]
Get:2 https://deb.nodesource.com/node_10.x xenial/main amd64 nodejs amd64 10.23.0-1nodesource1 [16.2 MB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7-minimal amd64 2.7.12-1ubuntu0~16.04.13 [1259 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-minimal amd64 2.7.12-1~16.04 [28.1 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-stdlib amd64 2.7.12-1ubuntu0~16.04.13 [1886 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7 amd64 2.7.12-1ubuntu0~16.04.13 [224 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython-stdlib amd64 2.7.12-1~16.04 [7768 B]
Get:8 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python amd64 2.7.12-1~16.04 [137 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 20.1 MB in 3s (5751 kB/s)
Selecting previously unselected package libpython2.7-minimal:amd64.
(Reading database ... 9547 files and directories currently installed.)
Preparing to unpack .../libpython2.7-minimal_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python2.7-minimal.
Preparing to unpack .../python2.7-minimal_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking python2.7-minimal (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python-minimal.
Preparing to unpack .../python-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking python-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../libpython2.7-stdlib_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../python2.7_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking python2.7 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../libpython-stdlib_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.12-1~16.04) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Setting up python2.7-minimal (2.7.12-1ubuntu0~16.04.13) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package python.
(Reading database ... 10294 files and directories currently installed.)
Preparing to unpack .../python_2.7.12-1~16.04_amd64.deb ...
Unpacking python (2.7.12-1~16.04) ...
Selecting previously unselected package nodejs.
Preparing to unpack .../nodejs_10.23.0-1nodesource1_amd64.deb ...
Unpacking nodejs (10.23.0-1nodesource1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Setting up python2.7 (2.7.12-1ubuntu0~16.04.13) ...
Setting up libpython-stdlib:amd64 (2.7.12-1~16.04) ...
Setting up python (2.7.12-1~16.04) ...
Setting up nodejs (10.23.0-1nodesource1) ...
Removing intermediate container cf510bd256db
 ---> 0dbf15c52925
Step 6/10 : RUN git clone https://github.com/docker-hy/backend-example-docker
 ---> Running in 5b932639f0dd
Cloning into 'backend-example-docker'...
Removing intermediate container 5b932639f0dd
 ---> 6bd959f5dd71
Step 7/10 : WORKDIR /backend-example-docker
 ---> Running in ed0a31aaf3d0
Removing intermediate container ed0a31aaf3d0
 ---> ce8aa258f9c7
Step 8/10 : RUN npm install
 ---> Running in cf124ce15638

> nodemon@2.0.4 postinstall /backend-example-docker/node_modules/nodemon
> node bin/postinstall || exit 0

Love nodemon? You can now support the project via the open collective:
 > https://opencollective.com/nodemon/donate

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.3 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 210 packages from 176 contributors and audited 211 packages in 6.15s

10 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

Removing intermediate container cf124ce15638
 ---> 4a05ba9164ed
Step 9/10 : EXPOSE 8000
 ---> Running in 03e0225e3236
Removing intermediate container 03e0225e3236
 ---> b3cc459bc2e5
Step 10/10 : CMD npm start
 ---> Running in 35884a12adab
Removing intermediate container 35884a12adab
 ---> 23127e55fb86

Successfully built 23127e55fb86
Successfully tagged ex_5_backend:latest
Building frontend
Step 1/10 : FROM ubuntu:16.04
 ---> dfeff22e96ae
Step 2/10 : ENV API_URL="http://localhost:8000"
 ---> Running in 74b38081c062
Removing intermediate container 74b38081c062
 ---> 106543d0a3bb
Step 3/10 : RUN apt-get update &&     apt-get install -y curl &&     apt-get install -y git
 ---> Running in bd60c8b329b1
Get:1 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-backports InRelease [107 kB]
Get:5 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [1841 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages [1558 kB]
Get:7 http://security.ubuntu.com/ubuntu xenial-security/restricted amd64 Packages [15.9 kB]
Get:8 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [968 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial/restricted amd64 Packages [14.1 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages [9827 kB]
Get:11 http://security.ubuntu.com/ubuntu xenial-security/multiverse amd64 Packages [9249 B]
Get:12 http://archive.ubuntu.com/ubuntu xenial/multiverse amd64 Packages [176 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages [2353 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/restricted amd64 Packages [16.4 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 Packages [1512 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/multiverse amd64 Packages [26.7 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-backports/main amd64 Packages [10.9 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial-backports/universe amd64 Packages [12.6 kB]
Fetched 18.9 MB in 4s (4265 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  ca-certificates krb5-locales libasn1-8-heimdal libcurl3-gnutls libffi6
  libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal
  libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal
  libidn11 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3
  libkrb5support0 libldap-2.4-2 libnettle6 libp11-kit0 libroken18-heimdal
  librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0
  libssl1.0.0 libtasn1-6 libwind0-heimdal openssl
Suggested packages:
  gnutls-bin krb5-doc krb5-user libsasl2-modules-otp libsasl2-modules-ldap
  libsasl2-modules-sql libsasl2-modules-gssapi-mit
  | libsasl2-modules-gssapi-heimdal
The following NEW packages will be installed:
  ca-certificates curl krb5-locales libasn1-8-heimdal libcurl3-gnutls libffi6
  libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal
  libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal
  libidn11 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3
  libkrb5support0 libldap-2.4-2 libnettle6 libp11-kit0 libroken18-heimdal
  librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0
  libssl1.0.0 libtasn1-6 libwind0-heimdal openssl
0 upgraded, 34 newly installed, 0 to remove and 1 not upgraded.
Need to get 5332 kB of archives.
After this operation, 19.0 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libffi6 amd64 3.2.1-4 [17.8 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgmp10 amd64 2:6.1.0+dfsg-2 [240 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libnettle6 amd64 3.2-1ubuntu0.16.04.1 [93.5 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhogweed4 amd64 3.2-1ubuntu0.16.04.1 [136 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libidn11 amd64 1.32-3ubuntu1.2 [46.5 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libp11-kit0 amd64 0.23.2-5~ubuntu16.04.1 [105 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libtasn1-6 amd64 4.7-3ubuntu0.16.04.3 [43.5 kB]
Get:8 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgnutls30 amd64 3.4.10-4ubuntu1.8 [548 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsqlite3-0 amd64 3.11.0-1ubuntu1.5 [398 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libssl1.0.0 amd64 1.0.2g-1ubuntu4.17 [1082 kB]
Get:11 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 openssl amd64 1.0.2g-1ubuntu4.17 [492 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 ca-certificates all 20201027ubuntu0.16.04.1 [155 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 krb5-locales all 1.13.2+dfsg-5ubuntu2.1 [13.6 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libroken18-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [41.4 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libasn1-8-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [174 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5support0 amd64 1.13.2+dfsg-5ubuntu2.1 [31.2 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libk5crypto3 amd64 1.13.2+dfsg-5ubuntu2.1 [81.3 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial/main amd64 libkeyutils1 amd64 1.5.9-8ubuntu1 [9904 B]
Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5-3 amd64 1.13.2+dfsg-5ubuntu2.1 [273 kB]
Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgssapi-krb5-2 amd64 1.13.2+dfsg-5ubuntu2.1 [120 kB]
Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhcrypto4-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [85.0 kB]
Get:22 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libheimbase1-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [29.3 kB]
Get:23 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libwind0-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [47.8 kB]
Get:24 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libhx509-5-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [107 kB]
Get:25 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libkrb5-26-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [202 kB]
Get:26 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libheimntlm0-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [15.1 kB]
Get:27 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libgssapi3-heimdal amd64 1.7~git20150920+dfsg-4ubuntu1.16.04.1 [96.1 kB]
Get:28 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-modules-db amd64 2.1.26.dfsg1-14ubuntu0.2 [14.5 kB]
Get:29 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-2 amd64 2.1.26.dfsg1-14ubuntu0.2 [48.7 kB]
Get:30 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libldap-2.4-2 amd64 2.4.42+dfsg-2ubuntu3.9 [159 kB]
Get:31 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 librtmp1 amd64 2.4+20151223.gitfa8646d-1ubuntu0.1 [54.4 kB]
Get:32 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libcurl3-gnutls amd64 7.47.0-1ubuntu2.16 [184 kB]
Get:33 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libsasl2-modules amd64 2.1.26.dfsg1-14ubuntu0.2 [47.7 kB]
Get:34 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 curl amd64 7.47.0-1ubuntu2.16 [139 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 5332 kB in 1s (4514 kB/s)
Selecting previously unselected package libffi6:amd64.
(Reading database ... 4780 files and directories currently installed.)
Preparing to unpack .../libffi6_3.2.1-4_amd64.deb ...
Unpacking libffi6:amd64 (3.2.1-4) ...
Selecting previously unselected package libgmp10:amd64.
Preparing to unpack .../libgmp10_2%3a6.1.0+dfsg-2_amd64.deb ...
Unpacking libgmp10:amd64 (2:6.1.0+dfsg-2) ...
Selecting previously unselected package libnettle6:amd64.
Preparing to unpack .../libnettle6_3.2-1ubuntu0.16.04.1_amd64.deb ...
Unpacking libnettle6:amd64 (3.2-1ubuntu0.16.04.1) ...
Selecting previously unselected package libhogweed4:amd64.
Preparing to unpack .../libhogweed4_3.2-1ubuntu0.16.04.1_amd64.deb ...
Unpacking libhogweed4:amd64 (3.2-1ubuntu0.16.04.1) ...
Selecting previously unselected package libidn11:amd64.
Preparing to unpack .../libidn11_1.32-3ubuntu1.2_amd64.deb ...
Unpacking libidn11:amd64 (1.32-3ubuntu1.2) ...
Selecting previously unselected package libp11-kit0:amd64.
Preparing to unpack .../libp11-kit0_0.23.2-5~ubuntu16.04.1_amd64.deb ...
Unpacking libp11-kit0:amd64 (0.23.2-5~ubuntu16.04.1) ...
Selecting previously unselected package libtasn1-6:amd64.
Preparing to unpack .../libtasn1-6_4.7-3ubuntu0.16.04.3_amd64.deb ...
Unpacking libtasn1-6:amd64 (4.7-3ubuntu0.16.04.3) ...
Selecting previously unselected package libgnutls30:amd64.
Preparing to unpack .../libgnutls30_3.4.10-4ubuntu1.8_amd64.deb ...
Unpacking libgnutls30:amd64 (3.4.10-4ubuntu1.8) ...
Selecting previously unselected package libsqlite3-0:amd64.
Preparing to unpack .../libsqlite3-0_3.11.0-1ubuntu1.5_amd64.deb ...
Unpacking libsqlite3-0:amd64 (3.11.0-1ubuntu1.5) ...
Selecting previously unselected package libssl1.0.0:amd64.
Preparing to unpack .../libssl1.0.0_1.0.2g-1ubuntu4.17_amd64.deb ...
Unpacking libssl1.0.0:amd64 (1.0.2g-1ubuntu4.17) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.2g-1ubuntu4.17_amd64.deb ...
Unpacking openssl (1.0.2g-1ubuntu4.17) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20201027ubuntu0.16.04.1_all.deb ...
Unpacking ca-certificates (20201027ubuntu0.16.04.1) ...
Selecting previously unselected package krb5-locales.
Preparing to unpack .../krb5-locales_1.13.2+dfsg-5ubuntu2.1_all.deb ...
Unpacking krb5-locales (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libroken18-heimdal:amd64.
Preparing to unpack .../libroken18-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libroken18-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libasn1-8-heimdal:amd64.
Preparing to unpack .../libasn1-8-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libasn1-8-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libkrb5support0:amd64.
Preparing to unpack .../libkrb5support0_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libkrb5support0:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libk5crypto3:amd64.
Preparing to unpack .../libk5crypto3_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libk5crypto3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libkeyutils1:amd64.
Preparing to unpack .../libkeyutils1_1.5.9-8ubuntu1_amd64.deb ...
Unpacking libkeyutils1:amd64 (1.5.9-8ubuntu1) ...
Selecting previously unselected package libkrb5-3:amd64.
Preparing to unpack .../libkrb5-3_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libkrb5-3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libgssapi-krb5-2:amd64.
Preparing to unpack .../libgssapi-krb5-2_1.13.2+dfsg-5ubuntu2.1_amd64.deb ...
Unpacking libgssapi-krb5-2:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Selecting previously unselected package libhcrypto4-heimdal:amd64.
Preparing to unpack .../libhcrypto4-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libhcrypto4-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libheimbase1-heimdal:amd64.
Preparing to unpack .../libheimbase1-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libheimbase1-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libwind0-heimdal:amd64.
Preparing to unpack .../libwind0-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libwind0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libhx509-5-heimdal:amd64.
Preparing to unpack .../libhx509-5-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libhx509-5-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libkrb5-26-heimdal:amd64.
Preparing to unpack .../libkrb5-26-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libkrb5-26-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libheimntlm0-heimdal:amd64.
Preparing to unpack .../libheimntlm0-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libheimntlm0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libgssapi3-heimdal:amd64.
Preparing to unpack .../libgssapi3-heimdal_1.7~git20150920+dfsg-4ubuntu1.16.04.1_amd64.deb ...
Unpacking libgssapi3-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Selecting previously unselected package libsasl2-modules-db:amd64.
Preparing to unpack .../libsasl2-modules-db_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-modules-db:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package libsasl2-2:amd64.
Preparing to unpack .../libsasl2-2_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-2:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package libldap-2.4-2:amd64.
Preparing to unpack .../libldap-2.4-2_2.4.42+dfsg-2ubuntu3.9_amd64.deb ...
Unpacking libldap-2.4-2:amd64 (2.4.42+dfsg-2ubuntu3.9) ...
Selecting previously unselected package librtmp1:amd64.
Preparing to unpack .../librtmp1_2.4+20151223.gitfa8646d-1ubuntu0.1_amd64.deb ...
Unpacking librtmp1:amd64 (2.4+20151223.gitfa8646d-1ubuntu0.1) ...
Selecting previously unselected package libcurl3-gnutls:amd64.
Preparing to unpack .../libcurl3-gnutls_7.47.0-1ubuntu2.16_amd64.deb ...
Unpacking libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.16) ...
Selecting previously unselected package libsasl2-modules:amd64.
Preparing to unpack .../libsasl2-modules_2.1.26.dfsg1-14ubuntu0.2_amd64.deb ...
Unpacking libsasl2-modules:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Selecting previously unselected package curl.
Preparing to unpack .../curl_7.47.0-1ubuntu2.16_amd64.deb ...
Unpacking curl (7.47.0-1ubuntu2.16) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Setting up libffi6:amd64 (3.2.1-4) ...
Setting up libgmp10:amd64 (2:6.1.0+dfsg-2) ...
Setting up libnettle6:amd64 (3.2-1ubuntu0.16.04.1) ...
Setting up libhogweed4:amd64 (3.2-1ubuntu0.16.04.1) ...
Setting up libidn11:amd64 (1.32-3ubuntu1.2) ...
Setting up libp11-kit0:amd64 (0.23.2-5~ubuntu16.04.1) ...
Setting up libtasn1-6:amd64 (4.7-3ubuntu0.16.04.3) ...
Setting up libgnutls30:amd64 (3.4.10-4ubuntu1.8) ...
Setting up libsqlite3-0:amd64 (3.11.0-1ubuntu1.5) ...
Setting up libssl1.0.0:amd64 (1.0.2g-1ubuntu4.17) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up openssl (1.0.2g-1ubuntu4.17) ...
Setting up ca-certificates (20201027ubuntu0.16.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up krb5-locales (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libroken18-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libasn1-8-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libkrb5support0:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libk5crypto3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libkeyutils1:amd64 (1.5.9-8ubuntu1) ...
Setting up libkrb5-3:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libgssapi-krb5-2:amd64 (1.13.2+dfsg-5ubuntu2.1) ...
Setting up libhcrypto4-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libheimbase1-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libwind0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libhx509-5-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libkrb5-26-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libheimntlm0-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libgssapi3-heimdal:amd64 (1.7~git20150920+dfsg-4ubuntu1.16.04.1) ...
Setting up libsasl2-modules-db:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up libsasl2-2:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up libldap-2.4-2:amd64 (2.4.42+dfsg-2ubuntu3.9) ...
Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d-1ubuntu0.1) ...
Setting up libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.16) ...
Setting up libsasl2-modules:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up curl (7.47.0-1ubuntu2.16) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for ca-certificates (20201027ubuntu0.16.04.1) ...
Updating certificates in /etc/ssl/certs...
138 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  git-man ifupdown iproute2 isc-dhcp-client isc-dhcp-common less libatm1
  libbsd0 libdns-export162 libedit2 liberror-perl libexpat1 libgdbm3
  libisc-export160 libmnl0 libperl5.22 libpopt0 libx11-6 libx11-data libxau6
  libxcb1 libxdmcp6 libxext6 libxmuu1 libxtables11 netbase openssh-client
  patch perl perl-base perl-modules-5.22 rename rsync xauth
Suggested packages:
  gettext-base git-daemon-run | git-daemon-sysvinit git-doc git-el git-email
  git-gui gitk gitweb git-arch git-cvs git-mediawiki git-svn ppp rdnssd
  iproute2-doc resolvconf avahi-autoipd isc-dhcp-client-ddns apparmor
  ssh-askpass libpam-ssh keychain monkeysphere ed diffutils-doc perl-doc
  libterm-readline-gnu-perl | libterm-readline-perl-perl make openssh-server
The following NEW packages will be installed:
  git git-man ifupdown iproute2 isc-dhcp-client isc-dhcp-common less libatm1
  libbsd0 libdns-export162 libedit2 liberror-perl libexpat1 libgdbm3
  libisc-export160 libmnl0 libperl5.22 libpopt0 libx11-6 libx11-data libxau6
  libxcb1 libxdmcp6 libxext6 libxmuu1 libxtables11 netbase openssh-client
  patch perl perl-modules-5.22 rename rsync xauth
The following packages will be upgraded:
  perl-base
1 upgraded, 34 newly installed, 0 to remove and 0 not upgraded.
Need to get 15.4 MB of archives.
After this operation, 79.7 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl-base amd64 5.22.1-9ubuntu0.9 [1287 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libatm1 amd64 1:2.5.1-1.5 [24.2 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial/main amd64 libmnl0 amd64 1.0.3-5 [12.0 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial/main amd64 libpopt0 amd64 1.16-10 [26.0 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgdbm3 amd64 1.8.3-13.1 [16.9 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxau6 amd64 1:1.0.8-1 [8376 B]
Get:7 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxdmcp6 amd64 1:1.1.2-1.1 [11.0 kB]
Get:8 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxcb1 amd64 1.11.1-1ubuntu1 [40.0 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libx11-data all 2:1.6.3-1ubuntu2.2 [114 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libx11-6 amd64 2:1.6.3-1ubuntu2.2 [572 kB]
Get:11 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxext6 amd64 2:1.3.3-1 [29.4 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl-modules-5.22 all 5.22.1-9ubuntu0.9 [2634 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libperl5.22 amd64 5.22.1-9ubuntu0.9 [3360 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 perl amd64 5.22.1-9ubuntu0.9 [237 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 iproute2 amd64 4.3.0-1ubuntu3.16.04.5 [523 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 ifupdown amd64 0.8.10ubuntu1.4 [54.9 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libisc-export160 amd64 1:9.10.3.dfsg.P4-8ubuntu1.17 [153 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libdns-export162 amd64 1:9.10.3.dfsg.P4-8ubuntu1.17 [667 kB]
Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 isc-dhcp-client amd64 4.3.3-5ubuntu12.10 [224 kB]
Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 isc-dhcp-common amd64 4.3.3-5ubuntu12.10 [105 kB]
Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 less amd64 481-2.1ubuntu0.2 [110 kB]
Get:22 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libbsd0 amd64 0.8.2-1ubuntu0.1 [42.0 kB]
Get:23 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libexpat1 amd64 2.1.0-7ubuntu0.16.04.5 [71.5 kB]
Get:24 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxtables11 amd64 1.6.0-2ubuntu3 [27.2 kB]
Get:25 http://archive.ubuntu.com/ubuntu xenial/main amd64 netbase all 5.3 [12.9 kB]
Get:26 http://archive.ubuntu.com/ubuntu xenial/main amd64 libedit2 amd64 3.1-20150325-1ubuntu2 [76.5 kB]
Get:27 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxmuu1 amd64 2:1.1.2-2 [9674 B]
Get:28 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 openssh-client amd64 1:7.2p2-4ubuntu2.10 [590 kB]
Get:29 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 rsync amd64 3.1.1-3ubuntu1.3 [329 kB]
Get:30 http://archive.ubuntu.com/ubuntu xenial/main amd64 xauth amd64 1:1.0.9-1ubuntu2 [22.7 kB]
Get:31 http://archive.ubuntu.com/ubuntu xenial/main amd64 liberror-perl all 0.17-1.2 [19.6 kB]
Get:32 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 git-man all 1:2.7.4-0ubuntu1.9 [736 kB]
Get:33 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 git amd64 1:2.7.4-0ubuntu1.9 [3176 kB]
Get:34 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 patch amd64 2.7.5-1ubuntu0.16.04.2 [90.8 kB]
Get:35 http://archive.ubuntu.com/ubuntu xenial/main amd64 rename all 0.20-4 [12.0 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 15.4 MB in 2s (5601 kB/s)
(Reading database ... 5287 files and directories currently installed.)
Preparing to unpack .../perl-base_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking perl-base (5.22.1-9ubuntu0.9) over (5.22.1-9ubuntu0.6) ...
Setting up perl-base (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package libatm1:amd64.
(Reading database ... 5287 files and directories currently installed.)
Preparing to unpack .../libatm1_1%3a2.5.1-1.5_amd64.deb ...
Unpacking libatm1:amd64 (1:2.5.1-1.5) ...
Selecting previously unselected package libmnl0:amd64.
Preparing to unpack .../libmnl0_1.0.3-5_amd64.deb ...
Unpacking libmnl0:amd64 (1.0.3-5) ...
Selecting previously unselected package libpopt0:amd64.
Preparing to unpack .../libpopt0_1.16-10_amd64.deb ...
Unpacking libpopt0:amd64 (1.16-10) ...
Selecting previously unselected package libgdbm3:amd64.
Preparing to unpack .../libgdbm3_1.8.3-13.1_amd64.deb ...
Unpacking libgdbm3:amd64 (1.8.3-13.1) ...
Selecting previously unselected package libxau6:amd64.
Preparing to unpack .../libxau6_1%3a1.0.8-1_amd64.deb ...
Unpacking libxau6:amd64 (1:1.0.8-1) ...
Selecting previously unselected package libxdmcp6:amd64.
Preparing to unpack .../libxdmcp6_1%3a1.1.2-1.1_amd64.deb ...
Unpacking libxdmcp6:amd64 (1:1.1.2-1.1) ...
Selecting previously unselected package libxcb1:amd64.
Preparing to unpack .../libxcb1_1.11.1-1ubuntu1_amd64.deb ...
Unpacking libxcb1:amd64 (1.11.1-1ubuntu1) ...
Selecting previously unselected package libx11-data.
Preparing to unpack .../libx11-data_2%3a1.6.3-1ubuntu2.2_all.deb ...
Unpacking libx11-data (2:1.6.3-1ubuntu2.2) ...
Selecting previously unselected package libx11-6:amd64.
Preparing to unpack .../libx11-6_2%3a1.6.3-1ubuntu2.2_amd64.deb ...
Unpacking libx11-6:amd64 (2:1.6.3-1ubuntu2.2) ...
Selecting previously unselected package libxext6:amd64.
Preparing to unpack .../libxext6_2%3a1.3.3-1_amd64.deb ...
Unpacking libxext6:amd64 (2:1.3.3-1) ...
Selecting previously unselected package perl-modules-5.22.
Preparing to unpack .../perl-modules-5.22_5.22.1-9ubuntu0.9_all.deb ...
Unpacking perl-modules-5.22 (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package libperl5.22:amd64.
Preparing to unpack .../libperl5.22_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking libperl5.22:amd64 (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package perl.
Preparing to unpack .../perl_5.22.1-9ubuntu0.9_amd64.deb ...
Unpacking perl (5.22.1-9ubuntu0.9) ...
Selecting previously unselected package iproute2.
Preparing to unpack .../iproute2_4.3.0-1ubuntu3.16.04.5_amd64.deb ...
Unpacking iproute2 (4.3.0-1ubuntu3.16.04.5) ...
Selecting previously unselected package ifupdown.
Preparing to unpack .../ifupdown_0.8.10ubuntu1.4_amd64.deb ...
Unpacking ifupdown (0.8.10ubuntu1.4) ...
Selecting previously unselected package libisc-export160.
Preparing to unpack .../libisc-export160_1%3a9.10.3.dfsg.P4-8ubuntu1.17_amd64.deb ...
Unpacking libisc-export160 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Selecting previously unselected package libdns-export162.
Preparing to unpack .../libdns-export162_1%3a9.10.3.dfsg.P4-8ubuntu1.17_amd64.deb ...
Unpacking libdns-export162 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Selecting previously unselected package isc-dhcp-client.
Preparing to unpack .../isc-dhcp-client_4.3.3-5ubuntu12.10_amd64.deb ...
Unpacking isc-dhcp-client (4.3.3-5ubuntu12.10) ...
Selecting previously unselected package isc-dhcp-common.
Preparing to unpack .../isc-dhcp-common_4.3.3-5ubuntu12.10_amd64.deb ...
Unpacking isc-dhcp-common (4.3.3-5ubuntu12.10) ...
Selecting previously unselected package less.
Preparing to unpack .../less_481-2.1ubuntu0.2_amd64.deb ...
Unpacking less (481-2.1ubuntu0.2) ...
Selecting previously unselected package libbsd0:amd64.
Preparing to unpack .../libbsd0_0.8.2-1ubuntu0.1_amd64.deb ...
Unpacking libbsd0:amd64 (0.8.2-1ubuntu0.1) ...
Selecting previously unselected package libexpat1:amd64.
Preparing to unpack .../libexpat1_2.1.0-7ubuntu0.16.04.5_amd64.deb ...
Unpacking libexpat1:amd64 (2.1.0-7ubuntu0.16.04.5) ...
Selecting previously unselected package libxtables11:amd64.
Preparing to unpack .../libxtables11_1.6.0-2ubuntu3_amd64.deb ...
Unpacking libxtables11:amd64 (1.6.0-2ubuntu3) ...
Selecting previously unselected package netbase.
Preparing to unpack .../archives/netbase_5.3_all.deb ...
Unpacking netbase (5.3) ...
Selecting previously unselected package libedit2:amd64.
Preparing to unpack .../libedit2_3.1-20150325-1ubuntu2_amd64.deb ...
Unpacking libedit2:amd64 (3.1-20150325-1ubuntu2) ...
Selecting previously unselected package libxmuu1:amd64.
Preparing to unpack .../libxmuu1_2%3a1.1.2-2_amd64.deb ...
Unpacking libxmuu1:amd64 (2:1.1.2-2) ...
Selecting previously unselected package openssh-client.
Preparing to unpack .../openssh-client_1%3a7.2p2-4ubuntu2.10_amd64.deb ...
Unpacking openssh-client (1:7.2p2-4ubuntu2.10) ...
Selecting previously unselected package rsync.
Preparing to unpack .../rsync_3.1.1-3ubuntu1.3_amd64.deb ...
Unpacking rsync (3.1.1-3ubuntu1.3) ...
Selecting previously unselected package xauth.
Preparing to unpack .../xauth_1%3a1.0.9-1ubuntu2_amd64.deb ...
Unpacking xauth (1:1.0.9-1ubuntu2) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../liberror-perl_0.17-1.2_all.deb ...
Unpacking liberror-perl (0.17-1.2) ...
Selecting previously unselected package git-man.
Preparing to unpack .../git-man_1%3a2.7.4-0ubuntu1.9_all.deb ...
Unpacking git-man (1:2.7.4-0ubuntu1.9) ...
Selecting previously unselected package git.
Preparing to unpack .../git_1%3a2.7.4-0ubuntu1.9_amd64.deb ...
Unpacking git (1:2.7.4-0ubuntu1.9) ...
Selecting previously unselected package patch.
Preparing to unpack .../patch_2.7.5-1ubuntu0.16.04.2_amd64.deb ...
Unpacking patch (2.7.5-1ubuntu0.16.04.2) ...
Selecting previously unselected package rename.
Preparing to unpack .../archives/rename_0.20-4_all.deb ...
Unpacking rename (0.20-4) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for systemd (229-4ubuntu21.29) ...
Setting up libatm1:amd64 (1:2.5.1-1.5) ...
Setting up libmnl0:amd64 (1.0.3-5) ...
Setting up libpopt0:amd64 (1.16-10) ...
Setting up libgdbm3:amd64 (1.8.3-13.1) ...
Setting up libxau6:amd64 (1:1.0.8-1) ...
Setting up libxdmcp6:amd64 (1:1.1.2-1.1) ...
Setting up libxcb1:amd64 (1.11.1-1ubuntu1) ...
Setting up libx11-data (2:1.6.3-1ubuntu2.2) ...
Setting up libx11-6:amd64 (2:1.6.3-1ubuntu2.2) ...
Setting up libxext6:amd64 (2:1.3.3-1) ...
Setting up perl-modules-5.22 (5.22.1-9ubuntu0.9) ...
Setting up libperl5.22:amd64 (5.22.1-9ubuntu0.9) ...
Setting up perl (5.22.1-9ubuntu0.9) ...
update-alternatives: using /usr/bin/prename to provide /usr/bin/rename (rename) in auto mode
Setting up iproute2 (4.3.0-1ubuntu3.16.04.5) ...
Setting up ifupdown (0.8.10ubuntu1.4) ...
Creating /etc/network/interfaces.
Setting up libisc-export160 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Setting up libdns-export162 (1:9.10.3.dfsg.P4-8ubuntu1.17) ...
Setting up isc-dhcp-client (4.3.3-5ubuntu12.10) ...
Setting up isc-dhcp-common (4.3.3-5ubuntu12.10) ...
Setting up less (481-2.1ubuntu0.2) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
Setting up libbsd0:amd64 (0.8.2-1ubuntu0.1) ...
Setting up libexpat1:amd64 (2.1.0-7ubuntu0.16.04.5) ...
Setting up libxtables11:amd64 (1.6.0-2ubuntu3) ...
Setting up netbase (5.3) ...
Setting up libedit2:amd64 (3.1-20150325-1ubuntu2) ...
Setting up libxmuu1:amd64 (2:1.1.2-2) ...
Setting up openssh-client (1:7.2p2-4ubuntu2.10) ...
Setting up rsync (3.1.1-3ubuntu1.3) ...
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of restart.
Setting up xauth (1:1.0.9-1ubuntu2) ...
Setting up liberror-perl (0.17-1.2) ...
Setting up git-man (1:2.7.4-0ubuntu1.9) ...
Setting up git (1:2.7.4-0ubuntu1.9) ...
Setting up patch (2.7.5-1ubuntu0.16.04.2) ...
Setting up rename (0.20-4) ...
update-alternatives: using /usr/bin/file-rename to provide /usr/bin/rename (rename) in auto mode
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for systemd (229-4ubuntu21.29) ...
Removing intermediate container bd60c8b329b1
 ---> 11dfcc580453
Step 4/10 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Running in d130599162d6

## Installing the NodeSource Node.js 10.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Hit:2 http://archive.ubuntu.com/ubuntu xenial-updates InRelease
Hit:3 http://archive.ubuntu.com/ubuntu xenial-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu xenial-security InRelease
Reading package lists...

## Installing packages required for setup: apt-transport-https lsb-release...

+ apt-get install -y apt-transport-https lsb-release > /dev/null 2>&1

## Confirming "xenial" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_10.x/dists/xenial/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js 10.x repo...

+ echo 'deb https://deb.nodesource.com/node_10.x xenial main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_10.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Hit:2 http://security.ubuntu.com/ubuntu xenial-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu xenial-backports InRelease
Get:5 https://deb.nodesource.com/node_10.x xenial InRelease [4584 B]
Get:6 https://deb.nodesource.com/node_10.x xenial/main amd64 Packages [769 B]
Fetched 5353 B in 0s (5856 B/s)
Reading package lists...

## Run `sudo apt-get install -y nodejs` to install Node.js 10.x and npm
## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make
## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn


Removing intermediate container d130599162d6
 ---> c73ef5ad8955
Step 5/10 : RUN apt install -y nodejs
 ---> Running in 758a6bcc3d73

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python
  python-minimal python2.7 python2.7-minimal
Suggested packages:
  python-doc python-tk python2.7-doc binutils binfmt-support
The following NEW packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib nodejs python
  python-minimal python2.7 python2.7-minimal
0 upgraded, 8 newly installed, 0 to remove and 0 not upgraded.
Need to get 20.1 MB of archives.
After this operation, 97.9 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-minimal amd64 2.7.12-1ubuntu0~16.04.13 [337 kB]
Get:2 https://deb.nodesource.com/node_10.x xenial/main amd64 nodejs amd64 10.23.0-1nodesource1 [16.2 MB]
Get:3 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7-minimal amd64 2.7.12-1ubuntu0~16.04.13 [1259 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-minimal amd64 2.7.12-1~16.04 [28.1 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-stdlib amd64 2.7.12-1ubuntu0~16.04.13 [1886 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7 amd64 2.7.12-1ubuntu0~16.04.13 [224 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython-stdlib amd64 2.7.12-1~16.04 [7768 B]
Get:8 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python amd64 2.7.12-1~16.04 [137 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 20.1 MB in 3s (5710 kB/s)
Selecting previously unselected package libpython2.7-minimal:amd64.
(Reading database ... 9547 files and directories currently installed.)
Preparing to unpack .../libpython2.7-minimal_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python2.7-minimal.
Preparing to unpack .../python2.7-minimal_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking python2.7-minimal (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python-minimal.
Preparing to unpack .../python-minimal_2.7.12-1~16.04_amd64.deb ...
Unpacking python-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../libpython2.7-stdlib_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../python2.7_2.7.12-1ubuntu0~16.04.13_amd64.deb ...
Unpacking python2.7 (2.7.12-1ubuntu0~16.04.13) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../libpython-stdlib_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.12-1~16.04) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Setting up python2.7-minimal (2.7.12-1ubuntu0~16.04.13) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.12-1~16.04) ...
Selecting previously unselected package python.
(Reading database ... 10294 files and directories currently installed.)
Preparing to unpack .../python_2.7.12-1~16.04_amd64.deb ...
Unpacking python (2.7.12-1~16.04) ...
Selecting previously unselected package nodejs.
Preparing to unpack .../nodejs_10.23.0-1nodesource1_amd64.deb ...
Unpacking nodejs (10.23.0-1nodesource1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.13) ...
Setting up python2.7 (2.7.12-1ubuntu0~16.04.13) ...
Setting up libpython-stdlib:amd64 (2.7.12-1~16.04) ...
Setting up python (2.7.12-1~16.04) ...
Setting up nodejs (10.23.0-1nodesource1) ...
Removing intermediate container 758a6bcc3d73
 ---> 98463046e1a7
Step 6/10 : RUN git clone https://github.com/docker-hy/frontend-example-docker
 ---> Running in 067a45ed9eea
Cloning into 'frontend-example-docker'...
Removing intermediate container 067a45ed9eea
 ---> 75533c17e41b
Step 7/10 : WORKDIR /frontend-example-docker
 ---> Running in e2ffc0e8f2fb
Removing intermediate container e2ffc0e8f2fb
 ---> 5c2c007bedad
Step 8/10 : RUN npm install
 ---> Running in 2f37eacdeba2

> core-js@2.6.11 postinstall /frontend-example-docker/node_modules/core-js
> node -e "try{require('./postinstall')}catch(e){}"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.12 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.12: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 1462 packages from 472 contributors and audited 1532 packages in 37.033s

28 packages are looking for funding
  run `npm fund` for details

found 271 vulnerabilities (263 low, 2 moderate, 6 high)
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container 2f37eacdeba2
 ---> 1fce318a3c01
Step 9/10 : EXPOSE 5000
 ---> Running in 05f6759e9d1f
Removing intermediate container 05f6759e9d1f
 ---> a1fe76be7783
Step 10/10 : CMD npm start
 ---> Running in f0c07c8da3c3
Removing intermediate container f0c07c8da3c3
 ---> 48bd62438b4f

Successfully built 48bd62438b4f
Successfully tagged ex_5_frontend:latest
~>/ex_5$ sudo docker-compose up
Recreating frontend ... done
Recreating backend  ... done
Starting redis      ... done
Attaching to redis, frontend, backend
redis       | 1:C 05 Nov 2020 09:34:28.906 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis       | 1:C 05 Nov 2020 09:34:28.906 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis       | 1:C 05 Nov 2020 09:34:28.906 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
redis       | 1:M 05 Nov 2020 09:34:28.910 * Running mode=standalone, port=6379.
redis       | 1:M 05 Nov 2020 09:34:28.910 # Server initialized
redis       | 1:M 05 Nov 2020 09:34:28.910 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis       | 1:M 05 Nov 2020 09:34:28.911 * Loading RDB produced by version 6.0.9
redis       | 1:M 05 Nov 2020 09:34:28.911 * RDB age 1255 seconds
redis       | 1:M 05 Nov 2020 09:34:28.911 * RDB memory usage when created 0.79 Mb
redis       | 1:M 05 Nov 2020 09:34:28.911 * DB loaded from disk: 0.000 seconds
redis       | 1:M 05 Nov 2020 09:34:28.911 * Ready to accept connections
frontend    | 
frontend    | > frontend-example-docker@1.0.0 start /frontend-example-docker
frontend    | > webpack --mode production && serve -s -l 5000 dist
frontend    | 
backend     | 
backend     | > backend-example-docker@1.0.0 start /backend-example-docker
backend     | > node index.js
backend     | 
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
frontend    | Time: 25574ms
frontend    | Built at: 11/05/2020 9:34:56 AM
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
backend     | ::ffff:172.23.0.1 - GET /slow HTTP/1.1 304 - - 6.832 ms

```
Reply from server: "Press to Test!" "Working! It took 0.034 seconds".

---------------------------------------
-----------------------------------------
