#!/bin/bash

test -f logs.txt || touch logs.txt
docker-compose up
