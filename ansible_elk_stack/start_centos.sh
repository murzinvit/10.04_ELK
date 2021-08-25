#!/bin/bash
docker rm centos
docker run -d -p 9200:9200 -p 5601:5601 -p 9600-9700:9600-9700 -p 5044:5044 --name centos centos:latest sleep 60000000
docker ps