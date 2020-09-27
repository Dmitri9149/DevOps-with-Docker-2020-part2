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





