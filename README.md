### The exarcises for the Part 2 of the course : 

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



